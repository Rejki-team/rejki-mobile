import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_failure.freezed.dart';

@freezed
abstract class ChatFailure with _$ChatFailure {
  const ChatFailure._();

  const factory ChatFailure.serverError([String? message]) = _ServerError;
  const factory ChatFailure.networkError() = _NetworkError;
  const factory ChatFailure.notFound() = _NotFound;
  const factory ChatFailure.rateLimited() = _RateLimited;
  const factory ChatFailure.unknown() = _Unknown;
}
