import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'daftar_pelamar_state.dart';

/// "Kelola Pelamar" (PRD §5.11.5). Pengganti alur "Bid" lama — tidak ada lagi
/// sengketa, konfirmasi-ganda, atau pembatalan oleh pekerja; pemilik iklan
/// hanya bisa terima/tolak lamaran baru dan membatalkan lamaran yang sudah
/// diterima (maks H-24 jam sebelum mulai, alasan wajib, divalidasi backend).
@injectable
class DaftarPelamarCubit extends Cubit<DaftarPelamarState> {
  final GetLamaranForIklanUseCase _getLamaranForIklanUseCase;
  final ReviewLamaranUseCase _reviewLamaranUseCase;
  final BatalkanLamaranUseCase _batalkanLamaranUseCase;
  final SubmitWorkerReviewUseCase _submitWorkerReviewUseCase;

  DaftarPelamarCubit(
    this._getLamaranForIklanUseCase,
    this._reviewLamaranUseCase,
    this._batalkanLamaranUseCase,
    this._submitWorkerReviewUseCase,
  ) : super(const DaftarPelamarState());

  /// Backend tidak memaginasi/filter per status — 1 fetch, 3 tab difilter
  /// client-side via getter di [DaftarPelamarState].
  Future<void> loadLamaran(String iklanId) async {
    if (state.status == DaftarPelamarStatus.loading) return;

    emit(
      state.copyWith(status: DaftarPelamarStatus.loading, errorMessage: null),
    );

    final result = await _getLamaranForIklanUseCase(iklanId);

    if (isClosed) return;

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: DaftarPelamarStatus.failure,
          errorMessage: _mapFailure(failure),
        ),
      ),
      (data) => emit(
        state.copyWith(status: DaftarPelamarStatus.success, allLamaran: data),
      ),
    );
  }

  Future<void> terima({required String iklanId, required String lamaranId}) {
    return _review(iklanId: iklanId, lamaranId: lamaranId, approved: true);
  }

  Future<void> tolak({required String iklanId, required String lamaranId}) {
    return _review(iklanId: iklanId, lamaranId: lamaranId, approved: false);
  }

  Future<void> _review({
    required String iklanId,
    required String lamaranId,
    required bool approved,
  }) async {
    if (state.mutationStatus == DaftarPelamarMutationStatus.loading) return;

    emit(
      state.copyWith(
        mutationStatus: DaftarPelamarMutationStatus.loading,
        mutationErrorMessage: null,
        mutationSuccessMessage: null,
      ),
    );

    final result = await _reviewLamaranUseCase.execute(
      iklanId: iklanId,
      lamaranId: lamaranId,
      approved: approved,
    );

    if (isClosed) return;

    result.fold(
      (failure) => emit(
        state.copyWith(
          mutationStatus: DaftarPelamarMutationStatus.failure,
          mutationErrorMessage: _mapFailure(failure),
        ),
      ),
      (updated) {
        final list = state.allLamaran
            .map((l) => l.id == lamaranId ? updated : l)
            .toList();
        emit(
          state.copyWith(
            allLamaran: list,
            mutationStatus: DaftarPelamarMutationStatus.success,
            mutationSuccessMessage: approved
                ? 'Pelamar berhasil diterima.'
                : 'Pelamar berhasil ditolak.',
          ),
        );
      },
    );
  }

  /// PRD §5.11.5 — pembatalan lamaran Diterima, alasan wajib, maks H-24 jam
  /// sebelum mulai (divalidasi backend, bukan di sini).
  Future<void> batalkan({
    required String iklanId,
    required String lamaranId,
    required String alasan,
  }) async {
    if (state.mutationStatus == DaftarPelamarMutationStatus.loading) return;

    emit(
      state.copyWith(
        mutationStatus: DaftarPelamarMutationStatus.loading,
        mutationErrorMessage: null,
        mutationSuccessMessage: null,
      ),
    );

    final result = await _batalkanLamaranUseCase.execute(
      iklanId: iklanId,
      lamaranId: lamaranId,
      alasan: alasan,
    );

    if (isClosed) return;

    result.fold(
      (failure) => emit(
        state.copyWith(
          mutationStatus: DaftarPelamarMutationStatus.failure,
          mutationErrorMessage: _mapFailure(failure),
        ),
      ),
      (updated) {
        final list = state.allLamaran
            .map((l) => l.id == lamaranId ? updated : l)
            .toList();
        emit(
          state.copyWith(
            allLamaran: list,
            mutationStatus: DaftarPelamarMutationStatus.success,
            mutationSuccessMessage: 'Lamaran berhasil dibatalkan.',
          ),
        );
      },
    );
  }

  /// Pemberi kerja menilai pelamar setelah Lamaran Selesai (F-17, PRD §5.15,
  /// arah `pemberi_kerja_ke_pelamar`) — dipicu dari kartu "Pelamar Diterima".
  Future<void> beriRating({
    required String iklanId,
    required String pelamarId,
    required int bintang,
    String? ulasan,
  }) async {
    if (state.mutationStatus == DaftarPelamarMutationStatus.loading) return;

    emit(
      state.copyWith(
        mutationStatus: DaftarPelamarMutationStatus.loading,
        mutationErrorMessage: null,
        mutationSuccessMessage: null,
      ),
    );

    final result = await _submitWorkerReviewUseCase.execute(
      iklanId: iklanId,
      pelamarId: pelamarId,
      bintang: bintang,
      ulasan: ulasan,
    );

    if (isClosed) return;

    result.fold(
      (failure) => emit(
        state.copyWith(
          mutationStatus: DaftarPelamarMutationStatus.failure,
          mutationErrorMessage: _mapWorkerFailure(failure),
        ),
      ),
      (_) => emit(
        state.copyWith(
          mutationStatus: DaftarPelamarMutationStatus.success,
          mutationSuccessMessage: 'Kamu berhasil memberikan rating.',
        ),
      ),
    );
  }

  String _mapWorkerFailure(WorkerFailure failure) {
    return failure.map(
      serverError: (e) => e.message ?? 'Terjadi kesalahan server.',
      networkError: (_) => 'Tidak ada koneksi internet.',
      validationError: (e) => e.message,
      unknown: (_) => 'Terjadi kesalahan yang tidak diketahui.',
    );
  }

  void clearMutationState() {
    emit(
      state.copyWith(
        mutationStatus: DaftarPelamarMutationStatus.initial,
        mutationErrorMessage: null,
        mutationSuccessMessage: null,
      ),
    );
  }

  String _mapFailure(JobFailure failure) {
    return failure.map(
      serverError: (e) => e.message ?? 'Terjadi kesalahan server.',
      networkError: (_) => 'Tidak ada koneksi internet.',
      unauthorized: (_) => 'Sesi telah habis, silakan login kembali.',
      notFound: (_) => 'Data tidak ditemukan.',
      unknown: (_) => 'Terjadi kesalahan yang tidak diketahui.',
    );
  }
}
