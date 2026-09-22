import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'history_pekerjaan_state.dart';

/// "Riwayat Aktifitas Pelamar" (PRD §5.11.4). Pengganti alur "Bid" lama —
/// tidak ada lagi konfirmasi-ganda pemilik iklan; pelamar mulai bekerja
/// (geofence 50m, GPS dibaca di widget lalu dikirim ke sini) dan menandai
/// selesai sendiri.
@injectable
class HistoryPekerjaanCubit extends Cubit<HistoryPekerjaanState> {
  final GetLamaranSayaUseCase _getLamaranSayaUseCase;
  final MulaiBekerjaUseCase _mulaiBekerjaUseCase;
  final TandaiSelesaiUseCase _tandaiSelesaiUseCase;
  final CreateJobReviewUseCase _createJobReviewUseCase;

  HistoryPekerjaanCubit(
    this._getLamaranSayaUseCase,
    this._mulaiBekerjaUseCase,
    this._tandaiSelesaiUseCase,
    this._createJobReviewUseCase,
  ) : super(const HistoryPekerjaanState());

  /// Backend tidak memaginasi hasil ini — selalu muat ulang seluruh riwayat.
  Future<void> loadLamaran() async {
    if (state.status == HistoryPekerjaanStatus.loading) return;

    emit(
      state.copyWith(
        status: HistoryPekerjaanStatus.loading,
        errorMessage: null,
      ),
    );

    final result = await _getLamaranSayaUseCase();

    if (isClosed) return;

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: HistoryPekerjaanStatus.failure,
          errorMessage: _mapFailureToMessage(failure),
        ),
      ),
      (data) => emit(
        state.copyWith(
          status: HistoryPekerjaanStatus.success,
          lamaranList: data,
        ),
      ),
    );
  }

  /// PRD §5.11.4 — tombol "Mulai Bekerja", hanya aktif dalam radius 50m dari
  /// alamat iklan (divalidasi backend). [latitude]/[longitude] dari GPS
  /// device, dibaca di widget (bukan di cubit — I/O platform bukan tanggung
  /// jawab layer ini).
  Future<void> mulaiBekerja({
    required String iklanId,
    required String lamaranId,
    required double latitude,
    required double longitude,
  }) async {
    if (state.mutationStatus == HistoryPekerjaanMutationStatus.loading) return;

    emit(
      state.copyWith(
        mutationStatus: HistoryPekerjaanMutationStatus.loading,
        mutationErrorMessage: null,
        mutationSuccessMessage: null,
      ),
    );

    final result = await _mulaiBekerjaUseCase.execute(
      iklanId: iklanId,
      lamaranId: lamaranId,
      latitude: latitude,
      longitude: longitude,
    );

    if (isClosed) return;

    result.fold(
      (failure) => emit(
        state.copyWith(
          mutationStatus: HistoryPekerjaanMutationStatus.failure,
          mutationErrorMessage: _mapFailureToMessage(failure),
        ),
      ),
      (updated) {
        final list = state.lamaranList
            .map((l) => l.id == lamaranId ? updated : l)
            .toList();
        emit(
          state.copyWith(
            lamaranList: list,
            mutationStatus: HistoryPekerjaanMutationStatus.success,
            mutationSuccessMessage: 'Kamu telah mulai bekerja.',
          ),
        );
      },
    );
  }

  /// PRD §5.11.4 — tombol "Tandai Pekerjaan Selesai".
  Future<void> tandaiSelesai({
    required String iklanId,
    required String lamaranId,
  }) async {
    if (state.mutationStatus == HistoryPekerjaanMutationStatus.loading) return;

    emit(
      state.copyWith(
        mutationStatus: HistoryPekerjaanMutationStatus.loading,
        mutationErrorMessage: null,
        mutationSuccessMessage: null,
      ),
    );

    final result = await _tandaiSelesaiUseCase.execute(
      iklanId: iklanId,
      lamaranId: lamaranId,
    );

    if (isClosed) return;

    result.fold(
      (failure) => emit(
        state.copyWith(
          mutationStatus: HistoryPekerjaanMutationStatus.failure,
          mutationErrorMessage: _mapFailureToMessage(failure),
        ),
      ),
      (updated) {
        final list = state.lamaranList
            .map((l) => l.id == lamaranId ? updated : l)
            .toList();
        emit(
          state.copyWith(
            lamaranList: list,
            mutationStatus: HistoryPekerjaanMutationStatus.success,
            mutationSuccessMessage: 'Pekerjaan berhasil ditandai selesai.',
          ),
        );
      },
    );
  }

  /// Pelamar menilai pemberi kerja (F-17, PRD §5.15, arah
  /// `pelamar_ke_pemberi_kerja`). [posterId] = `LamaranEntity.iklanPosterId`.
  Future<void> submitReview({
    required String iklanId,
    required String posterId,
    required int bintang,
    String? ulasan,
  }) async {
    if (state.mutationStatus == HistoryPekerjaanMutationStatus.loading) return;

    emit(
      state.copyWith(
        mutationStatus: HistoryPekerjaanMutationStatus.loading,
        mutationErrorMessage: null,
        mutationSuccessMessage: null,
      ),
    );

    final result = await _createJobReviewUseCase.execute(
      iklanId: iklanId,
      posterId: posterId,
      bintang: bintang,
      ulasan: ulasan,
    );

    if (isClosed) return;

    result.fold(
      (failure) => emit(
        state.copyWith(
          mutationStatus: HistoryPekerjaanMutationStatus.failure,
          mutationErrorMessage: _mapFailureToMessage(failure),
        ),
      ),
      (_) => emit(
        state.copyWith(
          mutationStatus: HistoryPekerjaanMutationStatus.success,
          mutationSuccessMessage: 'Kamu berhasil memberikan rating',
        ),
      ),
    );
  }

  void clearMutationState() {
    emit(
      state.copyWith(
        mutationStatus: HistoryPekerjaanMutationStatus.initial,
        mutationErrorMessage: null,
        mutationSuccessMessage: null,
      ),
    );
  }

  String _mapFailureToMessage(JobFailure failure) {
    return failure.map(
      serverError: (e) => e.message ?? 'Terjadi kesalahan server.',
      networkError: (_) => 'Tidak ada koneksi internet.',
      unauthorized: (_) => 'Sesi telah habis, silakan login kembali.',
      notFound: (_) => 'Data pekerjaan tidak ditemukan.',
      unknown: (_) => 'Terjadi kesalahan yang tidak diketahui.',
    );
  }
}
