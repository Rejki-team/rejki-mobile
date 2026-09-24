import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain/domain.dart';

part 'history_pekerjaan_state.freezed.dart';

enum HistoryPekerjaanStatus { initial, loading, success, failure }

enum HistoryPekerjaanMutationStatus { initial, loading, success, failure }

/// Backend `list_lamaran_for_pelamar` tidak memaginasi hasil (mengembalikan
/// seluruh riwayat) — field `page`/`hasNext` lama dihapus, pengganti dari
/// `bids: List<BidEntity>`.
@freezed
abstract class HistoryPekerjaanState with _$HistoryPekerjaanState {
  const factory HistoryPekerjaanState({
    @Default(HistoryPekerjaanStatus.initial) HistoryPekerjaanStatus status,
    @Default([]) List<LamaranEntity> lamaranList,
    String? errorMessage,

    // Mutation states (Mulai Bekerja, Tandai Selesai & Beri Rating)
    @Default(HistoryPekerjaanMutationStatus.initial)
    HistoryPekerjaanMutationStatus mutationStatus,
    String? mutationSuccessMessage,
    String? mutationErrorMessage,
  }) = _HistoryPekerjaanState;
}
