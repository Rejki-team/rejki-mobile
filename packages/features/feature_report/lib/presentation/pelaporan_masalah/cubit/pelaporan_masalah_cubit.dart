import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

import 'pelaporan_masalah_state.dart';

/// Batas bukti gambar (PRD §5.10/§6.10): maksimal 300 KB — SAMA PERSIS dengan
/// validasi backend (`300_000` byte, interpretasi desimal bukan 300*1024
/// biner) supaya klien tidak pernah lolos validasi lokal tapi ditolak server.
const int maxBuktiSizeBytes = 300000;

/// Pure function (testable tanpa I/O) — P3.5.
bool exceedsMaxBuktiSize(int bytes) => bytes > maxBuktiSizeBytes;

@injectable
class PelaporanMasalahCubit extends Cubit<PelaporanMasalahState> {
  final PelaporanMasalahUseCase _pelaporanMasalahUseCase;

  PelaporanMasalahCubit(this._pelaporanMasalahUseCase)
    : super(const PelaporanMasalahState());

  void setBuktiImage(File image) {
    emit(state.copyWith(buktiImage: image, errorMessage: null));
  }

  void setDeskripsi(String value) {
    emit(state.copyWith(deskripsi: value, errorMessage: null));
  }

  Future<void> submit({String? targetId}) async {
    if (state.deskripsi.trim().isEmpty) {
      emit(state.copyWith(errorMessage: 'Deskripsi masalah wajib diisi.'));
      return;
    }
    if (state.buktiImage == null) {
      emit(state.copyWith(errorMessage: 'Bukti gambar wajib diunggah.'));
      return;
    }
    if (state.isSubmitting) return;

    emit(state.copyWith(isSubmitting: true, errorMessage: null));

    File file = state.buktiImage!;
    var bytes = await file.readAsBytes();

    if (exceedsMaxBuktiSize(bytes.length)) {
      final compressed = await _tryCompress(file);
      if (compressed != null) {
        file = compressed;
        bytes = await file.readAsBytes();
      }
    }

    if (exceedsMaxBuktiSize(bytes.length)) {
      if (isClosed) return;
      emit(
        state.copyWith(
          isSubmitting: false,
          errorMessage:
              'Ukuran bukti gambar maksimal 300 KB. Pilih gambar lain atau '
              'kurangi resolusinya.',
        ),
      );
      return;
    }

    final result = await _pelaporanMasalahUseCase.execute(
      targetId: targetId,
      keterangan: state.deskripsi.trim(),
      buktiBytes: bytes,
      buktiMime: 'image/jpeg',
    );

    if (isClosed) return;

    result.fold(
      (failure) => emit(
        state.copyWith(isSubmitting: false, errorMessage: _mapFailure(failure)),
      ),
      (_) => emit(state.copyWith(isSubmitting: false, isSuccess: true)),
    );
  }

  Future<File?> _tryCompress(File original) async {
    try {
      final originalSize = await original.length();
      final tempDir = await getTemporaryDirectory();
      final targetPath =
          '${tempDir.path}/pelaporan_masalah_${DateTime.now().millisecondsSinceEpoch}.jpg';
      final quality = ((maxBuktiSizeBytes / originalSize) * 85)
          .clamp(10, 85)
          .toInt();
      final compressed = await FlutterImageCompress.compressAndGetFile(
        original.path,
        targetPath,
        quality: quality,
      );
      return compressed != null ? File(compressed.path) : null;
    } catch (_) {
      return null;
    }
  }

  String _mapFailure(ReportFailure failure) {
    return failure.map(
      serverError: (e) => e.message ?? 'Terjadi kesalahan server.',
      networkError: (_) => 'Tidak ada koneksi internet.',
      validationError: (e) => e.message,
      unknown: (_) => 'Terjadi kesalahan yang tidak diketahui.',
    );
  }
}
