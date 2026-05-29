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

 File? get badgeImage; String get participantName; bool get isSubmitting; bool get isSuccess; String? get errorMessage;
/// Create a copy of BadgeUploadState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BadgeUploadStateCopyWith<BadgeUploadState> get copyWith => _$BadgeUploadStateCopyWithImpl<BadgeUploadState>(this as BadgeUploadState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BadgeUploadState&&(identical(other.badgeImage, badgeImage) || other.badgeImage == badgeImage)&&(identical(other.participantName, participantName) || other.participantName == participantName)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,badgeImage,participantName,isSubmitting,isSuccess,errorMessage);

@override
String toString() {
  return 'BadgeUploadState(badgeImage: $badgeImage, participantName: $participantName, isSubmitting: $isSubmitting, isSuccess: $isSuccess, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $BadgeUploadStateCopyWith<$Res>  {
  factory $BadgeUploadStateCopyWith(BadgeUploadState value, $Res Function(BadgeUploadState) _then) = _$BadgeUploadStateCopyWithImpl;
@useResult
$Res call({
 File? badgeImage, String participantName, bool isSubmitting, bool isSuccess, String? errorMessage
});




}
/// @nodoc
class _$BadgeUploadStateCopyWithImpl<$Res>
    implements $BadgeUploadStateCopyWith<$Res> {
  _$BadgeUploadStateCopyWithImpl(this._self, this._then);

  final BadgeUploadState _self;
  final $Res Function(BadgeUploadState) _then;

/// Create a copy of BadgeUploadState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? badgeImage = freezed,Object? participantName = null,Object? isSubmitting = null,Object? isSuccess = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
badgeImage: freezed == badgeImage ? _self.badgeImage : badgeImage // ignore: cast_nullable_to_non_nullable
as File?,participantName: null == participantName ? _self.participantName : participantName // ignore: cast_nullable_to_non_nullable
as String,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BadgeUploadState].
extension BadgeUploadStatePatterns on BadgeUploadState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BadgeUploadState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BadgeUploadState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BadgeUploadState value)  $default,){
final _that = this;
switch (_that) {
case _BadgeUploadState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BadgeUploadState value)?  $default,){
final _that = this;
switch (_that) {
case _BadgeUploadState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( File? badgeImage,  String participantName,  bool isSubmitting,  bool isSuccess,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BadgeUploadState() when $default != null:
return $default(_that.badgeImage,_that.participantName,_that.isSubmitting,_that.isSuccess,_that.errorMessage);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( File? badgeImage,  String participantName,  bool isSubmitting,  bool isSuccess,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _BadgeUploadState():
return $default(_that.badgeImage,_that.participantName,_that.isSubmitting,_that.isSuccess,_that.errorMessage);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( File? badgeImage,  String participantName,  bool isSubmitting,  bool isSuccess,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _BadgeUploadState() when $default != null:
return $default(_that.badgeImage,_that.participantName,_that.isSubmitting,_that.isSuccess,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _BadgeUploadState implements BadgeUploadState {
  const _BadgeUploadState({this.badgeImage, this.participantName = '', this.isSubmitting = false, this.isSuccess = false, this.errorMessage});
  

@override final  File? badgeImage;
@override@JsonKey() final  String participantName;
@override@JsonKey() final  bool isSubmitting;
@override@JsonKey() final  bool isSuccess;
@override final  String? errorMessage;

/// Create a copy of BadgeUploadState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BadgeUploadStateCopyWith<_BadgeUploadState> get copyWith => __$BadgeUploadStateCopyWithImpl<_BadgeUploadState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BadgeUploadState&&(identical(other.badgeImage, badgeImage) || other.badgeImage == badgeImage)&&(identical(other.participantName, participantName) || other.participantName == participantName)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,badgeImage,participantName,isSubmitting,isSuccess,errorMessage);

@override
String toString() {
  return 'BadgeUploadState(badgeImage: $badgeImage, participantName: $participantName, isSubmitting: $isSubmitting, isSuccess: $isSuccess, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$BadgeUploadStateCopyWith<$Res> implements $BadgeUploadStateCopyWith<$Res> {
  factory _$BadgeUploadStateCopyWith(_BadgeUploadState value, $Res Function(_BadgeUploadState) _then) = __$BadgeUploadStateCopyWithImpl;
@override @useResult
$Res call({
 File? badgeImage, String participantName, bool isSubmitting, bool isSuccess, String? errorMessage
});




}
/// @nodoc
class __$BadgeUploadStateCopyWithImpl<$Res>
    implements _$BadgeUploadStateCopyWith<$Res> {
  __$BadgeUploadStateCopyWithImpl(this._self, this._then);

  final _BadgeUploadState _self;
  final $Res Function(_BadgeUploadState) _then;

/// Create a copy of BadgeUploadState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? badgeImage = freezed,Object? participantName = null,Object? isSubmitting = null,Object? isSuccess = null,Object? errorMessage = freezed,}) {
  return _then(_BadgeUploadState(
badgeImage: freezed == badgeImage ? _self.badgeImage : badgeImage // ignore: cast_nullable_to_non_nullable
as File?,participantName: null == participantName ? _self.participantName : participantName // ignore: cast_nullable_to_non_nullable
as String,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
