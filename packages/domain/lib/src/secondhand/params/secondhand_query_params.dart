import 'package:freezed_annotation/freezed_annotation.dart';

part 'secondhand_query_params.freezed.dart';

/// Query parameters for fetching secondhand ads (GET /secondhands).
@freezed
abstract class SecondhandQueryParams with _$SecondhandQueryParams {
  const factory SecondhandQueryParams({
    /// Page number (1-based)
    @Default(1) int page,

    /// Items per page
    @Default(10) int limit,

    /// Full-text search keyword
    @Default('') String search,

    /// Filter by province name
    @Default('') String province,

    /// Filter by city name
    @Default('') String city,

    /// Filter by subdistrict name
    @Default('') String subdistrict,

    /// Filter by ward name
    @Default('') String ward,
  }) = _SecondhandQueryParams;
}
