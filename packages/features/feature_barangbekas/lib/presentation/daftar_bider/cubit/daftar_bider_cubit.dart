import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'daftar_bider_state.dart';

/// "Kelola Iklan Saya" (P4.8, PRD §5.14.2) — daftar bider + Setujui/Withdraw.
@injectable
class DaftarBiderCubit extends Cubit<DaftarBiderState> {
  final GetBiderForIklanUseCase _getBiderForIklanUseCase;
  final SetujuiBiderUseCase _setujuiBiderUseCase;
  final WithdrawBiderUseCase _withdrawBiderUseCase;

  DaftarBiderCubit(
    this._getBiderForIklanUseCase,
    this._setujuiBiderUseCase,
    this._withdrawBiderUseCase,
  ) : super(const DaftarBiderState());

  Future<void> loadBider(String iklanId) async {
    if (state.status == DaftarBiderStatus.loading) return;

    emit(state.copyWith(status: DaftarBiderStatus.loading, errorMessage: null));

    final result = await _getBiderForIklanUseCase(iklanId);

    if (isClosed) return;

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: DaftarBiderStatus.failure,
          errorMessage: _mapFailure(failure),
        ),
      ),
      (data) => emit(
        state.copyWith(status: DaftarBiderStatus.success, biderList: data),
      ),
    );
  }

  /// PRD §5.14.2 — dialog "apakah bider sudah menghubungi" sebelum menyetujui.
  Future<void> setujui({
    required String iklanId,
    required String biderId,
    required bool sudahMenghubungi,
  }) async {
    if (state.mutationStatus == DaftarBiderMutationStatus.loading) return;

    emit(
      state.copyWith(
        mutationStatus: DaftarBiderMutationStatus.loading,
        mutationErrorMessage: null,
        mutationSuccessMessage: null,
      ),
    );

    final result = await _setujuiBiderUseCase(
      iklanId: iklanId,
      biderId: biderId,
      sudahMenghubungi: sudahMenghubungi,
    );

    if (isClosed) return;

    result.fold(
      (failure) => emit(
        state.copyWith(
          mutationStatus: DaftarBiderMutationStatus.failure,
          mutationErrorMessage: _mapFailure(failure),
        ),
      ),
      (updated) {
        final list = state.biderList
            .map((b) => b.id == biderId ? updated : b)
            .toList();
        emit(
          state.copyWith(
            biderList: list,
            mutationStatus: DaftarBiderMutationStatus.success,
            mutationSuccessMessage: 'Bider berhasil disetujui.',
          ),
        );
      },
    );
  }

  Future<void> withdraw({
    required String iklanId,
    required String biderId,
  }) async {
    if (state.mutationStatus == DaftarBiderMutationStatus.loading) return;

    emit(
      state.copyWith(
        mutationStatus: DaftarBiderMutationStatus.loading,
        mutationErrorMessage: null,
        mutationSuccessMessage: null,
      ),
    );

    final result = await _withdrawBiderUseCase(
      iklanId: iklanId,
      biderId: biderId,
    );

    if (isClosed) return;

    result.fold(
      (failure) => emit(
        state.copyWith(
          mutationStatus: DaftarBiderMutationStatus.failure,
          mutationErrorMessage: _mapFailure(failure),
        ),
      ),
      (updated) {
        final list = state.biderList
            .map((b) => b.id == biderId ? updated : b)
            .toList();
        emit(
          state.copyWith(
            biderList: list,
            mutationStatus: DaftarBiderMutationStatus.success,
            mutationSuccessMessage: 'Bider berhasil di-withdraw.',
          ),
        );
      },
    );
  }

  void clearMutationState() {
    emit(
      state.copyWith(
        mutationStatus: DaftarBiderMutationStatus.initial,
        mutationErrorMessage: null,
        mutationSuccessMessage: null,
      ),
    );
  }

  String _mapFailure(SecondhandFailure failure) {
    return failure.when(
      serverError: (msg) => msg ?? 'Terjadi kesalahan dari server.',
      networkError: () => 'Tidak ada koneksi internet.',
      unauthorized: () => 'Sesi habis, silakan login ulang.',
      notFound: () => 'Data tidak ditemukan.',
      validationError: (msg) => msg,
      unknown: () => 'Terjadi kesalahan. Coba lagi.',
    );
  }
}
