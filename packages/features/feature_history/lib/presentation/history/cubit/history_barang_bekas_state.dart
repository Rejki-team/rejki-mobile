import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain/domain.dart';

part 'history_barang_bekas_state.freezed.dart';

enum HistoryBarangBekasStatus { initial, loading, success, failure }

@freezed
abstract class HistoryBarangBekasState with _$HistoryBarangBekasState {
  const factory HistoryBarangBekasState({
    @Default(HistoryBarangBekasStatus.initial) HistoryBarangBekasStatus status,
    @Default([]) List<SecondhandEntity> claims,
    @Default(false) bool hasNext,
    @Default(1) int currentPage,
    String? errorMessage,
  }) = _HistoryBarangBekasState;
}
