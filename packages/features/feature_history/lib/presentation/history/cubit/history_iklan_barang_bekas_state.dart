import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain/domain.dart';

part 'history_iklan_barang_bekas_state.freezed.dart';

enum HistoryIklanBarangBekasStatus {
  initial,
  loading,
  loadingMore,
  success,
  failure,
}

/// State untuk tab "Iklan Saya" → chip "Barang Bekas" (P4.8, entry point ke
/// "Kelola Iklan Saya" — pola kembar `HistoryIklanPekerjaanState`).
@freezed
abstract class HistoryIklanBarangBekasState
    with _$HistoryIklanBarangBekasState {
  const factory HistoryIklanBarangBekasState({
    @Default(HistoryIklanBarangBekasStatus.initial)
    HistoryIklanBarangBekasStatus status,
    @Default([]) List<SecondhandEntity> ads,
    @Default(1) int page,
    @Default(true) bool hasNext,
    String? errorMessage,
  }) = _HistoryIklanBarangBekasState;
}
