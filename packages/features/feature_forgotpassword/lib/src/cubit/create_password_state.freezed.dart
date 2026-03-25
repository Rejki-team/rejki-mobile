// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_password_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreatePasswordState {

/// Input password baru
 PasswordInput get newPassword;/// Input konfirmasi password baru
 ConfirmPasswordInput get confirmPassword;/// Token untuk reset password (loaded from secure storage)
 String get token;/// Status form
 CreatePasswordStatus get status;/// Error message jika gagal
 String? get errorMessage;/// Success message jika berhasil
 String? get successMessage;
/// Create a copy of CreatePasswordState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreatePasswordStateCopyWith<CreatePasswordState> get copyWith => _$CreatePasswordStateCopyWithImpl<CreatePasswordState>(this as CreatePasswordState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreatePasswordState&&(identical(other.newPassword, newPassword) || other.newPassword == newPassword)&&(identical(other.confirmPassword, confirmPassword) || other.confirmPassword == confirmPassword)&&(identical(other.token, token) || other.token == token)&&(identical(other.status, status) || other.status == status)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.successMessage, successMessage) || other.successMessage == successMessage));
}


@override
int get hashCode => Object.hash(runtimeType,newPassword,confirmPassword,token,status,errorMessage,successMessage);

@override
String toString() {
  return 'CreatePasswordState(newPassword: $newPassword, confirmPassword: $confirmPassword, token: $token, status: $status, errorMessage: $errorMessage, successMessage: $successMessage)';
}


}

/// @nodoc
abstract mixin class $CreatePasswordStateCopyWith<$Res>  {
  factory $CreatePasswordStateCopyWith(CreatePasswordState value, $Res Function(CreatePasswordState) _then) = _$CreatePasswordStateCopyWithImpl;
@useResult
$Res call({
 PasswordInput newPassword, ConfirmPasswordInput confirmPassword, String token, CreatePasswordStatus status, String? errorMessage, String? successMessage
});




}
/// @nodoc
class _$CreatePasswordStateCopyWithImpl<$Res>
    implements $CreatePasswordStateCopyWith<$Res> {
  _$CreatePasswordStateCopyWithImpl(this._self, this._then);

  final CreatePasswordState _self;
  final $Res Function(CreatePasswordState) _then;

/// Create a copy of CreatePasswordState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? newPassword = null,Object? confirmPassword = null,Object? token = null,Object? status = null,Object? errorMessage = freezed,Object? successMessage = freezed,}) {
  return _then(_self.copyWith(
newPassword: null == newPassword ? _self.newPassword : newPassword // ignore: cast_nullable_to_non_nullable
as PasswordInput,confirmPassword: null == confirmPassword ? _self.confirmPassword : confirmPassword // ignore: cast_nullable_to_non_nullable
as ConfirmPasswordInput,token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CreatePasswordStatus,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,successMessage: freezed == successMessage ? _self.successMessage : successMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreatePasswordState].
extension CreatePasswordStatePatterns on CreatePasswordState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreatePasswordState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreatePasswordState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreatePasswordState value)  $default,){
final _that = this;
switch (_that) {
case _CreatePasswordState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreatePasswordState value)?  $default,){
final _that = this;
switch (_that) {
case _CreatePasswordState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PasswordInput newPassword,  ConfirmPasswordInput confirmPassword,  String token,  CreatePasswordStatus status,  String? errorMessage,  String? successMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreatePasswordState() when $default != null:
return $default(_that.newPassword,_that.confirmPassword,_that.token,_that.status,_that.errorMessage,_that.successMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PasswordInput newPassword,  ConfirmPasswordInput confirmPassword,  String token,  CreatePasswordStatus status,  String? errorMessage,  String? successMessage)  $default,) {final _that = this;
switch (_that) {
case _CreatePasswordState():
return $default(_that.newPassword,_that.confirmPassword,_that.token,_that.status,_that.errorMessage,_that.successMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PasswordInput newPassword,  ConfirmPasswordInput confirmPassword,  String token,  CreatePasswordStatus status,  String? errorMessage,  String? successMessage)?  $default,) {final _that = this;
switch (_that) {
case _CreatePasswordState() when $default != null:
return $default(_that.newPassword,_that.confirmPassword,_that.token,_that.status,_that.errorMessage,_that.successMessage);case _:
  return null;

}
}

}

/// @nodoc


class _CreatePasswordState extends CreatePasswordState {
  const _CreatePasswordState({this.newPassword = const PasswordInput.pure(), this.confirmPassword = const ConfirmPasswordInput.pure(), this.token = '', this.status = CreatePasswordStatus.initial, this.errorMessage, this.successMessage}): super._();
  

/// Input password baru
@override@JsonKey() final  PasswordInput newPassword;
/// Input konfirmasi password baru
@override@JsonKey() final  ConfirmPasswordInput confirmPassword;
/// Token untuk reset password (loaded from secure storage)
@override@JsonKey() final  String token;
/// Status form
@override@JsonKey() final  CreatePasswordStatus status;
/// Error message jika gagal
@override final  String? errorMessage;
/// Success message jika berhasil
@override final  String? successMessage;

/// Create a copy of CreatePasswordState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreatePasswordStateCopyWith<_CreatePasswordState> get copyWith => __$CreatePasswordStateCopyWithImpl<_CreatePasswordState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreatePasswordState&&(identical(other.newPassword, newPassword) || other.newPassword == newPassword)&&(identical(other.confirmPassword, confirmPassword) || other.confirmPassword == confirmPassword)&&(identical(other.token, token) || other.token == token)&&(identical(other.status, status) || other.status == status)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.successMessage, successMessage) || other.successMessage == successMessage));
}


@override
int get hashCode => Object.hash(runtimeType,newPassword,confirmPassword,token,status,errorMessage,successMessage);

@override
String toString() {
  return 'CreatePasswordState(newPassword: $newPassword, confirmPassword: $confirmPassword, token: $token, status: $status, errorMessage: $errorMessage, successMessage: $successMessage)';
}


}

/// @nodoc
abstract mixin class _$CreatePasswordStateCopyWith<$Res> implements $CreatePasswordStateCopyWith<$Res> {
  factory _$CreatePasswordStateCopyWith(_CreatePasswordState value, $Res Function(_CreatePasswordState) _then) = __$CreatePasswordStateCopyWithImpl;
@override @useResult
$Res call({
 PasswordInput newPassword, ConfirmPasswordInput confirmPassword, String token, CreatePasswordStatus status, String? errorMessage, String? successMessage
});




}
/// @nodoc
class __$CreatePasswordStateCopyWithImpl<$Res>
    implements _$CreatePasswordStateCopyWith<$Res> {
  __$CreatePasswordStateCopyWithImpl(this._self, this._then);

  final _CreatePasswordState _self;
  final $Res Function(_CreatePasswordState) _then;

/// Create a copy of CreatePasswordState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? newPassword = null,Object? confirmPassword = null,Object? token = null,Object? status = null,Object? errorMessage = freezed,Object? successMessage = freezed,}) {
  return _then(_CreatePasswordState(
newPassword: null == newPassword ? _self.newPassword : newPassword // ignore: cast_nullable_to_non_nullable
as PasswordInput,confirmPassword: null == confirmPassword ? _self.confirmPassword : confirmPassword // ignore: cast_nullable_to_non_nullable
as ConfirmPasswordInput,token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CreatePasswordStatus,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,successMessage: freezed == successMessage ? _self.successMessage : successMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
