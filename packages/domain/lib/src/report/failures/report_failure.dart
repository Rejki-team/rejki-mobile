import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_failure.freezed.dart';

@freezed
abstract class ReportFailure with _$ReportFailure {
  const ReportFailure._();

  const factory ReportFailure.serverError([String? message]) = _ServerError;
  const factory ReportFailure.networkError() = _NetworkError;
  const factory ReportFailure.validationError(String message) =
      _ValidationError;
  const factory ReportFailure.unknown() = _Unknown;
}
