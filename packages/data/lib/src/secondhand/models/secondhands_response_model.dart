import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain/domain.dart';
import 'secondhand_model.dart';
import 'pagination_secondhand_model.dart';

part 'secondhands_response_model.freezed.dart';
part 'secondhands_response_model.g.dart';

/// Wrapper for the `data` field inside GET /secondhands response.
///
/// API structure:
/// ```json
/// { "data": { "data": [...], "pagination": {...} } }
/// ```
@freezed
abstract class SecondhandsResponseModel with _$SecondhandsResponseModel {
  const SecondhandsResponseModel._();

  const factory SecondhandsResponseModel({
    @Default([]) List<SecondhandModel> data,
    required PaginationSecondhandModel pagination,
  }) = _SecondhandsResponseModel;

  factory SecondhandsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SecondhandsResponseModelFromJson(json);

  /// Convert to domain entity.
  SecondhandsResultEntity toEntity() {
    return SecondhandsResultEntity(
      items: data.map((m) => m.toEntity()).toList(),
      totalRows: pagination.totalRows,
      totalPages: pagination.totalPages,
      currentPage: pagination.page,
      hasNext: pagination.hasNext,
    );
  }
}
