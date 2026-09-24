import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain/domain.dart';

part 'daftar_bider_state.freezed.dart';

enum DaftarBiderStatus { initial, loading, success, failure }

enum DaftarBiderMutationStatus { initial, loading, success, failure }

/// "Kelola Iklan Saya" (P4.8, PRD §5.14.2) — daftar bider untuk satu iklan.
/// Backend `list_bider` mengembalikan seluruh bider sekaligus (tidak
/// dipaginasi/difilter per status) — tidak ada struktur tab eksplisit di PRD
/// untuk barang bekas (beda dengan Kelola Pelamar 3-tab), jadi satu list saja,
/// tombol Setujui/Withdraw hanya tampil untuk bider berstatus `menunggu`.
@freezed
abstract class DaftarBiderState with _$DaftarBiderState {
  const factory DaftarBiderState({
    @Default(DaftarBiderStatus.initial) DaftarBiderStatus status,
    @Default([]) List<BiderEntity> biderList,
    String? errorMessage,

    // ── Mutation (Setujui / Withdraw) ────────────────────────────────────────
    @Default(DaftarBiderMutationStatus.initial)
    DaftarBiderMutationStatus mutationStatus,
    String? mutationSuccessMessage,
    String? mutationErrorMessage,
  }) = _DaftarBiderState;
}
