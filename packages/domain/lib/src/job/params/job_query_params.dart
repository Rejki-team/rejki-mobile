import 'package:freezed_annotation/freezed_annotation.dart';

part 'job_query_params.freezed.dart';

/// Query parameters for fetching jobs
///
/// This is a reusable parameter class for filtering and paginating job listings.
/// Used across multiple features (home, search, job list, etc.)
@freezed
abstract class JobQueryParams with _$JobQueryParams {
  const JobQueryParams._();

  const factory JobQueryParams({
    /// Page number (1-based)
    @Default(1) int page,

    /// Number of items per page
    @Default(10) int limit,

    /// Sort field and direction (e.g., "created_at desc")
    @Default('created_at desc') String sort,

    /// Search query for job title/description
    String? search,

    /// Filter by province
    String? province,

    /// Filter by city
    String? city,

    /// Filter by subdistrict (kecamatan)
    String? subdistrict,

    /// Filter by ward (kelurahan)
    String? ward,

    /// Filter by status (e.g., "open", "closed")
    String? status,

    /// Current device latitude for location-based filtering
    double? latitude,

    /// Current device longitude for location-based filtering
    double? longitude,
  }) = _JobQueryParams;

  /// Convert to query parameters map for API request
  Map<String, dynamic> toQueryParameters() {
    final params = <String, dynamic>{
      'page': page,
      'limit': limit,
      'sort': sort,
    };

    if (search != null && search!.isNotEmpty) {
      params['search'] = search;
    }
    if (province != null && province!.isNotEmpty) {
      params['province'] = province;
    }
    if (city != null && city!.isNotEmpty) {
      params['city'] = city;
    }
    if (subdistrict != null && subdistrict!.isNotEmpty) {
      params['subdistrict'] = subdistrict;
    }
    if (ward != null && ward!.isNotEmpty) {
      params['ward'] = ward;
    }
    if (status != null && status!.isNotEmpty) {
      params['status'] = status;
    }
    if (latitude != null) {
      params['latitude'] = latitude;
    }
    if (longitude != null) {
      params['longitude'] = longitude;
    }

    return params;
  }

  /// Convenience factory for getting latest jobs (for home page)
  factory JobQueryParams.latest({int limit = 1}) =>
      JobQueryParams(page: 1, limit: limit, sort: 'created_at desc');

  /// Convenience factory for search
  factory JobQueryParams.search(String query, {int page = 1, int limit = 10}) =>
      JobQueryParams(page: page, limit: limit, search: query);
}
