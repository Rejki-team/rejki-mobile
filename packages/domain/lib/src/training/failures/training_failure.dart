import 'package:freezed_annotation/freezed_annotation.dart';

part 'training_failure.freezed.dart';

@freezed
abstract class TrainingFailure with _$TrainingFailure {
  const TrainingFailure._();

  const factory TrainingFailure.serverError([String? message]) = _ServerError;
  const factory TrainingFailure.networkError() = _NetworkError;
  const factory TrainingFailure.unauthorized() = _Unauthorized;
  const factory TrainingFailure.notFound() = _NotFound;
  const factory TrainingFailure.unknown() = _Unknown;
}
