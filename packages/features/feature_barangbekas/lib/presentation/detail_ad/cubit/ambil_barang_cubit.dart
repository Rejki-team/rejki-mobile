import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';

import 'ambil_barang_state.dart';

/// "Ambil Barang" (P3.2, PRD §5.14.1) — pengganti `ClaimSecondhandCubit` lama.
class AmbilBarangCubit extends Cubit<AmbilBarangState> {
  final AmbilBarangUseCase _ambilBarangUseCase;

  AmbilBarangCubit(this._ambilBarangUseCase)
    : super(const AmbilBarangState.initial());

  Future<void> ambil(String iklanId) async {
    emit(const AmbilBarangState.submitting());

    final result = await _ambilBarangUseCase(iklanId);

    if (isClosed) return;

    result.fold(
      (failure) => emit(AmbilBarangState.failure(_mapFailure(failure))),
      (_) => emit(const AmbilBarangState.success()),
    );
  }

  String _mapFailure(SecondhandFailure failure) {
    return failure.when(
      serverError: (msg) => msg ?? 'Terjadi kesalahan dari server.',
      networkError: () => 'Tidak ada koneksi internet.',
      unauthorized: () => 'Sesi habis, silakan login ulang.',
      notFound: () => 'Barang bekas tidak ditemukan.',
      validationError: (msg) => msg,
      unknown: () => 'Terjadi kesalahan. Coba lagi.',
    );
  }
}
