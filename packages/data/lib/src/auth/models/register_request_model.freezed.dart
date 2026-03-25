// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RegisterRequestModel {

/// Consent model yang berisi data persetujuan
 ConsentRequestModel get consent;/// Email user
 String get email;/// Password untuk akun baru
 String get password;/// Nomor telepon dengan format internasional
@JsonKey(name: 'phone_number') String get phoneNumber;
/// Create a copy of RegisterRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterRequestModelCopyWith<RegisterRequestModel> get copyWith => _$RegisterRequestModelCopyWithImpl<RegisterRequestModel>(this as RegisterRequestModel, _$identity);

  /// Serializes this RegisterRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterRequestModel&&(identical(other.consent, consent) || other.consent == consent)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,consent,email,password,phoneNumber);

@override
String toString() {
  return 'RegisterRequestModel(consent: $consent, email: $email, password: $password, phoneNumber: $phoneNumber)';
}


}

/// @nodoc
abstract mixin class $RegisterRequestModelCopyWith<$Res>  {
  factory $RegisterRequestModelCopyWith(RegisterRequestModel value, $Res Function(RegisterRequestModel) _then) = _$RegisterRequestModelCopyWithImpl;
@useResult
$Res call({
 ConsentRequestModel consent, String email, String password,@JsonKey(name: 'phone_number') String phoneNumber
});


$ConsentRequestModelCopyWith<$Res> get consent;

}
/// @nodoc
class _$RegisterRequestModelCopyWithImpl<$Res>
    implements $RegisterRequestModelCopyWith<$Res> {
  _$RegisterRequestModelCopyWithImpl(this._self, this._then);

  final RegisterRequestModel _self;
  final $Res Function(RegisterRequestModel) _then;

/// Create a copy of RegisterRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? consent = null,Object? email = null,Object? password = null,Object? phoneNumber = null,}) {
  return _then(_self.copyWith(
consent: null == consent ? _self.consent : consent // ignore: cast_nullable_to_non_nullable
as ConsentRequestModel,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of RegisterRequestModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConsentRequestModelCopyWith<$Res> get consent {
  
  return $ConsentRequestModelCopyWith<$Res>(_self.consent, (value) {
    return _then(_self.copyWith(consent: value));
  });
}
}


/// Adds pattern-matching-related methods to [RegisterRequestModel].
extension RegisterRequestModelPatterns on RegisterRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RegisterRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RegisterRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RegisterRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _RegisterRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RegisterRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _RegisterRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ConsentRequestModel consent,  String email,  String password, @JsonKey(name: 'phone_number')  String phoneNumber)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RegisterRequestModel() when $default != null:
return $default(_that.consent,_that.email,_that.password,_that.phoneNumber);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ConsentRequestModel consent,  String email,  String password, @JsonKey(name: 'phone_number')  String phoneNumber)  $default,) {final _that = this;
switch (_that) {
case _RegisterRequestModel():
return $default(_that.consent,_that.email,_that.password,_that.phoneNumber);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ConsentRequestModel consent,  String email,  String password, @JsonKey(name: 'phone_number')  String phoneNumber)?  $default,) {final _that = this;
switch (_that) {
case _RegisterRequestModel() when $default != null:
return $default(_that.consent,_that.email,_that.password,_that.phoneNumber);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RegisterRequestModel extends RegisterRequestModel {
  const _RegisterRequestModel({required this.consent, required this.email, required this.password, @JsonKey(name: 'phone_number') required this.phoneNumber}): super._();
  factory _RegisterRequestModel.fromJson(Map<String, dynamic> json) => _$RegisterRequestModelFromJson(json);

/// Consent model yang berisi data persetujuan
@override final  ConsentRequestModel consent;
/// Email user
@override final  String email;
/// Password untuk akun baru
@override final  String password;
/// Nomor telepon dengan format internasional
@override@JsonKey(name: 'phone_number') final  String phoneNumber;

/// Create a copy of RegisterRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterRequestModelCopyWith<_RegisterRequestModel> get copyWith => __$RegisterRequestModelCopyWithImpl<_RegisterRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RegisterRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisterRequestModel&&(identical(other.consent, consent) || other.consent == consent)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,consent,email,password,phoneNumber);

@override
String toString() {
  return 'RegisterRequestModel(consent: $consent, email: $email, password: $password, phoneNumber: $phoneNumber)';
}


}

/// @nodoc
abstract mixin class _$RegisterRequestModelCopyWith<$Res> implements $RegisterRequestModelCopyWith<$Res> {
  factory _$RegisterRequestModelCopyWith(_RegisterRequestModel value, $Res Function(_RegisterRequestModel) _then) = __$RegisterRequestModelCopyWithImpl;
@override @useResult
$Res call({
 ConsentRequestModel consent, String email, String password,@JsonKey(name: 'phone_number') String phoneNumber
});


@override $ConsentRequestModelCopyWith<$Res> get consent;

}
/// @nodoc
class __$RegisterRequestModelCopyWithImpl<$Res>
    implements _$RegisterRequestModelCopyWith<$Res> {
  __$RegisterRequestModelCopyWithImpl(this._self, this._then);

  final _RegisterRequestModel _self;
  final $Res Function(_RegisterRequestModel) _then;

/// Create a copy of RegisterRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? consent = null,Object? email = null,Object? password = null,Object? phoneNumber = null,}) {
  return _then(_RegisterRequestModel(
consent: null == consent ? _self.consent : consent // ignore: cast_nullable_to_non_nullable
as ConsentRequestModel,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of RegisterRequestModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConsentRequestModelCopyWith<$Res> get consent {
  
  return $ConsentRequestModelCopyWith<$Res>(_self.consent, (value) {
    return _then(_self.copyWith(consent: value));
  });
}
}


/// @nodoc
mixin _$ConsentRequestModel {

/// Waktu persetujuan dalam format ISO 8601
@JsonKey(name: 'acceptedAt') String get acceptedAt;/// Platform source (android, ios, web)
 String get platform;/// Versi terms yang disetujui
@JsonKey(name: 'termsVersion') String get termsVersion;
/// Create a copy of ConsentRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConsentRequestModelCopyWith<ConsentRequestModel> get copyWith => _$ConsentRequestModelCopyWithImpl<ConsentRequestModel>(this as ConsentRequestModel, _$identity);

  /// Serializes this ConsentRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConsentRequestModel&&(identical(other.acceptedAt, acceptedAt) || other.acceptedAt == acceptedAt)&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.termsVersion, termsVersion) || other.termsVersion == termsVersion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,acceptedAt,platform,termsVersion);

@override
String toString() {
  return 'ConsentRequestModel(acceptedAt: $acceptedAt, platform: $platform, termsVersion: $termsVersion)';
}


}

/// @nodoc
abstract mixin class $ConsentRequestModelCopyWith<$Res>  {
  factory $ConsentRequestModelCopyWith(ConsentRequestModel value, $Res Function(ConsentRequestModel) _then) = _$ConsentRequestModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'acceptedAt') String acceptedAt, String platform,@JsonKey(name: 'termsVersion') String termsVersion
});




}
/// @nodoc
class _$ConsentRequestModelCopyWithImpl<$Res>
    implements $ConsentRequestModelCopyWith<$Res> {
  _$ConsentRequestModelCopyWithImpl(this._self, this._then);

  final ConsentRequestModel _self;
  final $Res Function(ConsentRequestModel) _then;

/// Create a copy of ConsentRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? acceptedAt = null,Object? platform = null,Object? termsVersion = null,}) {
  return _then(_self.copyWith(
acceptedAt: null == acceptedAt ? _self.acceptedAt : acceptedAt // ignore: cast_nullable_to_non_nullable
as String,platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as String,termsVersion: null == termsVersion ? _self.termsVersion : termsVersion // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ConsentRequestModel].
extension ConsentRequestModelPatterns on ConsentRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConsentRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConsentRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConsentRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _ConsentRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConsentRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _ConsentRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'acceptedAt')  String acceptedAt,  String platform, @JsonKey(name: 'termsVersion')  String termsVersion)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConsentRequestModel() when $default != null:
return $default(_that.acceptedAt,_that.platform,_that.termsVersion);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'acceptedAt')  String acceptedAt,  String platform, @JsonKey(name: 'termsVersion')  String termsVersion)  $default,) {final _that = this;
switch (_that) {
case _ConsentRequestModel():
return $default(_that.acceptedAt,_that.platform,_that.termsVersion);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'acceptedAt')  String acceptedAt,  String platform, @JsonKey(name: 'termsVersion')  String termsVersion)?  $default,) {final _that = this;
switch (_that) {
case _ConsentRequestModel() when $default != null:
return $default(_that.acceptedAt,_that.platform,_that.termsVersion);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ConsentRequestModel extends ConsentRequestModel {
  const _ConsentRequestModel({@JsonKey(name: 'acceptedAt') required this.acceptedAt, required this.platform, @JsonKey(name: 'termsVersion') required this.termsVersion}): super._();
  factory _ConsentRequestModel.fromJson(Map<String, dynamic> json) => _$ConsentRequestModelFromJson(json);

/// Waktu persetujuan dalam format ISO 8601
@override@JsonKey(name: 'acceptedAt') final  String acceptedAt;
/// Platform source (android, ios, web)
@override final  String platform;
/// Versi terms yang disetujui
@override@JsonKey(name: 'termsVersion') final  String termsVersion;

/// Create a copy of ConsentRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConsentRequestModelCopyWith<_ConsentRequestModel> get copyWith => __$ConsentRequestModelCopyWithImpl<_ConsentRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConsentRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConsentRequestModel&&(identical(other.acceptedAt, acceptedAt) || other.acceptedAt == acceptedAt)&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.termsVersion, termsVersion) || other.termsVersion == termsVersion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,acceptedAt,platform,termsVersion);

@override
String toString() {
  return 'ConsentRequestModel(acceptedAt: $acceptedAt, platform: $platform, termsVersion: $termsVersion)';
}


}

/// @nodoc
abstract mixin class _$ConsentRequestModelCopyWith<$Res> implements $ConsentRequestModelCopyWith<$Res> {
  factory _$ConsentRequestModelCopyWith(_ConsentRequestModel value, $Res Function(_ConsentRequestModel) _then) = __$ConsentRequestModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'acceptedAt') String acceptedAt, String platform,@JsonKey(name: 'termsVersion') String termsVersion
});




}
/// @nodoc
class __$ConsentRequestModelCopyWithImpl<$Res>
    implements _$ConsentRequestModelCopyWith<$Res> {
  __$ConsentRequestModelCopyWithImpl(this._self, this._then);

  final _ConsentRequestModel _self;
  final $Res Function(_ConsentRequestModel) _then;

/// Create a copy of ConsentRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? acceptedAt = null,Object? platform = null,Object? termsVersion = null,}) {
  return _then(_ConsentRequestModel(
acceptedAt: null == acceptedAt ? _self.acceptedAt : acceptedAt // ignore: cast_nullable_to_non_nullable
as String,platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as String,termsVersion: null == termsVersion ? _self.termsVersion : termsVersion // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
