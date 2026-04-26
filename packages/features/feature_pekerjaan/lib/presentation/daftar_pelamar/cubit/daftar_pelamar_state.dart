import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain/domain.dart';

part 'daftar_pelamar_state.freezed.dart';

enum DaftarPelamarStatus { initial, loading, loadingMore, success, failure }

enum DaftarPelamarMutationStatus { initial, loading, success, failure }

@freezed
abstract class DaftarPelamarState with _$DaftarPelamarState {
  const factory DaftarPelamarState({
    // ── Tab Pelamar (status=request) ──────────────────────────────────────────
    @Default(DaftarPelamarStatus.initial) DaftarPelamarStatus pelamarStatus,
    @Default([]) List<BidEntity> pelamarList,
    @Default(1) int pelamarPage,
    @Default(true) bool pelamarHasNext,
    String? pelamarError,

    // ── Tab Pelamar Diterima (status=approve) ─────────────────────────────────
    @Default(DaftarPelamarStatus.initial)
    DaftarPelamarStatus diterimaStatus,
    @Default([]) List<BidEntity> diterimaList,
    @Default(1) int diterimaPage,
    @Default(true) bool diterimaHasNext,
    String? diterimaError,

    // ── Mutation (Terima / Tolak) ─────────────────────────────────────────────
    @Default(DaftarPelamarMutationStatus.initial)
    DaftarPelamarMutationStatus mutationStatus,
    String? mutationSuccessMessage,
    String? mutationErrorMessage,
  }) = _DaftarPelamarState;
}
