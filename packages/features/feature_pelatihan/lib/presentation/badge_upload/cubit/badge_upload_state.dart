import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'badge_upload_state.freezed.dart';

@freezed
abstract class BadgeUploadState with _$BadgeUploadState {
  const factory BadgeUploadState({
    File? badgeImage,
    @Default('') String participantName,
    @Default(false) bool isSubmitting,
    @Default(false) bool isSuccess,
    String? errorMessage,
  }) = _BadgeUploadState;
}
