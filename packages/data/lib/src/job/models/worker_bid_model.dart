import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain/domain.dart';

part 'worker_bid_model.freezed.dart';
part 'worker_bid_model.g.dart';

/// Simplified model for deserializing worker info nested inside bid API response.
///
/// Used specifically for `GET /jobs/me/incoming-bids` where each bid includes
/// the applicant's worker profile.
@freezed
abstract class WorkerBidModel with _$WorkerBidModel {
  const WorkerBidModel._();

  const factory WorkerBidModel({
    required String id,
    @JsonKey(name: 'user_id') String? userId,
    @JsonKey(name: 'full_name') String? fullName,
    @JsonKey(name: 'ad_code') String? adCode,
    int? age,
    double? rating,
    @JsonKey(name: 'review_count') int? reviewCount,
    @JsonKey(name: 'desired_salary') double? desiredSalary,
    @JsonKey(name: 'salary_type') String? salaryType,
    WorkerUserBidModel? user,
    @Default([]) List<WorkerImageBidModel> images,
  }) = _WorkerBidModel;

  factory WorkerBidModel.fromJson(Map<String, dynamic> json) =>
      _$WorkerBidModelFromJson(json);

  WorkerEntity toWorkerEntity() {
    // Prefer worker's direct full_name; fall back to user_info.full_name
    final name = fullName ?? user?.userInfo?.fullName ?? '';

    // Use backend-computed age first (avoids Go zero-time DOB pitfall).
    // Fall back to DOB computation only when age is 0, with a year guard
    // to exclude Go's zero time value ("0001-01-01") which would produce ~2025.
    int workerAge = age ?? 0;
    if (workerAge <= 0) {
      final dobStr = user?.userInfo?.dob;
      if (dobStr != null && dobStr.isNotEmpty) {
        final dob = DateTime.tryParse(dobStr);
        if (dob != null && dob.year > 1900) {
          final now = DateTime.now();
          workerAge = now.year - dob.year;
          if (now.month < dob.month ||
              (now.month == dob.month && now.day < dob.day)) {
            workerAge--;
          }
        }
      }
    }

    final avatarUrl = images.isNotEmpty ? images.first.uriPath : null;

    return WorkerEntity(
      id: id,
      name: name,
      adCode: adCode ?? '',
      age: workerAge,
      rating: rating ?? 0.0,
      reviewCount: reviewCount ?? 0,
      wage: (desiredSalary?.round()) ?? 0,
      avatarUrl: avatarUrl,
    );
  }
}

@freezed
abstract class WorkerUserBidModel with _$WorkerUserBidModel {
  const factory WorkerUserBidModel({
    required String id,
    @JsonKey(name: 'user_info') WorkerUserInfoBidModel? userInfo,
  }) = _WorkerUserBidModel;

  factory WorkerUserBidModel.fromJson(Map<String, dynamic> json) =>
      _$WorkerUserBidModelFromJson(json);
}

@freezed
abstract class WorkerUserInfoBidModel with _$WorkerUserInfoBidModel {
  const factory WorkerUserInfoBidModel({
    @JsonKey(name: 'full_name') String? fullName,
    String? dob,
  }) = _WorkerUserInfoBidModel;

  factory WorkerUserInfoBidModel.fromJson(Map<String, dynamic> json) =>
      _$WorkerUserInfoBidModelFromJson(json);
}

@freezed
abstract class WorkerImageBidModel with _$WorkerImageBidModel {
  const factory WorkerImageBidModel({
    required String id,
    @JsonKey(name: 'uri_path') required String uriPath,
  }) = _WorkerImageBidModel;

  factory WorkerImageBidModel.fromJson(Map<String, dynamic> json) =>
      _$WorkerImageBidModelFromJson(json);
}
