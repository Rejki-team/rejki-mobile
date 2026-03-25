import 'package:freezed_annotation/freezed_annotation.dart';
import 'job_entity.dart';
import 'pagination_entity.dart';

part 'jobs_result_entity.freezed.dart';

/// Jobs Result Entity
///
/// Contains a list of jobs along with pagination info.
/// Used as the return type for paginated job queries.
@freezed
abstract class JobsResultEntity with _$JobsResultEntity {
  const JobsResultEntity._();

  const factory JobsResultEntity({
    /// List of job entities
    required List<JobEntity> jobs,

    /// Pagination metadata
    required PaginationEntity pagination,
  }) = _JobsResultEntity;

  /// Check if the result is empty
  bool get isEmpty => jobs.isEmpty;

  /// Check if the result is not empty
  bool get isNotEmpty => jobs.isNotEmpty;

  /// Get the first job (useful for home page showing latest job)
  JobEntity? get firstOrNull => jobs.isEmpty ? null : jobs.first;
}
