import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain/domain.dart';

part 'history_barang_bekas_state.freezed.dart';

enum HistoryBarangBekasStatus { initial, loading, success, failure }

/// Tab "Aktifitas" → chip "Barang Bekas" (F-15) — daftar Bider milik peminat
/// yang login (P4.11, `GET /barang/bider/saya`), pengganti
/// `GetMyClaimedSecondhandsUseCase` lama (claim biner tanpa status Bider).
@freezed
abstract class HistoryBarangBekasState with _$HistoryBarangBekasState {
  const factory HistoryBarangBekasState({
    @Default(HistoryBarangBekasStatus.initial) HistoryBarangBekasStatus status,
    @Default([]) List<BiderEntity> biderList,
    String? errorMessage,
  }) = _HistoryBarangBekasState;
}
