import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain/domain.dart';
import 'job_image_model.dart';
import 'user_job_model.dart';

part 'job_model.freezed.dart';
part 'job_model.g.dart';

/// Parses bid count from the raw bids array in the API response.
/// Avoids importing BidModel to prevent a circular dependency with job_model.
int? _parseBidCount(dynamic json) => json is List ? json.length : null;

/// Shared Job Model (Data Layer)
///
/// This model is used for deserializing API responses for READ operations
@freezed
abstract class JobModel with _$JobModel {
  const JobModel._();

  const factory JobModel({
    /// Unique job identifier
    required String id,

    /// Advertisement code (e.g., "17/03/2026/1773725269")
    @JsonKey(name: 'ad_code') required String adCode,

    /// User ID who posted the job
    @JsonKey(name: 'user_id') required String userId,

    /// Nested user object (employer identity)
    UserJobModel? user,

    /// Job title
    required String title,

    /// Job description
    @JsonKey(name: 'job_desc') required String jobDesc,

    /// Job requirements (optional)
    @JsonKey(name: 'job_requirements') String? jobRequirements,

    /// Salary amount
    required int salary,

    /// Salary type (e.g., "Borongan", "Harian", "Per Jam")
    @JsonKey(name: 'salary_of_worker') required String salaryOfWorker,

    /// Number of workers needed
    @JsonKey(name: 'number_of_worker') required int numberOfWorker,

    /// Job date and time (ISO 8601 string from API)
    @JsonKey(name: 'date_of_job') required String dateOfJob,

    /// Full address
    required String address,

    /// Province
    required String province,

    /// City/Regency
    required String city,

    /// Subdistrict (Kecamatan)
    required String subdistrict,

    /// Ward (Kelurahan)
    required String ward,

    /// Village (Desa/Kampung)
    String? village,

    /// Job status (e.g., "open", "closed")
    required String status,

    /// List of job images
    @Default([]) List<JobImageModel> images,

    /// Count of bids derived from the bids array in the API response.
    @JsonKey(name: 'bids', fromJson: _parseBidCount, includeToJson: false)
    int? bidCount,

    /// Job created at
    @JsonKey(name: 'created_at') String? createdAt,

    /// Job updated at
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _JobModel;

  factory JobModel.fromJson(Map<String, dynamic> json) =>
      _$JobModelFromJson(json);

  /// Convert to domain entity
  JobEntity toEntity() {
    return JobEntity(
      id: id,
      adCode: adCode,
      userId: userId,
      title: title,
      description: jobDesc,
      requirements: jobRequirements,
      salary: salary,
      salaryType: salaryOfWorker,
      workerCount: numberOfWorker,
      dateOfJob: DateTime.parse(dateOfJob),
      address: address,
      province: province,
      city: city,
      subdistrict: subdistrict,
      ward: ward,
      village: village,
      status: status,
      images: images.map((img) => img.toEntity()).toList(),
      bidCount: bidCount,
      createdAt: createdAt != null ? DateTime.parse(createdAt!) : null,
      updatedAt: updatedAt != null ? DateTime.parse(updatedAt!) : null,
      employerName: user?.userInfo?.fullName ?? '',
      employerPhone: user?.phoneNumber ?? '',
    );
  }
}
