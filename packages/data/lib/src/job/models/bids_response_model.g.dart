// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bids_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BidsResponseModel _$BidsResponseModelFromJson(Map<String, dynamic> json) =>
    _BidsResponseModel(
      bids: (json['bids'] as List<dynamic>)
          .map((e) => BidModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination: PaginationModel.fromJson(
        json['pagination'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$BidsResponseModelToJson(_BidsResponseModel instance) =>
    <String, dynamic>{'bids': instance.bids, 'pagination': instance.pagination};
