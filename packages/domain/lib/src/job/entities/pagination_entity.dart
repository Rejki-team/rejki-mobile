import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination_entity.freezed.dart';

/// Pagination metadata entity
///
/// Used to track pagination state across features
@freezed
abstract class PaginationEntity with _$PaginationEntity {
  const PaginationEntity._();

  const factory PaginationEntity({
    /// Number of items per page
    required int limit,

    /// Current page number
    required int page,

    /// Sort field and direction
    required String sort,

    /// Total number of rows/items
    required int totalRows,

    /// Total number of pages
    required int totalPages,

    /// Whether there is a next page
    required bool hasNext,
  }) = _PaginationEntity;

  /// Check if there is a previous page
  bool get hasPrevious => page > 1;

  /// Check if this is the first page
  bool get isFirstPage => page == 1;

  /// Check if this is the last page
  bool get isLastPage => !hasNext;
}
