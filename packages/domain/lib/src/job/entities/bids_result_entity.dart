import 'package:freezed_annotation/freezed_annotation.dart';
import 'bid_entity.dart';
import 'pagination_entity.dart';

part 'bids_result_entity.freezed.dart';

/// Bids result with pagination metadata
@freezed
abstract class BidsResultEntity with _$BidsResultEntity {
  const BidsResultEntity._();

  const factory BidsResultEntity({
    /// List of bids
    required List<BidEntity> bids,

    /// Pagination metadata
    required PaginationEntity pagination,
  }) = _BidsResultEntity;
}
