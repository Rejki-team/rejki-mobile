// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_info_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserInfoEntity {

 String get id; String get userId; String get fullName; String get nik; String get gender; DateTime get dob; String get province; String get city; String get districts; String get village; String get rtRw; String get ktpFilePath; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of UserInfoEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserInfoEntityCopyWith<UserInfoEntity> get copyWith => _$UserInfoEntityCopyWithImpl<UserInfoEntity>(this as UserInfoEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserInfoEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.nik, nik) || other.nik == nik)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.dob, dob) || other.dob == dob)&&(identical(other.province, province) || other.province == province)&&(identical(other.city, city) || other.city == city)&&(identical(other.districts, districts) || other.districts == districts)&&(identical(other.village, village) || other.village == village)&&(identical(other.rtRw, rtRw) || other.rtRw == rtRw)&&(identical(other.ktpFilePath, ktpFilePath) || other.ktpFilePath == ktpFilePath)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,userId,fullName,nik,gender,dob,province,city,districts,village,rtRw,ktpFilePath,createdAt,updatedAt);

@override
String toString() {
  return 'UserInfoEntity(id: $id, userId: $userId, fullName: $fullName, nik: $nik, gender: $gender, dob: $dob, province: $province, city: $city, districts: $districts, village: $village, rtRw: $rtRw, ktpFilePath: $ktpFilePath, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $UserInfoEntityCopyWith<$Res>  {
  factory $UserInfoEntityCopyWith(UserInfoEntity value, $Res Function(UserInfoEntity) _then) = _$UserInfoEntityCopyWithImpl;
@useResult
$Res call({
 String id, String userId, String fullName, String nik, String gender, DateTime dob, String province, String city, String districts, String village, String rtRw, String ktpFilePath, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$UserInfoEntityCopyWithImpl<$Res>
    implements $UserInfoEntityCopyWith<$Res> {
  _$UserInfoEntityCopyWithImpl(this._self, this._then);

  final UserInfoEntity _self;
  final $Res Function(UserInfoEntity) _then;

/// Create a copy of UserInfoEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? fullName = null,Object? nik = null,Object? gender = null,Object? dob = null,Object? province = null,Object? city = null,Object? districts = null,Object? village = null,Object? rtRw = null,Object? ktpFilePath = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,nik: null == nik ? _self.nik : nik // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,dob: null == dob ? _self.dob : dob // ignore: cast_nullable_to_non_nullable
as DateTime,province: null == province ? _self.province : province // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,districts: null == districts ? _self.districts : districts // ignore: cast_nullable_to_non_nullable
as String,village: null == village ? _self.village : village // ignore: cast_nullable_to_non_nullable
as String,rtRw: null == rtRw ? _self.rtRw : rtRw // ignore: cast_nullable_to_non_nullable
as String,ktpFilePath: null == ktpFilePath ? _self.ktpFilePath : ktpFilePath // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [UserInfoEntity].
extension UserInfoEntityPatterns on UserInfoEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserInfoEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserInfoEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserInfoEntity value)  $default,){
final _that = this;
switch (_that) {
case _UserInfoEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserInfoEntity value)?  $default,){
final _that = this;
switch (_that) {
case _UserInfoEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  String fullName,  String nik,  String gender,  DateTime dob,  String province,  String city,  String districts,  String village,  String rtRw,  String ktpFilePath,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserInfoEntity() when $default != null:
return $default(_that.id,_that.userId,_that.fullName,_that.nik,_that.gender,_that.dob,_that.province,_that.city,_that.districts,_that.village,_that.rtRw,_that.ktpFilePath,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  String fullName,  String nik,  String gender,  DateTime dob,  String province,  String city,  String districts,  String village,  String rtRw,  String ktpFilePath,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _UserInfoEntity():
return $default(_that.id,_that.userId,_that.fullName,_that.nik,_that.gender,_that.dob,_that.province,_that.city,_that.districts,_that.village,_that.rtRw,_that.ktpFilePath,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  String fullName,  String nik,  String gender,  DateTime dob,  String province,  String city,  String districts,  String village,  String rtRw,  String ktpFilePath,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _UserInfoEntity() when $default != null:
return $default(_that.id,_that.userId,_that.fullName,_that.nik,_that.gender,_that.dob,_that.province,_that.city,_that.districts,_that.village,_that.rtRw,_that.ktpFilePath,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _UserInfoEntity implements UserInfoEntity {
  const _UserInfoEntity({required this.id, required this.userId, required this.fullName, required this.nik, required this.gender, required this.dob, required this.province, required this.city, required this.districts, required this.village, required this.rtRw, required this.ktpFilePath, required this.createdAt, required this.updatedAt});
  

@override final  String id;
@override final  String userId;
@override final  String fullName;
@override final  String nik;
@override final  String gender;
@override final  DateTime dob;
@override final  String province;
@override final  String city;
@override final  String districts;
@override final  String village;
@override final  String rtRw;
@override final  String ktpFilePath;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of UserInfoEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserInfoEntityCopyWith<_UserInfoEntity> get copyWith => __$UserInfoEntityCopyWithImpl<_UserInfoEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserInfoEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.nik, nik) || other.nik == nik)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.dob, dob) || other.dob == dob)&&(identical(other.province, province) || other.province == province)&&(identical(other.city, city) || other.city == city)&&(identical(other.districts, districts) || other.districts == districts)&&(identical(other.village, village) || other.village == village)&&(identical(other.rtRw, rtRw) || other.rtRw == rtRw)&&(identical(other.ktpFilePath, ktpFilePath) || other.ktpFilePath == ktpFilePath)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,userId,fullName,nik,gender,dob,province,city,districts,village,rtRw,ktpFilePath,createdAt,updatedAt);

@override
String toString() {
  return 'UserInfoEntity(id: $id, userId: $userId, fullName: $fullName, nik: $nik, gender: $gender, dob: $dob, province: $province, city: $city, districts: $districts, village: $village, rtRw: $rtRw, ktpFilePath: $ktpFilePath, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$UserInfoEntityCopyWith<$Res> implements $UserInfoEntityCopyWith<$Res> {
  factory _$UserInfoEntityCopyWith(_UserInfoEntity value, $Res Function(_UserInfoEntity) _then) = __$UserInfoEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, String fullName, String nik, String gender, DateTime dob, String province, String city, String districts, String village, String rtRw, String ktpFilePath, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$UserInfoEntityCopyWithImpl<$Res>
    implements _$UserInfoEntityCopyWith<$Res> {
  __$UserInfoEntityCopyWithImpl(this._self, this._then);

  final _UserInfoEntity _self;
  final $Res Function(_UserInfoEntity) _then;

/// Create a copy of UserInfoEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? fullName = null,Object? nik = null,Object? gender = null,Object? dob = null,Object? province = null,Object? city = null,Object? districts = null,Object? village = null,Object? rtRw = null,Object? ktpFilePath = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_UserInfoEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,nik: null == nik ? _self.nik : nik // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,dob: null == dob ? _self.dob : dob // ignore: cast_nullable_to_non_nullable
as DateTime,province: null == province ? _self.province : province // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,districts: null == districts ? _self.districts : districts // ignore: cast_nullable_to_non_nullable
as String,village: null == village ? _self.village : village // ignore: cast_nullable_to_non_nullable
as String,rtRw: null == rtRw ? _self.rtRw : rtRw // ignore: cast_nullable_to_non_nullable
as String,ktpFilePath: null == ktpFilePath ? _self.ktpFilePath : ktpFilePath // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
