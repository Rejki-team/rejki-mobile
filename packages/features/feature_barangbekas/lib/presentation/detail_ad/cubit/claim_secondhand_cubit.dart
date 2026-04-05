import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';

import 'claim_secondhand_state.dart';

class ClaimSecondhandCubit extends Cubit<ClaimSecondhandState> {
  final ClaimSecondhandUseCase _claimUseCase;

  ClaimSecondhandCubit(this._claimUseCase)
      : super(const ClaimSecondhandState.initial());

  Future<void> claim(String id) async {
    emit(const ClaimSecondhandState.submitting());

    final result = await _claimUseCase(id);

    if (isClosed) return;

    result.fold(
      (failure) => emit(ClaimSecondhandState.failure(_mapFailure(failure))),
      (_) => emit(const ClaimSecondhandState.success()),
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
