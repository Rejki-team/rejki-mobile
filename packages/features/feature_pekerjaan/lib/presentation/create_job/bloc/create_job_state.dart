import 'dart:io';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:core/validators/validators.dart';
import 'package:domain/domain.dart';

part 'create_job_state.freezed.dart';

@freezed
sealed class CreateJobState with _$CreateJobState {
  const CreateJobState._();

  const factory CreateJobState({
    @Default(TextInput.pure()) TextInput title,
    @Default(TextInput.pure()) TextInput description,
    @Default(TextInput.pure()) TextInput requirements,
    @Default([]) List<File> images,
    @Default('') String salaryType, // Changed: dropdown for salary type
    @Default('') String salaryAmount, // Changed: currency input
    @Default('') String workerCount,
    DateTime? selectedDate,
    TimeOfDay? selectedTime,
    @Default(TextInput.pure()) TextInput address,
    String? selectedProvince,
    String? selectedCity,
    String? selectedDistrict,
    String? selectedWard,
    @Default(TextInput.pure()) TextInput village, // New field
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
    JobFailure? failure, // Using shared JobFailure
    // GPS coordinates — nullable (GPS may not be available)
    double? latitude,
    double? longitude,
  }) = _CreateJobState;

  bool get isValid =>
      title.isValid &&
      description.isValid &&
      requirements.isValid &&
      images.isNotEmpty &&
      salaryType.isNotEmpty &&
      salaryAmount.isNotEmpty &&
      workerCount.isNotEmpty &&
      selectedDate != null &&
      selectedTime != null &&
      address.isValid &&
      selectedProvince != null &&
      selectedCity != null &&
      selectedDistrict != null &&
      selectedWard != null;
}
