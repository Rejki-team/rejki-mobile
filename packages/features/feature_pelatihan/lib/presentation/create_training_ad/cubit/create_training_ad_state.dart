import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_training_ad_state.freezed.dart';

@freezed
abstract class CreateTrainingAdState with _$CreateTrainingAdState {
  const factory CreateTrainingAdState({
    @Default('') String email,
    @Default('') String companyName,
    @Default('') String position,
    @Default('') String title,
    @Default('') String description,
    @Default('') String date,
    @Default('') String time,
    @Default('') String location,
    @Default('') String country,
    @Default('') String cost,
    @Default('') String bankName,
    @Default('') String bankAccountNumber,
    @Default('') String bankAccountHolderName,
    @Default([]) List<String> facilities,
    @Default(false) bool isSubmitting,
    @Default(false) bool isSuccess,
    String? errorMessage,
  }) = _CreateTrainingAdState;

  const CreateTrainingAdState._();

  bool get isFormValid {
    return title.isNotEmpty &&
        companyName.isNotEmpty &&
        description.isNotEmpty &&
        location.isNotEmpty &&
        bankName.isNotEmpty &&
        bankAccountNumber.isNotEmpty &&
        bankAccountHolderName.isNotEmpty;
  }
}
