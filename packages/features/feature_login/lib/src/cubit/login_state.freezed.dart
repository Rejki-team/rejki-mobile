// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LoginState {

/// Email atau phone input
 EmailInput get emailOrPhone;/// Password input
 PasswordInput get password;/// Status form
 LoginStatus get status;/// Auth result (minimal info) jika login berhasil
 AuthResult? get authResult;/// Failure jika login gagal
 AuthFailure? get failure;/// Error message untuk display
 String? get errorMessage;
/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginStateCopyWith<LoginState> get copyWith => _$LoginStateCopyWithImpl<LoginState>(this as LoginState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginState&&(identical(other.emailOrPhone, emailOrPhone) || other.emailOrPhone == emailOrPhone)&&(identical(other.password, password) || other.password == password)&&(identical(other.status, status) || other.status == status)&&(identical(other.authResult, authResult) || other.authResult == authResult)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,emailOrPhone,password,status,authResult,failure,errorMessage);

@override
String toString() {
  return 'LoginState(emailOrPhone: $emailOrPhone, password: $password, status: $status, authResult: $authResult, failure: $failure, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $LoginStateCopyWith<$Res>  {
  factory $LoginStateCopyWith(LoginState value, $Res Function(LoginState) _then) = _$LoginStateCopyWithImpl;
@useResult
$Res call({
 EmailInput emailOrPhone, PasswordInput password, LoginStatus status, AuthResult? authResult, AuthFailure? failure, String? errorMessage
});


$AuthResultCopyWith<$Res>? get authResult;$AuthFailureCopyWith<$Res>? get failure;

}
/// @nodoc
class _$LoginStateCopyWithImpl<$Res>
    implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._self, this._then);

  final LoginState _self;
  final $Res Function(LoginState) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? emailOrPhone = null,Object? password = null,Object? status = null,Object? authResult = freezed,Object? failure = freezed,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
emailOrPhone: null == emailOrPhone ? _self.emailOrPhone : emailOrPhone // ignore: cast_nullable_to_non_nullable
as EmailInput,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as PasswordInput,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as LoginStatus,authResult: freezed == authResult ? _self.authResult : authResult // ignore: cast_nullable_to_non_nullable
as AuthResult?,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as AuthFailure?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthResultCopyWith<$Res>? get authResult {
    if (_self.authResult == null) {
    return null;
  }

  return $AuthResultCopyWith<$Res>(_self.authResult!, (value) {
    return _then(_self.copyWith(authResult: value));
  });
}/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthFailureCopyWith<$Res>? get failure {
    if (_self.failure == null) {
    return null;
  }

  return $AuthFailureCopyWith<$Res>(_self.failure!, (value) {
    return _then(_self.copyWith(failure: value));
  });
}
}


/// Adds pattern-matching-related methods to [LoginState].
extension LoginStatePatterns on LoginState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoginState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoginState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoginState value)  $default,){
final _that = this;
switch (_that) {
case _LoginState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoginState value)?  $default,){
final _that = this;
switch (_that) {
case _LoginState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( EmailInput emailOrPhone,  PasswordInput password,  LoginStatus status,  AuthResult? authResult,  AuthFailure? failure,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoginState() when $default != null:
return $default(_that.emailOrPhone,_that.password,_that.status,_that.authResult,_that.failure,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( EmailInput emailOrPhone,  PasswordInput password,  LoginStatus status,  AuthResult? authResult,  AuthFailure? failure,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _LoginState():
return $default(_that.emailOrPhone,_that.password,_that.status,_that.authResult,_that.failure,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( EmailInput emailOrPhone,  PasswordInput password,  LoginStatus status,  AuthResult? authResult,  AuthFailure? failure,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _LoginState() when $default != null:
return $default(_that.emailOrPhone,_that.password,_that.status,_that.authResult,_that.failure,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _LoginState extends LoginState {
  const _LoginState({this.emailOrPhone = const EmailInput.pure(), this.password = const PasswordInput.pure(), this.status = LoginStatus.initial, this.authResult, this.failure, this.errorMessage}): super._();
  

/// Email atau phone input
@override@JsonKey() final  EmailInput emailOrPhone;
/// Password input
@override@JsonKey() final  PasswordInput password;
/// Status form
@override@JsonKey() final  LoginStatus status;
/// Auth result (minimal info) jika login berhasil
@override final  AuthResult? authResult;
/// Failure jika login gagal
@override final  AuthFailure? failure;
/// Error message untuk display
@override final  String? errorMessage;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginStateCopyWith<_LoginState> get copyWith => __$LoginStateCopyWithImpl<_LoginState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginState&&(identical(other.emailOrPhone, emailOrPhone) || other.emailOrPhone == emailOrPhone)&&(identical(other.password, password) || other.password == password)&&(identical(other.status, status) || other.status == status)&&(identical(other.authResult, authResult) || other.authResult == authResult)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,emailOrPhone,password,status,authResult,failure,errorMessage);

@override
String toString() {
  return 'LoginState(emailOrPhone: $emailOrPhone, password: $password, status: $status, authResult: $authResult, failure: $failure, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$LoginStateCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory _$LoginStateCopyWith(_LoginState value, $Res Function(_LoginState) _then) = __$LoginStateCopyWithImpl;
@override @useResult
$Res call({
 EmailInput emailOrPhone, PasswordInput password, LoginStatus status, AuthResult? authResult, AuthFailure? failure, String? errorMessage
});


@override $AuthResultCopyWith<$Res>? get authResult;@override $AuthFailureCopyWith<$Res>? get failure;

}
/// @nodoc
class __$LoginStateCopyWithImpl<$Res>
    implements _$LoginStateCopyWith<$Res> {
  __$LoginStateCopyWithImpl(this._self, this._then);

  final _LoginState _self;
  final $Res Function(_LoginState) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? emailOrPhone = null,Object? password = null,Object? status = null,Object? authResult = freezed,Object? failure = freezed,Object? errorMessage = freezed,}) {
  return _then(_LoginState(
emailOrPhone: null == emailOrPhone ? _self.emailOrPhone : emailOrPhone // ignore: cast_nullable_to_non_nullable
as EmailInput,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as PasswordInput,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as LoginStatus,authResult: freezed == authResult ? _self.authResult : authResult // ignore: cast_nullable_to_non_nullable
as AuthResult?,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as AuthFailure?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthResultCopyWith<$Res>? get authResult {
    if (_self.authResult == null) {
    return null;
  }

  return $AuthResultCopyWith<$Res>(_self.authResult!, (value) {
    return _then(_self.copyWith(authResult: value));
  });
}/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthFailureCopyWith<$Res>? get failure {
    if (_self.failure == null) {
    return null;
  }

  return $AuthFailureCopyWith<$Res>(_self.failure!, (value) {
    return _then(_self.copyWith(failure: value));
  });
}
}

// dart format on
