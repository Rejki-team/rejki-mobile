import 'package:freezed_annotation/freezed_annotation.dart';
import 'location_model.dart';

part 'location_response_model.freezed.dart';
part 'location_response_model.g.dart';

/// Location Response Model (Data Layer)
///
/// Wrapper model for API response containing location data.
@freezed
abstract class LocationResponseModel with _$LocationResponseModel {
  const LocationResponseModel._();

  const factory LocationResponseModel({
    /// Success status
    required bool success,

    /// Response message
    required String message,

    /// List of location data
    required List<LocationModel> data,
  }) = _LocationResponseModel;

  factory LocationResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LocationResponseModelFromJson(json);
}
