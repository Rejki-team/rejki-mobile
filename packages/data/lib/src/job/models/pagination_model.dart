import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain/domain.dart';

part 'pagination_model.freezed.dart';
part 'pagination_model.g.dart';

/// Pagination Model (Data Layer)
///
/// Represents pagination metadata from API response
@freezed
abstract class PaginationModel with _$PaginationModel {
  const PaginationModel._();

  const factory PaginationModel({
    /// Number of items per page
    required int limit,

    /// Current page number
    required int page,

    /// Sort field and direction
    required String sort,

    /// Total number of rows/items
    @JsonKey(name: 'total_rows') required int totalRows,

    /// Total number of pages
    @JsonKey(name: 'total_pages') required int totalPages,

    /// Whether there is a next page
    @JsonKey(name: 'has_next') required bool hasNext,
  }) = _PaginationModel;

  factory PaginationModel.fromJson(Map<String, dynamic> json) =>
      _$PaginationModelFromJson(json);

  /// Convert to domain entity
  PaginationEntity toEntity() {
    return PaginationEntity(
      limit: limit,
      page: page,
      sort: sort,
      totalRows: totalRows,
      totalPages: totalPages,
      hasNext: hasNext,
    );
  }
}
