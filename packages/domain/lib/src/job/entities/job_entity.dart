import 'package:freezed_annotation/freezed_annotation.dart';
import 'job_image_entity.dart';

part 'job_entity.freezed.dart';

/// Shared Job Entity (Domain Layer)
///
/// This entity is used across multiple features for READ operations only.
/// For mutations (create, update, delete), use feature-specific implementations.
@freezed
abstract class JobEntity with _$JobEntity {
  const JobEntity._();

  const factory JobEntity({
    /// Unique job identifier
    required String id,

    /// Advertisement code from API (e.g., "17/03/2026/1773725269")
    required String adCode,

    /// User ID who posted the job
    required String userId,

    /// Job title
    required String title,

    /// Job description
    required String description,

    /// Job requirements (optional)
    String? requirements,

    /// Salary amount
    required int salary,

    /// Salary type (e.g., "Borongan", "Harian", "Per Jam")
    required String salaryType,

    /// Number of workers needed
    required int workerCount,

    /// Job date and time
    required DateTime dateOfJob,

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

    /// Job status (e.g., "open", "closed", "in_progress")
    required String status,

    /// List of job images
    @Default([]) List<JobImageEntity> images,

    /// Job created at
    DateTime? createdAt,

    /// Job updated at
    DateTime? updatedAt,

    /// Employer full name from user.user_info.full_name
    /// Empty string if user hasn't filled in their profile yet.
    @Default('') String employerName,

    /// Employer phone number from user.phone_number
    @Default('') String employerPhone,
  }) = _JobEntity;

  /// Get first image URL or null
  String? get firstImageUrl => images.isNotEmpty ? images.first.uriPath : null;

  /// Get formatted salary string
  String get formattedSalary {
    final formatted = salary.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (match) => '${match[1]}.',
    );
    return 'Rp $formatted';
  }

  /// Check if job is open
  bool get isOpen => status.toLowerCase() == 'open';
}
