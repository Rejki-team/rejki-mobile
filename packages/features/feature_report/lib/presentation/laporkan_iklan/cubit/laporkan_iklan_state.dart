import 'package:freezed_annotation/freezed_annotation.dart';

part 'laporkan_iklan_state.freezed.dart';

@freezed
abstract class LaporkanIklanState with _$LaporkanIklanState {
  const factory LaporkanIklanState({
    @Default(false) bool isSubmitting,
    @Default(false) bool isSuccess,
    String? errorMessage,
  }) = _LaporkanIklanState;
}
