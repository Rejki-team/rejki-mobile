import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_training_ad_state.freezed.dart';

@freezed
abstract class CreateTrainingAdState with _$CreateTrainingAdState {
  const factory CreateTrainingAdState({
    @Default('ridwanaam@gmail.com') String email,
    @Default('PT ABC') String companyName,
    @Default('Oprasional HEad') String position,
    @Default('SkillUp: Pelatihan Peningkatan Keterampilan Pekerja')
    String title,
    @Default(
      'Pelatihan ini dirancang untuk meningkatkan keterampilan teknis dan produktivitas pekerja kerah biru.',
    )
    String description,
    @Default('22/06/2025') String date,
    @Default('14:00') String time,
    @Default('Gedung Pertemuan RW Jl Pisang BAru RT 01 RW 03') String location,
    @Default('Indonesia') String country,
    @Default('Pernah jadi tukang masak di warteg, dan pernah jadi kurir angkut')
    String cost,
    @Default(false) bool isSubmitting,
    @Default(false) bool isSuccess,
    String? errorMessage,
  }) = _CreateTrainingAdState;

  const CreateTrainingAdState._();

  bool get isFormValid {
    return email.isNotEmpty && companyName.isNotEmpty && cost.isNotEmpty;
  }
}
