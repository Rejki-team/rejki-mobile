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
    double? rating,
    @JsonKey(name: 'review_count') int? reviewCount,
    int? wage,
    @JsonKey(name: 'salary_type') String? salaryType,
    WorkerUserBidModel? user,
    @Default([]) List<WorkerImageBidModel> images,
  }) = _WorkerBidModel;

  factory WorkerBidModel.fromJson(Map<String, dynamic> json) =>
      _$WorkerBidModelFromJson(json);

  WorkerEntity toWorkerEntity() {
    final name = user?.userInfo?.fullName ?? '';
    final dobStr = user?.userInfo?.dob;

    int age = 0;
    if (dobStr != null && dobStr.isNotEmpty) {
      final dob = DateTime.tryParse(dobStr);
      if (dob != null) {
        final now = DateTime.now();
        age = now.year - dob.year;
        if (now.month < dob.month ||
            (now.month == dob.month && now.day < dob.day)) {
          age--;
        }
      }
    }

    final avatarUrl = images.isNotEmpty ? images.first.uriPath : null;

    return WorkerEntity(
      id: id,
      name: name,
      adCode: '',
      age: age,
      rating: rating ?? 0.0,
      reviewCount: reviewCount ?? 0,
      wage: wage ?? 0,
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
