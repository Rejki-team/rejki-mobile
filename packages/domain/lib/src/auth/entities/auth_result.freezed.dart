// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthResult {

/// Apakah authentication berhasil
 bool get isAuthenticated;/// Nama user untuk greeting (bisa null jika belum diisi)
 String? get displayName;/// Email user
 String get email;/// Status verifikasi akun
 String get verificationStatus;/// Pesan tambahan (optional)
 String? get message;
/// Create a copy of AuthResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthResultCopyWith<AuthResult> get copyWith => _$AuthResultCopyWithImpl<AuthResult>(this as AuthResult, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthResult&&(identical(other.isAuthenticated, isAuthenticated) || other.isAuthenticated == isAuthenticated)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.email, email) || other.email == email)&&(identical(other.verificationStatus, verificationStatus) || other.verificationStatus == verificationStatus)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,isAuthenticated,displayName,email,verificationStatus,message);

@override
String toString() {
  return 'AuthResult(isAuthenticated: $isAuthenticated, displayName: $displayName, email: $email, verificationStatus: $verificationStatus, message: $message)';
}


}

/// @nodoc
abstract mixin class $AuthResultCopyWith<$Res>  {
  factory $AuthResultCopyWith(AuthResult value, $Res Function(AuthResult) _then) = _$AuthResultCopyWithImpl;
@useResult
$Res call({
 bool isAuthenticated, String? displayName, String email, String verificationStatus, String? message
});




}
/// @nodoc
class _$AuthResultCopyWithImpl<$Res>
    implements $AuthResultCopyWith<$Res> {
  _$AuthResultCopyWithImpl(this._self, this._then);

  final AuthResult _self;
  final $Res Function(AuthResult) _then;

/// Create a copy of AuthResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isAuthenticated = null,Object? displayName = freezed,Object? email = null,Object? verificationStatus = null,Object? message = freezed,}) {
  return _then(_self.copyWith(
isAuthenticated: null == isAuthenticated ? _self.isAuthenticated : isAuthenticated // ignore: cast_nullable_to_non_nullable
as bool,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,verificationStatus: null == verificationStatus ? _self.verificationStatus : verificationStatus // ignore: cast_nullable_to_non_nullable
as String,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthResult].
extension AuthResultPatterns on AuthResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthResult value)  $default,){
final _that = this;
switch (_that) {
case _AuthResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthResult value)?  $default,){
final _that = this;
switch (_that) {
case _AuthResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isAuthenticated,  String? displayName,  String email,  String verificationStatus,  String? message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthResult() when $default != null:
return $default(_that.isAuthenticated,_that.displayName,_that.email,_that.verificationStatus,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isAuthenticated,  String? displayName,  String email,  String verificationStatus,  String? message)  $default,) {final _that = this;
switch (_that) {
case _AuthResult():
return $default(_that.isAuthenticated,_that.displayName,_that.email,_that.verificationStatus,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isAuthenticated,  String? displayName,  String email,  String verificationStatus,  String? message)?  $default,) {final _that = this;
switch (_that) {
case _AuthResult() when $default != null:
return $default(_that.isAuthenticated,_that.displayName,_that.email,_that.verificationStatus,_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _AuthResult implements AuthResult {
  const _AuthResult({required this.isAuthenticated, this.displayName, required this.email, required this.verificationStatus, this.message});
  

/// Apakah authentication berhasil
@override final  bool isAuthenticated;
/// Nama user untuk greeting (bisa null jika belum diisi)
@override final  String? displayName;
/// Email user
@override final  String email;
/// Status verifikasi akun
@override final  String verificationStatus;
/// Pesan tambahan (optional)
@override final  String? message;

/// Create a copy of AuthResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthResultCopyWith<_AuthResult> get copyWith => __$AuthResultCopyWithImpl<_AuthResult>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthResult&&(identical(other.isAuthenticated, isAuthenticated) || other.isAuthenticated == isAuthenticated)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.email, email) || other.email == email)&&(identical(other.verificationStatus, verificationStatus) || other.verificationStatus == verificationStatus)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,isAuthenticated,displayName,email,verificationStatus,message);

@override
String toString() {
  return 'AuthResult(isAuthenticated: $isAuthenticated, displayName: $displayName, email: $email, verificationStatus: $verificationStatus, message: $message)';
}


}

/// @nodoc
abstract mixin class _$AuthResultCopyWith<$Res> implements $AuthResultCopyWith<$Res> {
  factory _$AuthResultCopyWith(_AuthResult value, $Res Function(_AuthResult) _then) = __$AuthResultCopyWithImpl;
@override @useResult
$Res call({
 bool isAuthenticated, String? displayName, String email, String verificationStatus, String? message
});




}
/// @nodoc
class __$AuthResultCopyWithImpl<$Res>
    implements _$AuthResultCopyWith<$Res> {
  __$AuthResultCopyWithImpl(this._self, this._then);

  final _AuthResult _self;
  final $Res Function(_AuthResult) _then;

/// Create a copy of AuthResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isAuthenticated = null,Object? displayName = freezed,Object? email = null,Object? verificationStatus = null,Object? message = freezed,}) {
  return _then(_AuthResult(
isAuthenticated: null == isAuthenticated ? _self.isAuthenticated : isAuthenticated // ignore: cast_nullable_to_non_nullable
as bool,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,verificationStatus: null == verificationStatus ? _self.verificationStatus : verificationStatus // ignore: cast_nullable_to_non_nullable
as String,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
