import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain/domain.dart';

part 'daftar_pelamar_state.freezed.dart';

enum DaftarPelamarStatus { initial, loading, success, failure }

enum DaftarPelamarMutationStatus { initial, loading, success, failure }

/// Backend `list_lamaran_for_iklan` mengembalikan seluruh lamaran untuk satu
/// iklan sekaligus (tidak dipaginasi, tidak difilter per status) — 1 fetch,
/// 3 tab (Pelamar/Diterima/Ditolak, PRD §5.11.5) difilter client-side dari
/// [allLamaran] via getter, pengganti 2 list terpisah + pagination lama.
@freezed
abstract class DaftarPelamarState with _$DaftarPelamarState {
  const DaftarPelamarState._();

  const factory DaftarPelamarState({
    @Default(DaftarPelamarStatus.initial) DaftarPelamarStatus status,
    @Default([]) List<LamaranEntity> allLamaran,
    String? errorMessage,

    // ── Mutation (Terima / Tolak / Batalkan) ──────────────────────────────────
    @Default(DaftarPelamarMutationStatus.initial)
    DaftarPelamarMutationStatus mutationStatus,
    String? mutationSuccessMessage,
    String? mutationErrorMessage,
  }) = _DaftarPelamarState;

  /// Tab "Pelamar" — belum diputuskan.
  List<LamaranEntity> get pelamarList =>
      allLamaran.where((l) => l.isDiajukan).toList();

  /// Tab "Pelamar Diterima" — diterima ATAU sudah mulai/selesai bekerja,
  /// supaya riwayat tetap terlihat setelah statusnya berubah lagi.
  List<LamaranEntity> get diterimaList => allLamaran
      .where((l) => l.isDiterima || l.isProses || l.isSelesai)
      .toList();

  /// Tab "Pelamar Ditolak".
  List<LamaranEntity> get ditolakList =>
      allLamaran.where((l) => l.isDitolak).toList();
}
