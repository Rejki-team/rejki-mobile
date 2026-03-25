import 'dart:io';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_job_event.freezed.dart';

@freezed
class CreateJobEvent with _$CreateJobEvent {
  const factory CreateJobEvent.titleChanged(String value) = TitleChanged;
  const factory CreateJobEvent.descriptionChanged(String value) =
      DescriptionChanged;
  const factory CreateJobEvent.requirementsChanged(String value) =
      RequirementsChanged;
  const factory CreateJobEvent.imagesChanged(List<File> images) = ImagesChanged;
  const factory CreateJobEvent.salaryTypeChanged(String value) =
      SalaryTypeChanged;
  const factory CreateJobEvent.salaryAmountChanged(String value) =
      SalaryAmountChanged;
  const factory CreateJobEvent.workerCountChanged(String value) =
      WorkerCountChanged;
  const factory CreateJobEvent.dateChanged(DateTime date) = DateChanged;
  const factory CreateJobEvent.timeChanged(TimeOfDay time) = TimeChanged;
  const factory CreateJobEvent.addressChanged(String value) = AddressChanged;
  const factory CreateJobEvent.provinceChanged(String province) =
      ProvinceChanged;
  const factory CreateJobEvent.cityChanged(String city) = CityChanged;
  const factory CreateJobEvent.districtChanged(String district) =
      DistrictChanged;
  const factory CreateJobEvent.wardChanged(String ward) = WardChanged;
  const factory CreateJobEvent.villageChanged(String value) = VillageChanged;
  const factory CreateJobEvent.locationCoordinatesChanged({
    double? latitude,
    double? longitude,
  }) = LocationCoordinatesChanged;
  const factory CreateJobEvent.submitJob() = SubmitJob;
}
