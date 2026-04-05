import 'package:freezed_annotation/freezed_annotation.dart';
import 'secondhand_entity.dart';

part 'secondhands_result_entity.freezed.dart';

/// Paginated result entity for secondhand ads (Domain Layer).
@freezed
abstract class SecondhandsResultEntity with _$SecondhandsResultEntity {
  const factory SecondhandsResultEntity({
    /// List of secondhand ads for the current page
    required List<SecondhandEntity> items,

    /// Total number of rows across all pages
    required int totalRows,

    /// Total number of pages
    required int totalPages,

    /// Current page number (1-based)
    required int currentPage,

    /// Whether a next page is available
    required bool hasNext,
  }) = _SecondhandsResultEntity;
}
