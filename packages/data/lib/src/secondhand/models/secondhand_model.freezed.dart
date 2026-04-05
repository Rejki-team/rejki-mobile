// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'secondhand_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SecondhandModel {

 String get id;@JsonKey(name: 'ad_code') String get adCode;@JsonKey(name: 'user_id') String get userId; SecondhandUserModel? get user; String get title; String get description; String get condition; int get amount; String get address; String get province; String get city; String get subdistrict; String get ward; String get village; String get status; List<SecondhandImageModel> get images;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'updated_at') String? get updatedAt;
/// Create a copy of SecondhandModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SecondhandModelCopyWith<SecondhandModel> get copyWith => _$SecondhandModelCopyWithImpl<SecondhandModel>(this as SecondhandModel, _$identity);

  /// Serializes this SecondhandModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SecondhandModel&&(identical(other.id, id) || other.id == id)&&(identical(other.adCode, adCode) || other.adCode == adCode)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.user, user) || other.user == user)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.address, address) || other.address == address)&&(identical(other.province, province) || other.province == province)&&(identical(other.city, city) || other.city == city)&&(identical(other.subdistrict, subdistrict) || other.subdistrict == subdistrict)&&(identical(other.ward, ward) || other.ward == ward)&&(identical(other.village, village) || other.village == village)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.images, images)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,adCode,userId,user,title,description,condition,amount,address,province,city,subdistrict,ward,village,status,const DeepCollectionEquality().hash(images),createdAt,updatedAt);

@override
String toString() {
  return 'SecondhandModel(id: $id, adCode: $adCode, userId: $userId, user: $user, title: $title, description: $description, condition: $condition, amount: $amount, address: $address, province: $province, city: $city, subdistrict: $subdistrict, ward: $ward, village: $village, status: $status, images: $images, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $SecondhandModelCopyWith<$Res>  {
  factory $SecondhandModelCopyWith(SecondhandModel value, $Res Function(SecondhandModel) _then) = _$SecondhandModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'ad_code') String adCode,@JsonKey(name: 'user_id') String userId, SecondhandUserModel? user, String title, String description, String condition, int amount, String address, String province, String city, String subdistrict, String ward, String village, String status, List<SecondhandImageModel> images,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt
});


$SecondhandUserModelCopyWith<$Res>? get user;

}
/// @nodoc
class _$SecondhandModelCopyWithImpl<$Res>
    implements $SecondhandModelCopyWith<$Res> {
  _$SecondhandModelCopyWithImpl(this._self, this._then);

  final SecondhandModel _self;
  final $Res Function(SecondhandModel) _then;

/// Create a copy of SecondhandModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? adCode = null,Object? userId = null,Object? user = freezed,Object? title = null,Object? description = null,Object? condition = null,Object? amount = null,Object? address = null,Object? province = null,Object? city = null,Object? subdistrict = null,Object? ward = null,Object? village = null,Object? status = null,Object? images = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,adCode: null == adCode ? _self.adCode : adCode // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as SecondhandUserModel?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,province: null == province ? _self.province : province // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,subdistrict: null == subdistrict ? _self.subdistrict : subdistrict // ignore: cast_nullable_to_non_nullable
as String,ward: null == ward ? _self.ward : ward // ignore: cast_nullable_to_non_nullable
as String,village: null == village ? _self.village : village // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<SecondhandImageModel>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of SecondhandModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SecondhandUserModelCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $SecondhandUserModelCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [SecondhandModel].
extension SecondhandModelPatterns on SecondhandModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SecondhandModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SecondhandModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SecondhandModel value)  $default,){
final _that = this;
switch (_that) {
case _SecondhandModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SecondhandModel value)?  $default,){
final _that = this;
switch (_that) {
case _SecondhandModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'ad_code')  String adCode, @JsonKey(name: 'user_id')  String userId,  SecondhandUserModel? user,  String title,  String description,  String condition,  int amount,  String address,  String province,  String city,  String subdistrict,  String ward,  String village,  String status,  List<SecondhandImageModel> images, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SecondhandModel() when $default != null:
return $default(_that.id,_that.adCode,_that.userId,_that.user,_that.title,_that.description,_that.condition,_that.amount,_that.address,_that.province,_that.city,_that.subdistrict,_that.ward,_that.village,_that.status,_that.images,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'ad_code')  String adCode, @JsonKey(name: 'user_id')  String userId,  SecondhandUserModel? user,  String title,  String description,  String condition,  int amount,  String address,  String province,  String city,  String subdistrict,  String ward,  String village,  String status,  List<SecondhandImageModel> images, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _SecondhandModel():
return $default(_that.id,_that.adCode,_that.userId,_that.user,_that.title,_that.description,_that.condition,_that.amount,_that.address,_that.province,_that.city,_that.subdistrict,_that.ward,_that.village,_that.status,_that.images,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'ad_code')  String adCode, @JsonKey(name: 'user_id')  String userId,  SecondhandUserModel? user,  String title,  String description,  String condition,  int amount,  String address,  String province,  String city,  String subdistrict,  String ward,  String village,  String status,  List<SecondhandImageModel> images, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _SecondhandModel() when $default != null:
return $default(_that.id,_that.adCode,_that.userId,_that.user,_that.title,_that.description,_that.condition,_that.amount,_that.address,_that.province,_that.city,_that.subdistrict,_that.ward,_that.village,_that.status,_that.images,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SecondhandModel extends SecondhandModel {
  const _SecondhandModel({required this.id, @JsonKey(name: 'ad_code') required this.adCode, @JsonKey(name: 'user_id') required this.userId, this.user, required this.title, required this.description, required this.condition, required this.amount, required this.address, required this.province, required this.city, required this.subdistrict, this.ward = '', required this.village, required this.status, final  List<SecondhandImageModel> images = const [], @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt}): _images = images,super._();
  factory _SecondhandModel.fromJson(Map<String, dynamic> json) => _$SecondhandModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'ad_code') final  String adCode;
@override@JsonKey(name: 'user_id') final  String userId;
@override final  SecondhandUserModel? user;
@override final  String title;
@override final  String description;
@override final  String condition;
@override final  int amount;
@override final  String address;
@override final  String province;
@override final  String city;
@override final  String subdistrict;
@override@JsonKey() final  String ward;
@override final  String village;
@override final  String status;
 final  List<SecondhandImageModel> _images;
@override@JsonKey() List<SecondhandImageModel> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}

@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'updated_at') final  String? updatedAt;

/// Create a copy of SecondhandModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SecondhandModelCopyWith<_SecondhandModel> get copyWith => __$SecondhandModelCopyWithImpl<_SecondhandModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SecondhandModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SecondhandModel&&(identical(other.id, id) || other.id == id)&&(identical(other.adCode, adCode) || other.adCode == adCode)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.user, user) || other.user == user)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.address, address) || other.address == address)&&(identical(other.province, province) || other.province == province)&&(identical(other.city, city) || other.city == city)&&(identical(other.subdistrict, subdistrict) || other.subdistrict == subdistrict)&&(identical(other.ward, ward) || other.ward == ward)&&(identical(other.village, village) || other.village == village)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._images, _images)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,adCode,userId,user,title,description,condition,amount,address,province,city,subdistrict,ward,village,status,const DeepCollectionEquality().hash(_images),createdAt,updatedAt);

@override
String toString() {
  return 'SecondhandModel(id: $id, adCode: $adCode, userId: $userId, user: $user, title: $title, description: $description, condition: $condition, amount: $amount, address: $address, province: $province, city: $city, subdistrict: $subdistrict, ward: $ward, village: $village, status: $status, images: $images, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$SecondhandModelCopyWith<$Res> implements $SecondhandModelCopyWith<$Res> {
  factory _$SecondhandModelCopyWith(_SecondhandModel value, $Res Function(_SecondhandModel) _then) = __$SecondhandModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'ad_code') String adCode,@JsonKey(name: 'user_id') String userId, SecondhandUserModel? user, String title, String description, String condition, int amount, String address, String province, String city, String subdistrict, String ward, String village, String status, List<SecondhandImageModel> images,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt
});


@override $SecondhandUserModelCopyWith<$Res>? get user;

}
/// @nodoc
class __$SecondhandModelCopyWithImpl<$Res>
    implements _$SecondhandModelCopyWith<$Res> {
  __$SecondhandModelCopyWithImpl(this._self, this._then);

  final _SecondhandModel _self;
  final $Res Function(_SecondhandModel) _then;

/// Create a copy of SecondhandModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? adCode = null,Object? userId = null,Object? user = freezed,Object? title = null,Object? description = null,Object? condition = null,Object? amount = null,Object? address = null,Object? province = null,Object? city = null,Object? subdistrict = null,Object? ward = null,Object? village = null,Object? status = null,Object? images = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_SecondhandModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,adCode: null == adCode ? _self.adCode : adCode // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as SecondhandUserModel?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,province: null == province ? _self.province : province // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,subdistrict: null == subdistrict ? _self.subdistrict : subdistrict // ignore: cast_nullable_to_non_nullable
as String,ward: null == ward ? _self.ward : ward // ignore: cast_nullable_to_non_nullable
as String,village: null == village ? _self.village : village // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<SecondhandImageModel>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of SecondhandModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SecondhandUserModelCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $SecondhandUserModelCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

// dart format on
