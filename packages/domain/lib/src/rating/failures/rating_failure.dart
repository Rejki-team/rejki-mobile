import 'package:freezed_annotation/freezed_annotation.dart';

part 'rating_failure.freezed.dart';

@freezed
abstract class RatingFailure with _$RatingFailure {
  const RatingFailure._();

  const factory RatingFailure.serverError([String? message]) = _ServerError;
  const factory RatingFailure.networkError() = _NetworkError;
  const factory RatingFailure.unknown() = _Unknown;
}
