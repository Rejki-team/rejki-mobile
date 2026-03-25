import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_worker_params.freezed.dart';

@freezed
abstract class CreateWorkerParams with _$CreateWorkerParams {
  const factory CreateWorkerParams({
    required String fullName,
    required String education,
    required String available,
    required int desiredSalary,
    required bool isNegotiable,
    required String phoneNumber,
    required String workExperience,
    required String address,
    required String province,
    required String city,
    required String subdistrict,
    required String ward,
    required String village,
    required double latitude,
    required double longitude,
    required List<File> images,
  }) = _CreateWorkerParams;
}
