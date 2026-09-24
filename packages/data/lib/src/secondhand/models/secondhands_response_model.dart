import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain/domain.dart';
import 'secondhand_model.dart';
import '../../job/models/pagination_model.dart';

part 'secondhands_response_model.freezed.dart';
part 'secondhands_response_model.g.dart';

/// Wrapper hasil listing GET /barang — backend mengembalikan array flat
/// (`{data: [...]}`, tidak dipaginasi server-side, F-15 Kelompok 3 Phase 4).
/// Pagination disintesis client-side (single page, pola sama `JobsResponseModel`
/// Kelompok 3 Phase 2) — dibangun via `SecondhandRemoteDataSourceImpl`.
@freezed
abstract class SecondhandsResponseModel with _$SecondhandsResponseModel {
  const SecondhandsResponseModel._();

  const factory SecondhandsResponseModel({
    @Default([]) List<SecondhandModel> data,
    required PaginationModel pagination,
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
