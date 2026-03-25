// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_verification_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RegisterVerificationState {

/// Kode verifikasi
 String get code;/// Status verifikasi
 RegisterVerificationStatus get status;/// Error message
 String? get errorMessage;/// Countdown timer (dalam detik)
 int get countdown;/// Apakah bisa resend kode
 bool get canResend;
/// Create a copy of RegisterVerificationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterVerificationStateCopyWith<RegisterVerificationState> get copyWith => _$RegisterVerificationStateCopyWithImpl<RegisterVerificationState>(this as RegisterVerificationState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterVerificationState&&(identical(other.code, code) || other.code == code)&&(identical(other.status, status) || other.status == status)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.countdown, countdown) || other.countdown == countdown)&&(identical(other.canResend, canResend) || other.canResend == canResend));
}


@override
int get hashCode => Object.hash(runtimeType,code,status,errorMessage,countdown,canResend);

@override
String toString() {
  return 'RegisterVerificationState(code: $code, status: $status, errorMessage: $errorMessage, countdown: $countdown, canResend: $canResend)';
}


}

/// @nodoc
abstract mixin class $RegisterVerificationStateCopyWith<$Res>  {
  factory $RegisterVerificationStateCopyWith(RegisterVerificationState value, $Res Function(RegisterVerificationState) _then) = _$RegisterVerificationStateCopyWithImpl;
@useResult
$Res call({
 String code, RegisterVerificationStatus status, String? errorMessage, int countdown, bool canResend
});




}
/// @nodoc
class _$RegisterVerificationStateCopyWithImpl<$Res>
    implements $RegisterVerificationStateCopyWith<$Res> {
  _$RegisterVerificationStateCopyWithImpl(this._self, this._then);

  final RegisterVerificationState _self;
  final $Res Function(RegisterVerificationState) _then;

/// Create a copy of RegisterVerificationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? status = null,Object? errorMessage = freezed,Object? countdown = null,Object? canResend = null,}) {
  return _then(_self.copyWith(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as RegisterVerificationStatus,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,countdown: null == countdown ? _self.countdown : countdown // ignore: cast_nullable_to_non_nullable
as int,canResend: null == canResend ? _self.canResend : canResend // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [RegisterVerificationState].
extension RegisterVerificationStatePatterns on RegisterVerificationState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RegisterVerificationState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RegisterVerificationState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RegisterVerificationState value)  $default,){
final _that = this;
switch (_that) {
case _RegisterVerificationState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RegisterVerificationState value)?  $default,){
final _that = this;
switch (_that) {
case _RegisterVerificationState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String code,  RegisterVerificationStatus status,  String? errorMessage,  int countdown,  bool canResend)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RegisterVerificationState() when $default != null:
return $default(_that.code,_that.status,_that.errorMessage,_that.countdown,_that.canResend);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String code,  RegisterVerificationStatus status,  String? errorMessage,  int countdown,  bool canResend)  $default,) {final _that = this;
switch (_that) {
case _RegisterVerificationState():
return $default(_that.code,_that.status,_that.errorMessage,_that.countdown,_that.canResend);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String code,  RegisterVerificationStatus status,  String? errorMessage,  int countdown,  bool canResend)?  $default,) {final _that = this;
switch (_that) {
case _RegisterVerificationState() when $default != null:
return $default(_that.code,_that.status,_that.errorMessage,_that.countdown,_that.canResend);case _:
  return null;

}
}

}

/// @nodoc


class _RegisterVerificationState extends RegisterVerificationState {
  const _RegisterVerificationState({this.code = '', this.status = RegisterVerificationStatus.initial, this.errorMessage, this.countdown = 30, this.canResend = false}): super._();
  

/// Kode verifikasi
@override@JsonKey() final  String code;
/// Status verifikasi
@override@JsonKey() final  RegisterVerificationStatus status;
/// Error message
@override final  String? errorMessage;
/// Countdown timer (dalam detik)
@override@JsonKey() final  int countdown;
/// Apakah bisa resend kode
@override@JsonKey() final  bool canResend;

/// Create a copy of RegisterVerificationState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterVerificationStateCopyWith<_RegisterVerificationState> get copyWith => __$RegisterVerificationStateCopyWithImpl<_RegisterVerificationState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisterVerificationState&&(identical(other.code, code) || other.code == code)&&(identical(other.status, status) || other.status == status)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.countdown, countdown) || other.countdown == countdown)&&(identical(other.canResend, canResend) || other.canResend == canResend));
}


@override
int get hashCode => Object.hash(runtimeType,code,status,errorMessage,countdown,canResend);

@override
String toString() {
  return 'RegisterVerificationState(code: $code, status: $status, errorMessage: $errorMessage, countdown: $countdown, canResend: $canResend)';
}


}

/// @nodoc
abstract mixin class _$RegisterVerificationStateCopyWith<$Res> implements $RegisterVerificationStateCopyWith<$Res> {
  factory _$RegisterVerificationStateCopyWith(_RegisterVerificationState value, $Res Function(_RegisterVerificationState) _then) = __$RegisterVerificationStateCopyWithImpl;
@override @useResult
$Res call({
 String code, RegisterVerificationStatus status, String? errorMessage, int countdown, bool canResend
});




}
/// @nodoc
class __$RegisterVerificationStateCopyWithImpl<$Res>
    implements _$RegisterVerificationStateCopyWith<$Res> {
  __$RegisterVerificationStateCopyWithImpl(this._self, this._then);

  final _RegisterVerificationState _self;
  final $Res Function(_RegisterVerificationState) _then;

/// Create a copy of RegisterVerificationState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? status = null,Object? errorMessage = freezed,Object? countdown = null,Object? canResend = null,}) {
  return _then(_RegisterVerificationState(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as RegisterVerificationStatus,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,countdown: null == countdown ? _self.countdown : countdown // ignore: cast_nullable_to_non_nullable
as int,canResend: null == canResend ? _self.canResend : canResend // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
