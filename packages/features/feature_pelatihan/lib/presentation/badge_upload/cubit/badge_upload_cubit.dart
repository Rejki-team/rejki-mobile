import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

import 'badge_upload_state.dart';

@injectable
class BadgeUploadCubit extends Cubit<BadgeUploadState> {
  final SubmitTrainingBadgeUseCase _submitTrainingBadgeUseCase;

  BadgeUploadCubit(this._submitTrainingBadgeUseCase)
      : super(const BadgeUploadState());

  void setBadgeImage(File image) {
    emit(state.copyWith(badgeImage: image, errorMessage: null));
  }

  void setParticipantName(String name) {
    emit(state.copyWith(participantName: name, errorMessage: null));
  }

  Future<void> submitBadge(String trainingId) async {
    if (state.badgeImage == null) {
      emit(state.copyWith(errorMessage: 'Pilih gambar badge terlebih dahulu.'));
      return;
    }
    if (state.participantName.trim().isEmpty) {
      emit(state.copyWith(errorMessage: 'Nama peserta wajib diisi.'));
      return;
    }
    if (state.isSubmitting) return;

    emit(state.copyWith(isSubmitting: true, errorMessage: null));

    File fileToUpload = state.badgeImage!;
    try {
      final originalSize = await state.badgeImage!.length();
      if (originalSize > 2 * 1024 * 1024) {
        final tempDir = await getTemporaryDirectory();
        final targetPath = '${tempDir.path}/badge_upload_compressed.jpg';
        final quality =
            ((2 * 1024 * 1024 / originalSize) * 80).clamp(20, 80).toInt();
        final compressed = await FlutterImageCompress.compressAndGetFile(
          state.badgeImage!.path,
          targetPath,
          quality: quality,
        );
        if (compressed != null) fileToUpload = File(compressed.path);
      }
    } catch (_) {
      // Use original file if compression fails
    }

    final result = await _submitTrainingBadgeUseCase(
      trainingId: trainingId,
      filePath: fileToUpload.path,
      participantName: state.participantName.trim(),
    );

    if (isClosed) return;

    result.fold(
      (failure) => emit(state.copyWith(
        isSubmitting: false,
        errorMessage: failure.maybeWhen(
          serverError: (msg) => msg ?? 'Terjadi kesalahan pada server',
          orElse: () => 'Gagal mengupload badge.',
        ),
      )),
      (_) => emit(state.copyWith(isSubmitting: false, isSuccess: true)),
    );
  }
}
