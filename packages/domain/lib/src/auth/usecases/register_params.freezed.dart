// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RegisterParams {

/// Email user
 String get email;/// Password untuk akun baru
 String get password;/// Nomor telepon dengan format internasional
 String get phoneNumber;/// Data consent/persetujuan T&C
 ConsentModel get consent;
/// Create a copy of RegisterParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterParamsCopyWith<RegisterParams> get copyWith => _$RegisterParamsCopyWithImpl<RegisterParams>(this as RegisterParams, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterParams&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.consent, consent) || other.consent == consent));
}


@override
int get hashCode => Object.hash(runtimeType,email,password,phoneNumber,consent);

@override
String toString() {
  return 'RegisterParams(email: $email, password: $password, phoneNumber: $phoneNumber, consent: $consent)';
}


}

/// @nodoc
abstract mixin class $RegisterParamsCopyWith<$Res>  {
  factory $RegisterParamsCopyWith(RegisterParams value, $Res Function(RegisterParams) _then) = _$RegisterParamsCopyWithImpl;
@useResult
$Res call({
 String email, String password, String phoneNumber, ConsentModel consent
});


$ConsentModelCopyWith<$Res> get consent;

}
/// @nodoc
class _$RegisterParamsCopyWithImpl<$Res>
    implements $RegisterParamsCopyWith<$Res> {
  _$RegisterParamsCopyWithImpl(this._self, this._then);

  final RegisterParams _self;
  final $Res Function(RegisterParams) _then;

/// Create a copy of RegisterParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,Object? password = null,Object? phoneNumber = null,Object? consent = null,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,consent: null == consent ? _self.consent : consent // ignore: cast_nullable_to_non_nullable
as ConsentModel,
  ));
}
/// Create a copy of RegisterParams
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConsentModelCopyWith<$Res> get consent {
  
  return $ConsentModelCopyWith<$Res>(_self.consent, (value) {
    return _then(_self.copyWith(consent: value));
  });
}
}


/// Adds pattern-matching-related methods to [RegisterParams].
extension RegisterParamsPatterns on RegisterParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RegisterParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RegisterParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RegisterParams value)  $default,){
final _that = this;
switch (_that) {
case _RegisterParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RegisterParams value)?  $default,){
final _that = this;
switch (_that) {
case _RegisterParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String email,  String password,  String phoneNumber,  ConsentModel consent)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RegisterParams() when $default != null:
return $default(_that.email,_that.password,_that.phoneNumber,_that.consent);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String email,  String password,  String phoneNumber,  ConsentModel consent)  $default,) {final _that = this;
switch (_that) {
case _RegisterParams():
return $default(_that.email,_that.password,_that.phoneNumber,_that.consent);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String email,  String password,  String phoneNumber,  ConsentModel consent)?  $default,) {final _that = this;
switch (_that) {
case _RegisterParams() when $default != null:
return $default(_that.email,_that.password,_that.phoneNumber,_that.consent);case _:
  return null;

}
}

}

/// @nodoc


class _RegisterParams extends RegisterParams {
  const _RegisterParams({required this.email, required this.password, required this.phoneNumber, required this.consent}): super._();
  

/// Email user
@override final  String email;
/// Password untuk akun baru
@override final  String password;
/// Nomor telepon dengan format internasional
@override final  String phoneNumber;
/// Data consent/persetujuan T&C
@override final  ConsentModel consent;

/// Create a copy of RegisterParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterParamsCopyWith<_RegisterParams> get copyWith => __$RegisterParamsCopyWithImpl<_RegisterParams>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisterParams&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.consent, consent) || other.consent == consent));
}


@override
int get hashCode => Object.hash(runtimeType,email,password,phoneNumber,consent);

@override
String toString() {
  return 'RegisterParams(email: $email, password: $password, phoneNumber: $phoneNumber, consent: $consent)';
}


}

/// @nodoc
abstract mixin class _$RegisterParamsCopyWith<$Res> implements $RegisterParamsCopyWith<$Res> {
  factory _$RegisterParamsCopyWith(_RegisterParams value, $Res Function(_RegisterParams) _then) = __$RegisterParamsCopyWithImpl;
@override @useResult
$Res call({
 String email, String password, String phoneNumber, ConsentModel consent
});


@override $ConsentModelCopyWith<$Res> get consent;

}
/// @nodoc
class __$RegisterParamsCopyWithImpl<$Res>
    implements _$RegisterParamsCopyWith<$Res> {
  __$RegisterParamsCopyWithImpl(this._self, this._then);

  final _RegisterParams _self;
  final $Res Function(_RegisterParams) _then;

/// Create a copy of RegisterParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,Object? phoneNumber = null,Object? consent = null,}) {
  return _then(_RegisterParams(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,consent: null == consent ? _self.consent : consent // ignore: cast_nullable_to_non_nullable
as ConsentModel,
  ));
}

/// Create a copy of RegisterParams
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConsentModelCopyWith<$Res> get consent {
  
  return $ConsentModelCopyWith<$Res>(_self.consent, (value) {
    return _then(_self.copyWith(consent: value));
  });
}
}

// dart format on
