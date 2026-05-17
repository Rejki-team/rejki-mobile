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
    @Default('') String address,
    @Default('') String province,
    @Default('') String city,
    @Default('') String district,
    @Default('') String village,
    @Default('') String location,
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
    return email.isNotEmpty &&
        companyName.isNotEmpty &&
        position.isNotEmpty &&
        title.isNotEmpty &&
        description.isNotEmpty &&
        date.isNotEmpty &&
        time.isNotEmpty &&
        address.isNotEmpty &&
        location.isNotEmpty &&
        cost.isNotEmpty &&
        bankName.isNotEmpty &&
        bankAccountNumber.isNotEmpty &&
        bankAccountHolderName.isNotEmpty;
  }
}
