import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_worker_ad_state.freezed.dart';

@freezed
abstract class CreateWorkerAdState with _$CreateWorkerAdState {
  const factory CreateWorkerAdState({
    @Default('') String fullName,
    @Default('') String education,
    @Default('') String workingHours,
    @Default('') String minimumWage,
    @Default('Ya') String isNegotiable,
    @Default('') String phoneNumber,
    @Default('') String experience,
    @Default([]) List<File> photos,
    @Default('') String domicileAddress,
    @Default('') String country,
    @Default('') String province,
    @Default('') String city,
    @Default('') String district,
    @Default('') String subdistrict,
    @Default('') String village,
    // Status flag
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
    String? errorMessage,
  }) = _CreateWorkerAdState;

  const CreateWorkerAdState._();

  bool get isFormValid {
    return fullName.isNotEmpty &&
        education.isNotEmpty &&
        experience.isNotEmpty &&
        photos.isNotEmpty;
  }
}
