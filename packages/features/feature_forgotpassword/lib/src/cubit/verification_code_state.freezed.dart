// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verification_code_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VerificationCodeState {

/// Kode verifikasi yang diinput
 String get code;/// Status form
 VerificationCodeStatus get status;/// Error message jika gagal
 String? get errorMessage;/// Success message jika berhasil verifikasi
 String? get successMessage;/// Message setelah resend OTP
 String? get resendMessage;/// Sisa waktu countdown (dalam detik)
 int get countdown;/// Apakah bisa resend code
 bool get canResend;
/// Create a copy of VerificationCodeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerificationCodeStateCopyWith<VerificationCodeState> get copyWith => _$VerificationCodeStateCopyWithImpl<VerificationCodeState>(this as VerificationCodeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerificationCodeState&&(identical(other.code, code) || other.code == code)&&(identical(other.status, status) || other.status == status)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.successMessage, successMessage) || other.successMessage == successMessage)&&(identical(other.resendMessage, resendMessage) || other.resendMessage == resendMessage)&&(identical(other.countdown, countdown) || other.countdown == countdown)&&(identical(other.canResend, canResend) || other.canResend == canResend));
}


@override
int get hashCode => Object.hash(runtimeType,code,status,errorMessage,successMessage,resendMessage,countdown,canResend);

@override
String toString() {
  return 'VerificationCodeState(code: $code, status: $status, errorMessage: $errorMessage, successMessage: $successMessage, resendMessage: $resendMessage, countdown: $countdown, canResend: $canResend)';
}


}

/// @nodoc
abstract mixin class $VerificationCodeStateCopyWith<$Res>  {
  factory $VerificationCodeStateCopyWith(VerificationCodeState value, $Res Function(VerificationCodeState) _then) = _$VerificationCodeStateCopyWithImpl;
@useResult
$Res call({
 String code, VerificationCodeStatus status, String? errorMessage, String? successMessage, String? resendMessage, int countdown, bool canResend
});




}
/// @nodoc
class _$VerificationCodeStateCopyWithImpl<$Res>
    implements $VerificationCodeStateCopyWith<$Res> {
  _$VerificationCodeStateCopyWithImpl(this._self, this._then);

  final VerificationCodeState _self;
  final $Res Function(VerificationCodeState) _then;

/// Create a copy of VerificationCodeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? status = null,Object? errorMessage = freezed,Object? successMessage = freezed,Object? resendMessage = freezed,Object? countdown = null,Object? canResend = null,}) {
  return _then(_self.copyWith(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as VerificationCodeStatus,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,successMessage: freezed == successMessage ? _self.successMessage : successMessage // ignore: cast_nullable_to_non_nullable
as String?,resendMessage: freezed == resendMessage ? _self.resendMessage : resendMessage // ignore: cast_nullable_to_non_nullable
as String?,countdown: null == countdown ? _self.countdown : countdown // ignore: cast_nullable_to_non_nullable
as int,canResend: null == canResend ? _self.canResend : canResend // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [VerificationCodeState].
extension VerificationCodeStatePatterns on VerificationCodeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VerificationCodeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VerificationCodeState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VerificationCodeState value)  $default,){
final _that = this;
switch (_that) {
case _VerificationCodeState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VerificationCodeState value)?  $default,){
final _that = this;
switch (_that) {
case _VerificationCodeState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String code,  VerificationCodeStatus status,  String? errorMessage,  String? successMessage,  String? resendMessage,  int countdown,  bool canResend)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VerificationCodeState() when $default != null:
return $default(_that.code,_that.status,_that.errorMessage,_that.successMessage,_that.resendMessage,_that.countdown,_that.canResend);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String code,  VerificationCodeStatus status,  String? errorMessage,  String? successMessage,  String? resendMessage,  int countdown,  bool canResend)  $default,) {final _that = this;
switch (_that) {
case _VerificationCodeState():
return $default(_that.code,_that.status,_that.errorMessage,_that.successMessage,_that.resendMessage,_that.countdown,_that.canResend);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String code,  VerificationCodeStatus status,  String? errorMessage,  String? successMessage,  String? resendMessage,  int countdown,  bool canResend)?  $default,) {final _that = this;
switch (_that) {
case _VerificationCodeState() when $default != null:
return $default(_that.code,_that.status,_that.errorMessage,_that.successMessage,_that.resendMessage,_that.countdown,_that.canResend);case _:
  return null;

}
}

}

/// @nodoc


class _VerificationCodeState extends VerificationCodeState {
  const _VerificationCodeState({this.code = '', this.status = VerificationCodeStatus.initial, this.errorMessage, this.successMessage, this.resendMessage, this.countdown = 30, this.canResend = false}): super._();
  

/// Kode verifikasi yang diinput
@override@JsonKey() final  String code;
/// Status form
@override@JsonKey() final  VerificationCodeStatus status;
/// Error message jika gagal
@override final  String? errorMessage;
/// Success message jika berhasil verifikasi
@override final  String? successMessage;
/// Message setelah resend OTP
@override final  String? resendMessage;
/// Sisa waktu countdown (dalam detik)
@override@JsonKey() final  int countdown;
/// Apakah bisa resend code
@override@JsonKey() final  bool canResend;

/// Create a copy of VerificationCodeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VerificationCodeStateCopyWith<_VerificationCodeState> get copyWith => __$VerificationCodeStateCopyWithImpl<_VerificationCodeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerificationCodeState&&(identical(other.code, code) || other.code == code)&&(identical(other.status, status) || other.status == status)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.successMessage, successMessage) || other.successMessage == successMessage)&&(identical(other.resendMessage, resendMessage) || other.resendMessage == resendMessage)&&(identical(other.countdown, countdown) || other.countdown == countdown)&&(identical(other.canResend, canResend) || other.canResend == canResend));
}


@override
int get hashCode => Object.hash(runtimeType,code,status,errorMessage,successMessage,resendMessage,countdown,canResend);

@override
String toString() {
  return 'VerificationCodeState(code: $code, status: $status, errorMessage: $errorMessage, successMessage: $successMessage, resendMessage: $resendMessage, countdown: $countdown, canResend: $canResend)';
}


}

/// @nodoc
abstract mixin class _$VerificationCodeStateCopyWith<$Res> implements $VerificationCodeStateCopyWith<$Res> {
  factory _$VerificationCodeStateCopyWith(_VerificationCodeState value, $Res Function(_VerificationCodeState) _then) = __$VerificationCodeStateCopyWithImpl;
@override @useResult
$Res call({
 String code, VerificationCodeStatus status, String? errorMessage, String? successMessage, String? resendMessage, int countdown, bool canResend
});




}
/// @nodoc
class __$VerificationCodeStateCopyWithImpl<$Res>
    implements _$VerificationCodeStateCopyWith<$Res> {
  __$VerificationCodeStateCopyWithImpl(this._self, this._then);

  final _VerificationCodeState _self;
  final $Res Function(_VerificationCodeState) _then;

/// Create a copy of VerificationCodeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? status = null,Object? errorMessage = freezed,Object? successMessage = freezed,Object? resendMessage = freezed,Object? countdown = null,Object? canResend = null,}) {
  return _then(_VerificationCodeState(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as VerificationCodeStatus,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,successMessage: freezed == successMessage ? _self.successMessage : successMessage // ignore: cast_nullable_to_non_nullable
as String?,resendMessage: freezed == resendMessage ? _self.resendMessage : resendMessage // ignore: cast_nullable_to_non_nullable
as String?,countdown: null == countdown ? _self.countdown : countdown // ignore: cast_nullable_to_non_nullable
as int,canResend: null == canResend ? _self.canResend : canResend // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
