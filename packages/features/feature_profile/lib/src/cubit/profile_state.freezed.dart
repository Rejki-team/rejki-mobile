// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfileState {

 ProfileStatus get status; UserProfileSummary? get summary; String? get errorMessage;/// True saat upload foto profil sedang berlangsung.
/// Digunakan untuk menampilkan loading overlay pada avatar.
 bool get isUploadingPhoto;/// Pesan error saat upload foto gagal (null jika tidak ada error).
 String? get uploadPhotoError;
/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileStateCopyWith<ProfileState> get copyWith => _$ProfileStateCopyWithImpl<ProfileState>(this as ProfileState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileState&&(identical(other.status, status) || other.status == status)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.isUploadingPhoto, isUploadingPhoto) || other.isUploadingPhoto == isUploadingPhoto)&&(identical(other.uploadPhotoError, uploadPhotoError) || other.uploadPhotoError == uploadPhotoError));
}


@override
int get hashCode => Object.hash(runtimeType,status,summary,errorMessage,isUploadingPhoto,uploadPhotoError);

@override
String toString() {
  return 'ProfileState(status: $status, summary: $summary, errorMessage: $errorMessage, isUploadingPhoto: $isUploadingPhoto, uploadPhotoError: $uploadPhotoError)';
}


}

/// @nodoc
abstract mixin class $ProfileStateCopyWith<$Res>  {
  factory $ProfileStateCopyWith(ProfileState value, $Res Function(ProfileState) _then) = _$ProfileStateCopyWithImpl;
@useResult
$Res call({
 ProfileStatus status, UserProfileSummary? summary, String? errorMessage, bool isUploadingPhoto, String? uploadPhotoError
});


$UserProfileSummaryCopyWith<$Res>? get summary;

}
/// @nodoc
class _$ProfileStateCopyWithImpl<$Res>
    implements $ProfileStateCopyWith<$Res> {
  _$ProfileStateCopyWithImpl(this._self, this._then);

  final ProfileState _self;
  final $Res Function(ProfileState) _then;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? summary = freezed,Object? errorMessage = freezed,Object? isUploadingPhoto = null,Object? uploadPhotoError = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ProfileStatus,summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as UserProfileSummary?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,isUploadingPhoto: null == isUploadingPhoto ? _self.isUploadingPhoto : isUploadingPhoto // ignore: cast_nullable_to_non_nullable
as bool,uploadPhotoError: freezed == uploadPhotoError ? _self.uploadPhotoError : uploadPhotoError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserProfileSummaryCopyWith<$Res>? get summary {
    if (_self.summary == null) {
    return null;
  }

  return $UserProfileSummaryCopyWith<$Res>(_self.summary!, (value) {
    return _then(_self.copyWith(summary: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProfileState].
extension ProfileStatePatterns on ProfileState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileState value)  $default,){
final _that = this;
switch (_that) {
case _ProfileState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileState value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ProfileStatus status,  UserProfileSummary? summary,  String? errorMessage,  bool isUploadingPhoto,  String? uploadPhotoError)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileState() when $default != null:
return $default(_that.status,_that.summary,_that.errorMessage,_that.isUploadingPhoto,_that.uploadPhotoError);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ProfileStatus status,  UserProfileSummary? summary,  String? errorMessage,  bool isUploadingPhoto,  String? uploadPhotoError)  $default,) {final _that = this;
switch (_that) {
case _ProfileState():
return $default(_that.status,_that.summary,_that.errorMessage,_that.isUploadingPhoto,_that.uploadPhotoError);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ProfileStatus status,  UserProfileSummary? summary,  String? errorMessage,  bool isUploadingPhoto,  String? uploadPhotoError)?  $default,) {final _that = this;
switch (_that) {
case _ProfileState() when $default != null:
return $default(_that.status,_that.summary,_that.errorMessage,_that.isUploadingPhoto,_that.uploadPhotoError);case _:
  return null;

}
}

}

/// @nodoc


class _ProfileState extends ProfileState {
  const _ProfileState({this.status = ProfileStatus.initial, this.summary, this.errorMessage, this.isUploadingPhoto = false, this.uploadPhotoError}): super._();
  

@override@JsonKey() final  ProfileStatus status;
@override final  UserProfileSummary? summary;
@override final  String? errorMessage;
/// True saat upload foto profil sedang berlangsung.
/// Digunakan untuk menampilkan loading overlay pada avatar.
@override@JsonKey() final  bool isUploadingPhoto;
/// Pesan error saat upload foto gagal (null jika tidak ada error).
@override final  String? uploadPhotoError;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileStateCopyWith<_ProfileState> get copyWith => __$ProfileStateCopyWithImpl<_ProfileState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileState&&(identical(other.status, status) || other.status == status)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.isUploadingPhoto, isUploadingPhoto) || other.isUploadingPhoto == isUploadingPhoto)&&(identical(other.uploadPhotoError, uploadPhotoError) || other.uploadPhotoError == uploadPhotoError));
}


@override
int get hashCode => Object.hash(runtimeType,status,summary,errorMessage,isUploadingPhoto,uploadPhotoError);

@override
String toString() {
  return 'ProfileState(status: $status, summary: $summary, errorMessage: $errorMessage, isUploadingPhoto: $isUploadingPhoto, uploadPhotoError: $uploadPhotoError)';
}


}

/// @nodoc
abstract mixin class _$ProfileStateCopyWith<$Res> implements $ProfileStateCopyWith<$Res> {
  factory _$ProfileStateCopyWith(_ProfileState value, $Res Function(_ProfileState) _then) = __$ProfileStateCopyWithImpl;
@override @useResult
$Res call({
 ProfileStatus status, UserProfileSummary? summary, String? errorMessage, bool isUploadingPhoto, String? uploadPhotoError
});


@override $UserProfileSummaryCopyWith<$Res>? get summary;

}
/// @nodoc
class __$ProfileStateCopyWithImpl<$Res>
    implements _$ProfileStateCopyWith<$Res> {
  __$ProfileStateCopyWithImpl(this._self, this._then);

  final _ProfileState _self;
  final $Res Function(_ProfileState) _then;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? summary = freezed,Object? errorMessage = freezed,Object? isUploadingPhoto = null,Object? uploadPhotoError = freezed,}) {
  return _then(_ProfileState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ProfileStatus,summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as UserProfileSummary?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,isUploadingPhoto: null == isUploadingPhoto ? _self.isUploadingPhoto : isUploadingPhoto // ignore: cast_nullable_to_non_nullable
as bool,uploadPhotoError: freezed == uploadPhotoError ? _self.uploadPhotoError : uploadPhotoError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserProfileSummaryCopyWith<$Res>? get summary {
    if (_self.summary == null) {
    return null;
  }

  return $UserProfileSummaryCopyWith<$Res>(_self.summary!, (value) {
    return _then(_self.copyWith(summary: value));
  });
}
}

// dart format on
