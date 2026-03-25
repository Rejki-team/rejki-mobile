import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain/domain.dart';
import 'job_model.dart';
import 'pagination_model.dart';

part 'jobs_response_model.freezed.dart';
part 'jobs_response_model.g.dart';

/// Jobs Response Model (Data Layer)
///
/// Represents the full API response for GET /jobs endpoint
@freezed
abstract class JobsResponseModel with _$JobsResponseModel {
  const JobsResponseModel._();

  const factory JobsResponseModel({
    /// List of job models
    required List<JobModel> jobs,

    /// Pagination metadata
    required PaginationModel pagination,
  }) = _JobsResponseModel;

  factory JobsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$JobsResponseModelFromJson(json);

  /// Convert to domain entity
  JobsResultEntity toEntity() {
    return JobsResultEntity(
      jobs: jobs.map((job) => job.toEntity()).toList(),
      pagination: pagination.toEntity(),
    );
  }
}
