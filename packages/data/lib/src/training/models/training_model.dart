import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain/domain.dart';
import 'training_image_model.dart';

part 'training_model.freezed.dart';
part 'training_model.g.dart';

@freezed
abstract class TrainingModel with _$TrainingModel {
  const TrainingModel._();

  const factory TrainingModel({
    required String id,
    required String title,
    required String description,
    @JsonKey(name: 'company_name') required String companyName,
    @JsonKey(name: 'location_address') required String locationAddress,
    @JsonKey(name: 'date_of_training') required String dateOfTraining,
    @JsonKey(name: 'fee_per_person') required int feePerPerson,
    required String status,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'ad_code') String? adCode,
    String? email,
    String? role,
    String? province,
    String? city,
    String? district,
    String? village,
    String? certificate,
    @JsonKey(name: 'bank_name') @Default('') String bankName,
    @JsonKey(name: 'bank_account_number') @Default('') String bankAccountNumber,
    @JsonKey(name: 'bank_account_holder_name') @Default('') String bankAccountHolderName,
    @Default([]) List<String> facilities,
    @JsonKey(name: 'total_approved_enrollees') @Default(0) int totalApprovedEnrollees,
    @Default([]) List<TrainingImageModel> images,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _TrainingModel;

  factory TrainingModel.fromJson(Map<String, dynamic> json) =>
      _$TrainingModelFromJson(json);

  TrainingEntity toEntity() {
    return TrainingEntity(
      id: id,
      title: title,
      description: description,
      companyName: companyName,
      locationAddress: locationAddress,
      dateOfTraining: dateOfTraining,
      feePerPerson: feePerPerson,
      status: status,
      userId: userId,
      adCode: adCode,
      email: email,
      role: role,
      province: province,
      city: city,
      district: district,
      village: village,
      certificate: certificate,
      bankName: bankName,
      bankAccountNumber: bankAccountNumber,
      bankAccountHolderName: bankAccountHolderName,
      facilities: facilities,
      totalApprovedEnrollees: totalApprovedEnrollees,
      images: images.map((img) => img.toEntity()).toList(),
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
