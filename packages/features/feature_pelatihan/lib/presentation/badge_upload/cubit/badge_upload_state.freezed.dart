// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'badge_upload_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BadgeUploadState {
  File? get badgeImage;
  String get participantName;
  bool get isSubmitting;
  bool get isSuccess;
  String? get errorMessage;

  /// Create a copy of BadgeUploadState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BadgeUploadStateCopyWith<BadgeUploadState> get copyWith =>
      _$BadgeUploadStateCopyWithImpl<BadgeUploadState>(
          this as BadgeUploadState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BadgeUploadState &&
            (identical(other.badgeImage, badgeImage) ||
                other.badgeImage == badgeImage) &&
            (identical(other.participantName, participantName) ||
                other.participantName == participantName) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, badgeImage, participantName, isSubmitting, isSuccess, errorMessage);

  @override
  String toString() {
    return 'BadgeUploadState(badgeImage: $badgeImage, participantName: $participantName, isSubmitting: $isSubmitting, isSuccess: $isSuccess, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class $BadgeUploadStateCopyWith<$Res> {
  factory $BadgeUploadStateCopyWith(
          BadgeUploadState value, $Res Function(BadgeUploadState) _then) =
      _$BadgeUploadStateCopyWithImpl;

  @useResult
  $Res call({
    File? badgeImage,
    String participantName,
    bool isSubmitting,
    bool isSuccess,
    String? errorMessage,
  });
}

/// @nodoc
class _$BadgeUploadStateCopyWithImpl<$Res>
    implements $BadgeUploadStateCopyWith<$Res> {
  _$BadgeUploadStateCopyWithImpl(this._self, this._then);

  final BadgeUploadState _self;
  final $Res Function(BadgeUploadState) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? badgeImage = freezed,
    Object? participantName = null,
    Object? isSubmitting = null,
    Object? isSuccess = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_self.copyWith(
      badgeImage: freezed == badgeImage ? _self.badgeImage : badgeImage as File?,
      participantName:
          null == participantName ? _self.participantName : participantName as String,
      isSubmitting:
          null == isSubmitting ? _self.isSubmitting : isSubmitting as bool,
      isSuccess: null == isSuccess ? _self.isSuccess : isSuccess as bool,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage as String?,
    ));
  }
}

/// @nodoc
class _BadgeUploadState implements BadgeUploadState {
  const _BadgeUploadState({
    this.badgeImage,
    this.participantName = '',
    this.isSubmitting = false,
    this.isSuccess = false,
    this.errorMessage,
  });

  @override
  final File? badgeImage;
  @override
  @JsonKey()
  final String participantName;
  @override
  @JsonKey()
  final bool isSubmitting;
  @override
  @JsonKey()
  final bool isSuccess;
  @override
  final String? errorMessage;

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BadgeUploadStateCopyWith<_BadgeUploadState> get copyWith =>
      __$BadgeUploadStateCopyWithImpl<_BadgeUploadState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BadgeUploadState &&
            (identical(other.badgeImage, badgeImage) ||
                other.badgeImage == badgeImage) &&
            (identical(other.participantName, participantName) ||
                other.participantName == participantName) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, badgeImage, participantName, isSubmitting, isSuccess, errorMessage);

  @override
  String toString() {
    return 'BadgeUploadState(badgeImage: $badgeImage, participantName: $participantName, isSubmitting: $isSubmitting, isSuccess: $isSuccess, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class _$BadgeUploadStateCopyWith<$Res>
    implements $BadgeUploadStateCopyWith<$Res> {
  factory _$BadgeUploadStateCopyWith(
          _BadgeUploadState value, $Res Function(_BadgeUploadState) _then) =
      __$BadgeUploadStateCopyWithImpl;

  @override
  @useResult
  $Res call({
    File? badgeImage,
    String participantName,
    bool isSubmitting,
    bool isSuccess,
    String? errorMessage,
  });
}

/// @nodoc
class __$BadgeUploadStateCopyWithImpl<$Res>
    implements _$BadgeUploadStateCopyWith<$Res> {
  __$BadgeUploadStateCopyWithImpl(this._self, this._then);

  final _BadgeUploadState _self;
  final $Res Function(_BadgeUploadState) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? badgeImage = freezed,
    Object? participantName = null,
    Object? isSubmitting = null,
    Object? isSuccess = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_BadgeUploadState(
      badgeImage:
          freezed == badgeImage ? _self.badgeImage : badgeImage as File?,
      participantName:
          null == participantName ? _self.participantName : participantName as String,
      isSubmitting:
          null == isSubmitting ? _self.isSubmitting : isSubmitting as bool,
      isSuccess: null == isSuccess ? _self.isSuccess : isSuccess as bool,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage as String?,
    ));
  }
}

// dart format on
