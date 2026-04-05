// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'secondhand_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SecondhandUserModel {

@JsonKey(name: 'phone_number') String get phoneNumber;@JsonKey(name: 'user_info') SecondhandUserInfoModel? get userInfo;
/// Create a copy of SecondhandUserModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SecondhandUserModelCopyWith<SecondhandUserModel> get copyWith => _$SecondhandUserModelCopyWithImpl<SecondhandUserModel>(this as SecondhandUserModel, _$identity);

  /// Serializes this SecondhandUserModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SecondhandUserModel&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.userInfo, userInfo) || other.userInfo == userInfo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,phoneNumber,userInfo);

@override
String toString() {
  return 'SecondhandUserModel(phoneNumber: $phoneNumber, userInfo: $userInfo)';
}


}

/// @nodoc
abstract mixin class $SecondhandUserModelCopyWith<$Res>  {
  factory $SecondhandUserModelCopyWith(SecondhandUserModel value, $Res Function(SecondhandUserModel) _then) = _$SecondhandUserModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'phone_number') String phoneNumber,@JsonKey(name: 'user_info') SecondhandUserInfoModel? userInfo
});


$SecondhandUserInfoModelCopyWith<$Res>? get userInfo;

}
/// @nodoc
class _$SecondhandUserModelCopyWithImpl<$Res>
    implements $SecondhandUserModelCopyWith<$Res> {
  _$SecondhandUserModelCopyWithImpl(this._self, this._then);

  final SecondhandUserModel _self;
  final $Res Function(SecondhandUserModel) _then;

/// Create a copy of SecondhandUserModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? phoneNumber = null,Object? userInfo = freezed,}) {
  return _then(_self.copyWith(
phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,userInfo: freezed == userInfo ? _self.userInfo : userInfo // ignore: cast_nullable_to_non_nullable
as SecondhandUserInfoModel?,
  ));
}
/// Create a copy of SecondhandUserModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SecondhandUserInfoModelCopyWith<$Res>? get userInfo {
    if (_self.userInfo == null) {
    return null;
  }

  return $SecondhandUserInfoModelCopyWith<$Res>(_self.userInfo!, (value) {
    return _then(_self.copyWith(userInfo: value));
  });
}
}


/// Adds pattern-matching-related methods to [SecondhandUserModel].
extension SecondhandUserModelPatterns on SecondhandUserModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SecondhandUserModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SecondhandUserModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SecondhandUserModel value)  $default,){
final _that = this;
switch (_that) {
case _SecondhandUserModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SecondhandUserModel value)?  $default,){
final _that = this;
switch (_that) {
case _SecondhandUserModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'phone_number')  String phoneNumber, @JsonKey(name: 'user_info')  SecondhandUserInfoModel? userInfo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SecondhandUserModel() when $default != null:
return $default(_that.phoneNumber,_that.userInfo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'phone_number')  String phoneNumber, @JsonKey(name: 'user_info')  SecondhandUserInfoModel? userInfo)  $default,) {final _that = this;
switch (_that) {
case _SecondhandUserModel():
return $default(_that.phoneNumber,_that.userInfo);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'phone_number')  String phoneNumber, @JsonKey(name: 'user_info')  SecondhandUserInfoModel? userInfo)?  $default,) {final _that = this;
switch (_that) {
case _SecondhandUserModel() when $default != null:
return $default(_that.phoneNumber,_that.userInfo);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SecondhandUserModel implements SecondhandUserModel {
  const _SecondhandUserModel({@JsonKey(name: 'phone_number') this.phoneNumber = '', @JsonKey(name: 'user_info') this.userInfo});
  factory _SecondhandUserModel.fromJson(Map<String, dynamic> json) => _$SecondhandUserModelFromJson(json);

@override@JsonKey(name: 'phone_number') final  String phoneNumber;
@override@JsonKey(name: 'user_info') final  SecondhandUserInfoModel? userInfo;

/// Create a copy of SecondhandUserModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SecondhandUserModelCopyWith<_SecondhandUserModel> get copyWith => __$SecondhandUserModelCopyWithImpl<_SecondhandUserModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SecondhandUserModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SecondhandUserModel&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.userInfo, userInfo) || other.userInfo == userInfo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,phoneNumber,userInfo);

@override
String toString() {
  return 'SecondhandUserModel(phoneNumber: $phoneNumber, userInfo: $userInfo)';
}


}

/// @nodoc
abstract mixin class _$SecondhandUserModelCopyWith<$Res> implements $SecondhandUserModelCopyWith<$Res> {
  factory _$SecondhandUserModelCopyWith(_SecondhandUserModel value, $Res Function(_SecondhandUserModel) _then) = __$SecondhandUserModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'phone_number') String phoneNumber,@JsonKey(name: 'user_info') SecondhandUserInfoModel? userInfo
});


@override $SecondhandUserInfoModelCopyWith<$Res>? get userInfo;

}
/// @nodoc
class __$SecondhandUserModelCopyWithImpl<$Res>
    implements _$SecondhandUserModelCopyWith<$Res> {
  __$SecondhandUserModelCopyWithImpl(this._self, this._then);

  final _SecondhandUserModel _self;
  final $Res Function(_SecondhandUserModel) _then;

/// Create a copy of SecondhandUserModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? phoneNumber = null,Object? userInfo = freezed,}) {
  return _then(_SecondhandUserModel(
phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,userInfo: freezed == userInfo ? _self.userInfo : userInfo // ignore: cast_nullable_to_non_nullable
as SecondhandUserInfoModel?,
  ));
}

/// Create a copy of SecondhandUserModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SecondhandUserInfoModelCopyWith<$Res>? get userInfo {
    if (_self.userInfo == null) {
    return null;
  }

  return $SecondhandUserInfoModelCopyWith<$Res>(_self.userInfo!, (value) {
    return _then(_self.copyWith(userInfo: value));
  });
}
}

// dart format on
