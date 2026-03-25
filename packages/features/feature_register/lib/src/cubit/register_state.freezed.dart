// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RegisterState {

/// Input email
 EmailInput get email;/// Input phone
 PhoneInput get phone;/// Input password
 PasswordInput get password;/// Input confirm password
 ConfirmPasswordInput get confirmPassword;/// Consent model dari halaman T&C
 ConsentModel? get consent;/// Status form
 RegisterStatus get status;/// Error message jika gagal
 String? get errorMessage;/// Success message dari response API
 String? get successMessage;
/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterStateCopyWith<RegisterState> get copyWith => _$RegisterStateCopyWithImpl<RegisterState>(this as RegisterState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterState&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.password, password) || other.password == password)&&(identical(other.confirmPassword, confirmPassword) || other.confirmPassword == confirmPassword)&&(identical(other.consent, consent) || other.consent == consent)&&(identical(other.status, status) || other.status == status)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.successMessage, successMessage) || other.successMessage == successMessage));
}


@override
int get hashCode => Object.hash(runtimeType,email,phone,password,confirmPassword,consent,status,errorMessage,successMessage);

@override
String toString() {
  return 'RegisterState(email: $email, phone: $phone, password: $password, confirmPassword: $confirmPassword, consent: $consent, status: $status, errorMessage: $errorMessage, successMessage: $successMessage)';
}


}

/// @nodoc
abstract mixin class $RegisterStateCopyWith<$Res>  {
  factory $RegisterStateCopyWith(RegisterState value, $Res Function(RegisterState) _then) = _$RegisterStateCopyWithImpl;
@useResult
$Res call({
 EmailInput email, PhoneInput phone, PasswordInput password, ConfirmPasswordInput confirmPassword, ConsentModel? consent, RegisterStatus status, String? errorMessage, String? successMessage
});


$ConsentModelCopyWith<$Res>? get consent;

}
/// @nodoc
class _$RegisterStateCopyWithImpl<$Res>
    implements $RegisterStateCopyWith<$Res> {
  _$RegisterStateCopyWithImpl(this._self, this._then);

  final RegisterState _self;
  final $Res Function(RegisterState) _then;

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,Object? phone = null,Object? password = null,Object? confirmPassword = null,Object? consent = freezed,Object? status = null,Object? errorMessage = freezed,Object? successMessage = freezed,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as EmailInput,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as PhoneInput,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as PasswordInput,confirmPassword: null == confirmPassword ? _self.confirmPassword : confirmPassword // ignore: cast_nullable_to_non_nullable
as ConfirmPasswordInput,consent: freezed == consent ? _self.consent : consent // ignore: cast_nullable_to_non_nullable
as ConsentModel?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as RegisterStatus,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,successMessage: freezed == successMessage ? _self.successMessage : successMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConsentModelCopyWith<$Res>? get consent {
    if (_self.consent == null) {
    return null;
  }

  return $ConsentModelCopyWith<$Res>(_self.consent!, (value) {
    return _then(_self.copyWith(consent: value));
  });
}
}


/// Adds pattern-matching-related methods to [RegisterState].
extension RegisterStatePatterns on RegisterState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RegisterState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RegisterState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RegisterState value)  $default,){
final _that = this;
switch (_that) {
case _RegisterState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RegisterState value)?  $default,){
final _that = this;
switch (_that) {
case _RegisterState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( EmailInput email,  PhoneInput phone,  PasswordInput password,  ConfirmPasswordInput confirmPassword,  ConsentModel? consent,  RegisterStatus status,  String? errorMessage,  String? successMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RegisterState() when $default != null:
return $default(_that.email,_that.phone,_that.password,_that.confirmPassword,_that.consent,_that.status,_that.errorMessage,_that.successMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( EmailInput email,  PhoneInput phone,  PasswordInput password,  ConfirmPasswordInput confirmPassword,  ConsentModel? consent,  RegisterStatus status,  String? errorMessage,  String? successMessage)  $default,) {final _that = this;
switch (_that) {
case _RegisterState():
return $default(_that.email,_that.phone,_that.password,_that.confirmPassword,_that.consent,_that.status,_that.errorMessage,_that.successMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( EmailInput email,  PhoneInput phone,  PasswordInput password,  ConfirmPasswordInput confirmPassword,  ConsentModel? consent,  RegisterStatus status,  String? errorMessage,  String? successMessage)?  $default,) {final _that = this;
switch (_that) {
case _RegisterState() when $default != null:
return $default(_that.email,_that.phone,_that.password,_that.confirmPassword,_that.consent,_that.status,_that.errorMessage,_that.successMessage);case _:
  return null;

}
}

}

/// @nodoc


class _RegisterState extends RegisterState {
  const _RegisterState({this.email = const EmailInput.pure(), this.phone = const PhoneInput.pure(), this.password = const PasswordInput.pure(), this.confirmPassword = const ConfirmPasswordInput.pure(), this.consent, this.status = RegisterStatus.initial, this.errorMessage, this.successMessage}): super._();
  

/// Input email
@override@JsonKey() final  EmailInput email;
/// Input phone
@override@JsonKey() final  PhoneInput phone;
/// Input password
@override@JsonKey() final  PasswordInput password;
/// Input confirm password
@override@JsonKey() final  ConfirmPasswordInput confirmPassword;
/// Consent model dari halaman T&C
@override final  ConsentModel? consent;
/// Status form
@override@JsonKey() final  RegisterStatus status;
/// Error message jika gagal
@override final  String? errorMessage;
/// Success message dari response API
@override final  String? successMessage;

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterStateCopyWith<_RegisterState> get copyWith => __$RegisterStateCopyWithImpl<_RegisterState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisterState&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.password, password) || other.password == password)&&(identical(other.confirmPassword, confirmPassword) || other.confirmPassword == confirmPassword)&&(identical(other.consent, consent) || other.consent == consent)&&(identical(other.status, status) || other.status == status)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.successMessage, successMessage) || other.successMessage == successMessage));
}


@override
int get hashCode => Object.hash(runtimeType,email,phone,password,confirmPassword,consent,status,errorMessage,successMessage);

@override
String toString() {
  return 'RegisterState(email: $email, phone: $phone, password: $password, confirmPassword: $confirmPassword, consent: $consent, status: $status, errorMessage: $errorMessage, successMessage: $successMessage)';
}


}

/// @nodoc
abstract mixin class _$RegisterStateCopyWith<$Res> implements $RegisterStateCopyWith<$Res> {
  factory _$RegisterStateCopyWith(_RegisterState value, $Res Function(_RegisterState) _then) = __$RegisterStateCopyWithImpl;
@override @useResult
$Res call({
 EmailInput email, PhoneInput phone, PasswordInput password, ConfirmPasswordInput confirmPassword, ConsentModel? consent, RegisterStatus status, String? errorMessage, String? successMessage
});


@override $ConsentModelCopyWith<$Res>? get consent;

}
/// @nodoc
class __$RegisterStateCopyWithImpl<$Res>
    implements _$RegisterStateCopyWith<$Res> {
  __$RegisterStateCopyWithImpl(this._self, this._then);

  final _RegisterState _self;
  final $Res Function(_RegisterState) _then;

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? phone = null,Object? password = null,Object? confirmPassword = null,Object? consent = freezed,Object? status = null,Object? errorMessage = freezed,Object? successMessage = freezed,}) {
  return _then(_RegisterState(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as EmailInput,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as PhoneInput,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as PasswordInput,confirmPassword: null == confirmPassword ? _self.confirmPassword : confirmPassword // ignore: cast_nullable_to_non_nullable
as ConfirmPasswordInput,consent: freezed == consent ? _self.consent : consent // ignore: cast_nullable_to_non_nullable
as ConsentModel?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as RegisterStatus,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,successMessage: freezed == successMessage ? _self.successMessage : successMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConsentModelCopyWith<$Res>? get consent {
    if (_self.consent == null) {
    return null;
  }

  return $ConsentModelCopyWith<$Res>(_self.consent!, (value) {
    return _then(_self.copyWith(consent: value));
  });
}
}

// dart format on
