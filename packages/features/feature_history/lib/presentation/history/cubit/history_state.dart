import 'package:freezed_annotation/freezed_annotation.dart';

part 'history_state.freezed.dart';

@freezed
abstract class HistoryState with _$HistoryState {
  const factory HistoryState({
    @Default(false) bool isLoading,
    @Default(0) int selectedTabIndex, // 0: Aktifitas, 1: Iklan Saya
    @Default('Pekerjaan')
    String selectedFilter, // Chips: Pekerjaan, Pekerja, Pelatihan, Barang Bekas
    String? errorMessage,
  }) = _HistoryState;
}
