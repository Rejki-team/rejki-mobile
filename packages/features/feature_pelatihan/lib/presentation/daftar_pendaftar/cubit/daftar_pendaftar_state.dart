import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain/domain.dart';

part 'daftar_pendaftar_state.freezed.dart';

@freezed
abstract class DaftarPendaftarState with _$DaftarPendaftarState {
  const factory DaftarPendaftarState({
    @Default([]) List<TrainingEnrollmentEntity> enrollments,
    @Default(false) bool isLoading,
    @Default(false) bool isFailure,
    String? errorMessage,
  }) = _DaftarPendaftarState;
}
