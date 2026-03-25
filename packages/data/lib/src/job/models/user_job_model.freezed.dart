// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_job_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserInfoJobModel {

@JsonKey(name: 'full_name') String get fullName;
/// Create a copy of UserInfoJobModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserInfoJobModelCopyWith<UserInfoJobModel> get copyWith => _$UserInfoJobModelCopyWithImpl<UserInfoJobModel>(this as UserInfoJobModel, _$identity);

  /// Serializes this UserInfoJobModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserInfoJobModel&&(identical(other.fullName, fullName) || other.fullName == fullName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullName);

@override
String toString() {
  return 'UserInfoJobModel(fullName: $fullName)';
}


}

/// @nodoc
abstract mixin class $UserInfoJobModelCopyWith<$Res>  {
  factory $UserInfoJobModelCopyWith(UserInfoJobModel value, $Res Function(UserInfoJobModel) _then) = _$UserInfoJobModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'full_name') String fullName
});




}
/// @nodoc
class _$UserInfoJobModelCopyWithImpl<$Res>
    implements $UserInfoJobModelCopyWith<$Res> {
  _$UserInfoJobModelCopyWithImpl(this._self, this._then);

  final UserInfoJobModel _self;
  final $Res Function(UserInfoJobModel) _then;

/// Create a copy of UserInfoJobModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fullName = null,}) {
  return _then(_self.copyWith(
fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UserInfoJobModel].
extension UserInfoJobModelPatterns on UserInfoJobModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserInfoJobModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserInfoJobModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserInfoJobModel value)  $default,){
final _that = this;
switch (_that) {
case _UserInfoJobModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserInfoJobModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserInfoJobModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'full_name')  String fullName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserInfoJobModel() when $default != null:
return $default(_that.fullName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'full_name')  String fullName)  $default,) {final _that = this;
switch (_that) {
case _UserInfoJobModel():
return $default(_that.fullName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'full_name')  String fullName)?  $default,) {final _that = this;
switch (_that) {
case _UserInfoJobModel() when $default != null:
return $default(_that.fullName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserInfoJobModel implements UserInfoJobModel {
  const _UserInfoJobModel({@JsonKey(name: 'full_name') this.fullName = ''});
  factory _UserInfoJobModel.fromJson(Map<String, dynamic> json) => _$UserInfoJobModelFromJson(json);

@override@JsonKey(name: 'full_name') final  String fullName;

/// Create a copy of UserInfoJobModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserInfoJobModelCopyWith<_UserInfoJobModel> get copyWith => __$UserInfoJobModelCopyWithImpl<_UserInfoJobModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserInfoJobModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserInfoJobModel&&(identical(other.fullName, fullName) || other.fullName == fullName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullName);

@override
String toString() {
  return 'UserInfoJobModel(fullName: $fullName)';
}


}

/// @nodoc
abstract mixin class _$UserInfoJobModelCopyWith<$Res> implements $UserInfoJobModelCopyWith<$Res> {
  factory _$UserInfoJobModelCopyWith(_UserInfoJobModel value, $Res Function(_UserInfoJobModel) _then) = __$UserInfoJobModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'full_name') String fullName
});




}
/// @nodoc
class __$UserInfoJobModelCopyWithImpl<$Res>
    implements _$UserInfoJobModelCopyWith<$Res> {
  __$UserInfoJobModelCopyWithImpl(this._self, this._then);

  final _UserInfoJobModel _self;
  final $Res Function(_UserInfoJobModel) _then;

/// Create a copy of UserInfoJobModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fullName = null,}) {
  return _then(_UserInfoJobModel(
fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$UserJobModel {

@JsonKey(name: 'phone_number') String get phoneNumber;@JsonKey(name: 'user_info') UserInfoJobModel? get userInfo;
/// Create a copy of UserJobModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserJobModelCopyWith<UserJobModel> get copyWith => _$UserJobModelCopyWithImpl<UserJobModel>(this as UserJobModel, _$identity);

  /// Serializes this UserJobModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserJobModel&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.userInfo, userInfo) || other.userInfo == userInfo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,phoneNumber,userInfo);

@override
String toString() {
  return 'UserJobModel(phoneNumber: $phoneNumber, userInfo: $userInfo)';
}


}

/// @nodoc
abstract mixin class $UserJobModelCopyWith<$Res>  {
  factory $UserJobModelCopyWith(UserJobModel value, $Res Function(UserJobModel) _then) = _$UserJobModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'phone_number') String phoneNumber,@JsonKey(name: 'user_info') UserInfoJobModel? userInfo
});


$UserInfoJobModelCopyWith<$Res>? get userInfo;

}
/// @nodoc
class _$UserJobModelCopyWithImpl<$Res>
    implements $UserJobModelCopyWith<$Res> {
  _$UserJobModelCopyWithImpl(this._self, this._then);

  final UserJobModel _self;
  final $Res Function(UserJobModel) _then;

/// Create a copy of UserJobModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? phoneNumber = null,Object? userInfo = freezed,}) {
  return _then(_self.copyWith(
phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,userInfo: freezed == userInfo ? _self.userInfo : userInfo // ignore: cast_nullable_to_non_nullable
as UserInfoJobModel?,
  ));
}
/// Create a copy of UserJobModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserInfoJobModelCopyWith<$Res>? get userInfo {
    if (_self.userInfo == null) {
    return null;
  }

  return $UserInfoJobModelCopyWith<$Res>(_self.userInfo!, (value) {
    return _then(_self.copyWith(userInfo: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserJobModel].
extension UserJobModelPatterns on UserJobModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserJobModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserJobModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserJobModel value)  $default,){
final _that = this;
switch (_that) {
case _UserJobModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserJobModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserJobModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'phone_number')  String phoneNumber, @JsonKey(name: 'user_info')  UserInfoJobModel? userInfo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserJobModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'phone_number')  String phoneNumber, @JsonKey(name: 'user_info')  UserInfoJobModel? userInfo)  $default,) {final _that = this;
switch (_that) {
case _UserJobModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'phone_number')  String phoneNumber, @JsonKey(name: 'user_info')  UserInfoJobModel? userInfo)?  $default,) {final _that = this;
switch (_that) {
case _UserJobModel() when $default != null:
return $default(_that.phoneNumber,_that.userInfo);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserJobModel implements UserJobModel {
  const _UserJobModel({@JsonKey(name: 'phone_number') this.phoneNumber = '', @JsonKey(name: 'user_info') this.userInfo});
  factory _UserJobModel.fromJson(Map<String, dynamic> json) => _$UserJobModelFromJson(json);

@override@JsonKey(name: 'phone_number') final  String phoneNumber;
@override@JsonKey(name: 'user_info') final  UserInfoJobModel? userInfo;

/// Create a copy of UserJobModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserJobModelCopyWith<_UserJobModel> get copyWith => __$UserJobModelCopyWithImpl<_UserJobModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserJobModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserJobModel&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.userInfo, userInfo) || other.userInfo == userInfo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,phoneNumber,userInfo);

@override
String toString() {
  return 'UserJobModel(phoneNumber: $phoneNumber, userInfo: $userInfo)';
}


}

/// @nodoc
abstract mixin class _$UserJobModelCopyWith<$Res> implements $UserJobModelCopyWith<$Res> {
  factory _$UserJobModelCopyWith(_UserJobModel value, $Res Function(_UserJobModel) _then) = __$UserJobModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'phone_number') String phoneNumber,@JsonKey(name: 'user_info') UserInfoJobModel? userInfo
});


@override $UserInfoJobModelCopyWith<$Res>? get userInfo;

}
/// @nodoc
class __$UserJobModelCopyWithImpl<$Res>
    implements _$UserJobModelCopyWith<$Res> {
  __$UserJobModelCopyWithImpl(this._self, this._then);

  final _UserJobModel _self;
  final $Res Function(_UserJobModel) _then;

/// Create a copy of UserJobModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? phoneNumber = null,Object? userInfo = freezed,}) {
  return _then(_UserJobModel(
phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,userInfo: freezed == userInfo ? _self.userInfo : userInfo // ignore: cast_nullable_to_non_nullable
as UserInfoJobModel?,
  ));
}

/// Create a copy of UserJobModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserInfoJobModelCopyWith<$Res>? get userInfo {
    if (_self.userInfo == null) {
    return null;
  }

  return $UserInfoJobModelCopyWith<$Res>(_self.userInfo!, (value) {
    return _then(_self.copyWith(userInfo: value));
  });
}
}

// dart format on
