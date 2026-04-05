import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination_secondhand_model.freezed.dart';
part 'pagination_secondhand_model.g.dart';

/// Pagination metadata from GET /secondhands response.
@freezed
abstract class PaginationSecondhandModel with _$PaginationSecondhandModel {
  const factory PaginationSecondhandModel({
    required int limit,
    required int page,
    @Default('') String sort,
    @JsonKey(name: 'total_rows') required int totalRows,
    @JsonKey(name: 'total_pages') required int totalPages,
    @JsonKey(name: 'has_next') required bool hasNext,
  }) = _PaginationSecondhandModel;

  factory PaginationSecondhandModel.fromJson(Map<String, dynamic> json) =>
      _$PaginationSecondhandModelFromJson(json);
}
