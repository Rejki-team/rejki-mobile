import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain/domain.dart';
import 'bid_model.dart';
import 'pagination_model.dart';

part 'bids_response_model.freezed.dart';
part 'bids_response_model.g.dart';

@freezed
abstract class BidsResponseModel with _$BidsResponseModel {
  const BidsResponseModel._();

  const factory BidsResponseModel({
    required List<BidModel> bids,
    required PaginationModel pagination,
  }) = _BidsResponseModel;

  factory BidsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$BidsResponseModelFromJson(json);

  BidsResultEntity toEntity() {
    return BidsResultEntity(
      bids: bids.map((e) => e.toEntity()).toList(),
      pagination: pagination.toEntity(),
    );
  }
}
