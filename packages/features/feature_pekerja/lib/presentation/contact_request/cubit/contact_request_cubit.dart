import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'contact_request_state.dart';

@injectable
class ContactRequestCubit extends Cubit<ContactRequestState> {
  final GetIncomingContactsUseCase _getIncomingContactsUseCase;
  final UpdateWorkerContactStatusUseCase _updateWorkerContactStatusUseCase;

  ContactRequestCubit(
    this._getIncomingContactsUseCase,
    this._updateWorkerContactStatusUseCase,
  ) : super(const ContactRequestState());

  // ── Tab Permintaan (status=request) ─────────────────────────────────────────

  Future<void> loadPermintaan({
    required String workerId,
    bool refresh = false,
  }) async {
    if (state.permintaanStatus == ContactRequestStatus.loading ||
        state.permintaanStatus == ContactRequestStatus.loadingMore) {
      return;
    }

    if (refresh) {
      emit(
        state.copyWith(
          permintaanStatus: ContactRequestStatus.loading,
          permintaanPage: 1,
          permintaanList: [],
          permintaanHasNext: true,
          permintaanError: null,
        ),
      );
    } else {
      if (!state.permintaanHasNext) return;
      emit(
        state.copyWith(
          permintaanStatus: state.permintaanList.isEmpty
              ? ContactRequestStatus.loading
              : ContactRequestStatus.loadingMore,
          permintaanError: null,
        ),
      );
    }

    final result = await _getIncomingContactsUseCase.execute(
      status: 'request',
      page: state.permintaanPage,
      limit: 10,
    );

    if (isClosed) return;

    result.fold(
      (failure) => emit(
        state.copyWith(
          permintaanStatus: ContactRequestStatus.failure,
          permintaanError: _mapFailure(failure),
        ),
      ),
      (data) {
        final merged = refresh
            ? data.contacts
            : [...state.permintaanList, ...data.contacts];
        emit(
          state.copyWith(
            permintaanStatus: ContactRequestStatus.success,
            permintaanList: merged,
            permintaanPage: state.permintaanPage + 1,
            permintaanHasNext: data.hasNext,
          ),
        );
      },
    );
  }

  // ── Tab Diterima (status=approve) ───────────────────────────────────────────

  Future<void> loadDiterima({
    required String workerId,
    bool refresh = false,
  }) async {
    if (state.diterimaStatus == ContactRequestStatus.loading ||
        state.diterimaStatus == ContactRequestStatus.loadingMore) {
      return;
    }

    if (refresh) {
      emit(
        state.copyWith(
          diterimaStatus: ContactRequestStatus.loading,
          diterimaPage: 1,
          diterimaList: [],
          diterimaHasNext: true,
          diterimaError: null,
        ),
      );
    } else {
      if (!state.diterimaHasNext) return;
      emit(
        state.copyWith(
          diterimaStatus: state.diterimaList.isEmpty
              ? ContactRequestStatus.loading
              : ContactRequestStatus.loadingMore,
          diterimaError: null,
        ),
      );
    }

    final result = await _getIncomingContactsUseCase.execute(
      status: 'approve',
      page: state.diterimaPage,
      limit: 10,
    );

    if (isClosed) return;

    result.fold(
      (failure) => emit(
        state.copyWith(
          diterimaStatus: ContactRequestStatus.failure,
          diterimaError: _mapFailure(failure),
        ),
      ),
      (data) {
        final merged = refresh
            ? data.contacts
            : [...state.diterimaList, ...data.contacts];
        emit(
          state.copyWith(
            diterimaStatus: ContactRequestStatus.success,
            diterimaList: merged,
            diterimaPage: state.diterimaPage + 1,
            diterimaHasNext: data.hasNext,
          ),
        );
      },
    );
  }

  // ── Mutations ────────────────────────────────────────────────────────────────

  Future<void> terima({
    required String workerId,
    required String contactId,
  }) async {
    if (state.mutationStatus == ContactRequestMutationStatus.loading) return;

    emit(
      state.copyWith(
        mutationStatus: ContactRequestMutationStatus.loading,
        mutationErrorMessage: null,
        mutationSuccessMessage: null,
      ),
    );

    final result = await _updateWorkerContactStatusUseCase.execute(
      workerId: workerId,
      contactId: contactId,
      status: 'approve',
    );

    if (isClosed) return;

    result.fold(
      (failure) => emit(
        state.copyWith(
          mutationStatus: ContactRequestMutationStatus.failure,
          mutationErrorMessage: _mapFailure(failure),
        ),
      ),
      (_) {
        final accepted = state.permintaanList
            .where((c) => c.id == contactId)
            .map((c) => c.copyWith(status: 'approve'))
            .toList();

        emit(
          state.copyWith(
            permintaanList: state.permintaanList
                .where((c) => c.id != contactId)
                .toList(),
            diterimaList: [...state.diterimaList, ...accepted],
            mutationStatus: ContactRequestMutationStatus.success,
            mutationSuccessMessage: 'Permintaan kontak berhasil diterima.',
          ),
        );
      },
    );
  }

  Future<void> tolak({
    required String workerId,
    required String contactId,
  }) async {
    if (state.mutationStatus == ContactRequestMutationStatus.loading) return;

    emit(
      state.copyWith(
        mutationStatus: ContactRequestMutationStatus.loading,
        mutationErrorMessage: null,
        mutationSuccessMessage: null,
      ),
    );

    final result = await _updateWorkerContactStatusUseCase.execute(
      workerId: workerId,
      contactId: contactId,
      status: 'decline',
    );

    if (isClosed) return;

    result.fold(
      (failure) => emit(
        state.copyWith(
          mutationStatus: ContactRequestMutationStatus.failure,
          mutationErrorMessage: _mapFailure(failure),
        ),
      ),
      (_) => emit(
        state.copyWith(
          permintaanList: state.permintaanList
              .where((c) => c.id != contactId)
              .toList(),
          mutationStatus: ContactRequestMutationStatus.success,
          mutationSuccessMessage: 'Permintaan kontak berhasil ditolak.',
        ),
      ),
    );
  }

  void clearMutationState() {
    emit(
      state.copyWith(
        mutationStatus: ContactRequestMutationStatus.initial,
        mutationErrorMessage: null,
        mutationSuccessMessage: null,
      ),
    );
  }

  String _mapFailure(WorkerFailure failure) {
    return failure.map(
      serverError: (e) => e.message ?? 'Terjadi kesalahan server.',
      networkError: (_) => 'Tidak ada koneksi internet.',
      validationError: (v) => v.message,
      unknown: (_) => 'Terjadi kesalahan yang tidak diketahui.',
    );
  }
}
