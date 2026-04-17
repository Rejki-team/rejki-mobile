// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'personal_info_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PersonalInfoState {

 PersonalInfoStatus get status;/// Data profil lengkap setelah load berhasil.
 UserProfileEntity? get profile;/// Pesan error jika load atau update gagal.
 String? get errorMessage;/// True saat sedang update jam kerja (PUT /users/working-hours).
/// Digunakan untuk disable dropdown selama request berlangsung.
 bool get isUpdatingWorkingHours;/// True saat sedang update visibilitas telepon (PUT /users/phone-visibility).
/// Digunakan untuk disable switch selama request berlangsung.
 bool get isUpdatingPhoneVisibility;/// Pesan error spesifik untuk update jam kerja (non-fatal).
 String? get workingHoursError;/// Pesan error spesifik untuk update visibilitas telepon (non-fatal).
 String? get phoneVisibilityError;/// Hasil operasi update terakhir.
///
/// Digunakan oleh BlocListener untuk menampilkan dialog yang tepat.
/// Di-reset ke [PersonalInfoUpdateResult.none] setelah dialog ditampilkan.
 PersonalInfoUpdateResult get updateResult;
/// Create a copy of PersonalInfoState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PersonalInfoStateCopyWith<PersonalInfoState> get copyWith => _$PersonalInfoStateCopyWithImpl<PersonalInfoState>(this as PersonalInfoState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PersonalInfoState&&(identical(other.status, status) || other.status == status)&&(identical(other.profile, profile) || other.profile == profile)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.isUpdatingWorkingHours, isUpdatingWorkingHours) || other.isUpdatingWorkingHours == isUpdatingWorkingHours)&&(identical(other.isUpdatingPhoneVisibility, isUpdatingPhoneVisibility) || other.isUpdatingPhoneVisibility == isUpdatingPhoneVisibility)&&(identical(other.workingHoursError, workingHoursError) || other.workingHoursError == workingHoursError)&&(identical(other.phoneVisibilityError, phoneVisibilityError) || other.phoneVisibilityError == phoneVisibilityError)&&(identical(other.updateResult, updateResult) || other.updateResult == updateResult));
}


@override
int get hashCode => Object.hash(runtimeType,status,profile,errorMessage,isUpdatingWorkingHours,isUpdatingPhoneVisibility,workingHoursError,phoneVisibilityError,updateResult);

@override
String toString() {
  return 'PersonalInfoState(status: $status, profile: $profile, errorMessage: $errorMessage, isUpdatingWorkingHours: $isUpdatingWorkingHours, isUpdatingPhoneVisibility: $isUpdatingPhoneVisibility, workingHoursError: $workingHoursError, phoneVisibilityError: $phoneVisibilityError, updateResult: $updateResult)';
}


}

/// @nodoc
abstract mixin class $PersonalInfoStateCopyWith<$Res>  {
  factory $PersonalInfoStateCopyWith(PersonalInfoState value, $Res Function(PersonalInfoState) _then) = _$PersonalInfoStateCopyWithImpl;
@useResult
$Res call({
 PersonalInfoStatus status, UserProfileEntity? profile, String? errorMessage, bool isUpdatingWorkingHours, bool isUpdatingPhoneVisibility, String? workingHoursError, String? phoneVisibilityError, PersonalInfoUpdateResult updateResult
});


$UserProfileEntityCopyWith<$Res>? get profile;

}
/// @nodoc
class _$PersonalInfoStateCopyWithImpl<$Res>
    implements $PersonalInfoStateCopyWith<$Res> {
  _$PersonalInfoStateCopyWithImpl(this._self, this._then);

  final PersonalInfoState _self;
  final $Res Function(PersonalInfoState) _then;

/// Create a copy of PersonalInfoState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? profile = freezed,Object? errorMessage = freezed,Object? isUpdatingWorkingHours = null,Object? isUpdatingPhoneVisibility = null,Object? workingHoursError = freezed,Object? phoneVisibilityError = freezed,Object? updateResult = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PersonalInfoStatus,profile: freezed == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as UserProfileEntity?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,isUpdatingWorkingHours: null == isUpdatingWorkingHours ? _self.isUpdatingWorkingHours : isUpdatingWorkingHours // ignore: cast_nullable_to_non_nullable
as bool,isUpdatingPhoneVisibility: null == isUpdatingPhoneVisibility ? _self.isUpdatingPhoneVisibility : isUpdatingPhoneVisibility // ignore: cast_nullable_to_non_nullable
as bool,workingHoursError: freezed == workingHoursError ? _self.workingHoursError : workingHoursError // ignore: cast_nullable_to_non_nullable
as String?,phoneVisibilityError: freezed == phoneVisibilityError ? _self.phoneVisibilityError : phoneVisibilityError // ignore: cast_nullable_to_non_nullable
as String?,updateResult: null == updateResult ? _self.updateResult : updateResult // ignore: cast_nullable_to_non_nullable
as PersonalInfoUpdateResult,
  ));
}
/// Create a copy of PersonalInfoState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserProfileEntityCopyWith<$Res>? get profile {
    if (_self.profile == null) {
    return null;
  }

  return $UserProfileEntityCopyWith<$Res>(_self.profile!, (value) {
    return _then(_self.copyWith(profile: value));
  });
}
}


/// Adds pattern-matching-related methods to [PersonalInfoState].
extension PersonalInfoStatePatterns on PersonalInfoState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PersonalInfoState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PersonalInfoState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PersonalInfoState value)  $default,){
final _that = this;
switch (_that) {
case _PersonalInfoState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PersonalInfoState value)?  $default,){
final _that = this;
switch (_that) {
case _PersonalInfoState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PersonalInfoStatus status,  UserProfileEntity? profile,  String? errorMessage,  bool isUpdatingWorkingHours,  bool isUpdatingPhoneVisibility,  String? workingHoursError,  String? phoneVisibilityError,  PersonalInfoUpdateResult updateResult)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PersonalInfoState() when $default != null:
return $default(_that.status,_that.profile,_that.errorMessage,_that.isUpdatingWorkingHours,_that.isUpdatingPhoneVisibility,_that.workingHoursError,_that.phoneVisibilityError,_that.updateResult);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PersonalInfoStatus status,  UserProfileEntity? profile,  String? errorMessage,  bool isUpdatingWorkingHours,  bool isUpdatingPhoneVisibility,  String? workingHoursError,  String? phoneVisibilityError,  PersonalInfoUpdateResult updateResult)  $default,) {final _that = this;
switch (_that) {
case _PersonalInfoState():
return $default(_that.status,_that.profile,_that.errorMessage,_that.isUpdatingWorkingHours,_that.isUpdatingPhoneVisibility,_that.workingHoursError,_that.phoneVisibilityError,_that.updateResult);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PersonalInfoStatus status,  UserProfileEntity? profile,  String? errorMessage,  bool isUpdatingWorkingHours,  bool isUpdatingPhoneVisibility,  String? workingHoursError,  String? phoneVisibilityError,  PersonalInfoUpdateResult updateResult)?  $default,) {final _that = this;
switch (_that) {
case _PersonalInfoState() when $default != null:
return $default(_that.status,_that.profile,_that.errorMessage,_that.isUpdatingWorkingHours,_that.isUpdatingPhoneVisibility,_that.workingHoursError,_that.phoneVisibilityError,_that.updateResult);case _:
  return null;

}
}

}

/// @nodoc


class _PersonalInfoState extends PersonalInfoState {
  const _PersonalInfoState({this.status = PersonalInfoStatus.initial, this.profile, this.errorMessage, this.isUpdatingWorkingHours = false, this.isUpdatingPhoneVisibility = false, this.workingHoursError, this.phoneVisibilityError, this.updateResult = PersonalInfoUpdateResult.none}): super._();
  

@override@JsonKey() final  PersonalInfoStatus status;
/// Data profil lengkap setelah load berhasil.
@override final  UserProfileEntity? profile;
/// Pesan error jika load atau update gagal.
@override final  String? errorMessage;
/// True saat sedang update jam kerja (PUT /users/working-hours).
/// Digunakan untuk disable dropdown selama request berlangsung.
@override@JsonKey() final  bool isUpdatingWorkingHours;
/// True saat sedang update visibilitas telepon (PUT /users/phone-visibility).
/// Digunakan untuk disable switch selama request berlangsung.
@override@JsonKey() final  bool isUpdatingPhoneVisibility;
/// Pesan error spesifik untuk update jam kerja (non-fatal).
@override final  String? workingHoursError;
/// Pesan error spesifik untuk update visibilitas telepon (non-fatal).
@override final  String? phoneVisibilityError;
/// Hasil operasi update terakhir.
///
/// Digunakan oleh BlocListener untuk menampilkan dialog yang tepat.
/// Di-reset ke [PersonalInfoUpdateResult.none] setelah dialog ditampilkan.
@override@JsonKey() final  PersonalInfoUpdateResult updateResult;

/// Create a copy of PersonalInfoState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PersonalInfoStateCopyWith<_PersonalInfoState> get copyWith => __$PersonalInfoStateCopyWithImpl<_PersonalInfoState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PersonalInfoState&&(identical(other.status, status) || other.status == status)&&(identical(other.profile, profile) || other.profile == profile)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.isUpdatingWorkingHours, isUpdatingWorkingHours) || other.isUpdatingWorkingHours == isUpdatingWorkingHours)&&(identical(other.isUpdatingPhoneVisibility, isUpdatingPhoneVisibility) || other.isUpdatingPhoneVisibility == isUpdatingPhoneVisibility)&&(identical(other.workingHoursError, workingHoursError) || other.workingHoursError == workingHoursError)&&(identical(other.phoneVisibilityError, phoneVisibilityError) || other.phoneVisibilityError == phoneVisibilityError)&&(identical(other.updateResult, updateResult) || other.updateResult == updateResult));
}


@override
int get hashCode => Object.hash(runtimeType,status,profile,errorMessage,isUpdatingWorkingHours,isUpdatingPhoneVisibility,workingHoursError,phoneVisibilityError,updateResult);

@override
String toString() {
  return 'PersonalInfoState(status: $status, profile: $profile, errorMessage: $errorMessage, isUpdatingWorkingHours: $isUpdatingWorkingHours, isUpdatingPhoneVisibility: $isUpdatingPhoneVisibility, workingHoursError: $workingHoursError, phoneVisibilityError: $phoneVisibilityError, updateResult: $updateResult)';
}


}

/// @nodoc
abstract mixin class _$PersonalInfoStateCopyWith<$Res> implements $PersonalInfoStateCopyWith<$Res> {
  factory _$PersonalInfoStateCopyWith(_PersonalInfoState value, $Res Function(_PersonalInfoState) _then) = __$PersonalInfoStateCopyWithImpl;
@override @useResult
$Res call({
 PersonalInfoStatus status, UserProfileEntity? profile, String? errorMessage, bool isUpdatingWorkingHours, bool isUpdatingPhoneVisibility, String? workingHoursError, String? phoneVisibilityError, PersonalInfoUpdateResult updateResult
});


@override $UserProfileEntityCopyWith<$Res>? get profile;

}
/// @nodoc
class __$PersonalInfoStateCopyWithImpl<$Res>
    implements _$PersonalInfoStateCopyWith<$Res> {
  __$PersonalInfoStateCopyWithImpl(this._self, this._then);

  final _PersonalInfoState _self;
  final $Res Function(_PersonalInfoState) _then;

/// Create a copy of PersonalInfoState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? profile = freezed,Object? errorMessage = freezed,Object? isUpdatingWorkingHours = null,Object? isUpdatingPhoneVisibility = null,Object? workingHoursError = freezed,Object? phoneVisibilityError = freezed,Object? updateResult = null,}) {
  return _then(_PersonalInfoState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PersonalInfoStatus,profile: freezed == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as UserProfileEntity?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,isUpdatingWorkingHours: null == isUpdatingWorkingHours ? _self.isUpdatingWorkingHours : isUpdatingWorkingHours // ignore: cast_nullable_to_non_nullable
as bool,isUpdatingPhoneVisibility: null == isUpdatingPhoneVisibility ? _self.isUpdatingPhoneVisibility : isUpdatingPhoneVisibility // ignore: cast_nullable_to_non_nullable
as bool,workingHoursError: freezed == workingHoursError ? _self.workingHoursError : workingHoursError // ignore: cast_nullable_to_non_nullable
as String?,phoneVisibilityError: freezed == phoneVisibilityError ? _self.phoneVisibilityError : phoneVisibilityError // ignore: cast_nullable_to_non_nullable
as String?,updateResult: null == updateResult ? _self.updateResult : updateResult // ignore: cast_nullable_to_non_nullable
as PersonalInfoUpdateResult,
  ));
}

/// Create a copy of PersonalInfoState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserProfileEntityCopyWith<$Res>? get profile {
    if (_self.profile == null) {
    return null;
  }

  return $UserProfileEntityCopyWith<$Res>(_self.profile!, (value) {
    return _then(_self.copyWith(profile: value));
  });
}
}

// dart format on
