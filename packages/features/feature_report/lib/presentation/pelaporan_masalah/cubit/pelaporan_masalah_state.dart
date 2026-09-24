import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pelaporan_masalah_state.freezed.dart';

@freezed
abstract class PelaporanMasalahState with _$PelaporanMasalahState {
  const factory PelaporanMasalahState({
    File? buktiImage,
    @Default('') String deskripsi,
    @Default(false) bool isSubmitting,
    @Default(false) bool isSuccess,
    String? errorMessage,
  }) = _PelaporanMasalahState;
}
