// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'secondhand_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SecondhandEntity {

/// Unique identifier
 String get id;/// Advertisement code (e.g. "31/03/2026/1774973623")
 String get adCode;/// User ID of the seller
 String get userId;/// Ad title
 String get title;/// Item description
 String get description;/// Item condition: "used" or "new"
 String get condition;/// Quantity available
 int get amount;/// Street address
 String get address;/// Province name
 String get province;/// City / kabupaten name
 String get city;/// Subdistrict / kecamatan name
 String get subdistrict;/// Ward / kelurahan name (may be empty from API)
 String get ward;/// Village name
 String get village;/// Ad status (e.g. "available")
 String get status;/// Attached images
 List<SecondhandImageEntity> get images;/// Created at timestamp
 DateTime? get createdAt;/// Updated at timestamp
 DateTime? get updatedAt;/// Seller full name (from user.user_info.full_name)
 String get sellerName;/// Seller phone number (from user.phone_number)
 String get sellerPhone;
/// Create a copy of SecondhandEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SecondhandEntityCopyWith<SecondhandEntity> get copyWith => _$SecondhandEntityCopyWithImpl<SecondhandEntity>(this as SecondhandEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SecondhandEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.adCode, adCode) || other.adCode == adCode)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.address, address) || other.address == address)&&(identical(other.province, province) || other.province == province)&&(identical(other.city, city) || other.city == city)&&(identical(other.subdistrict, subdistrict) || other.subdistrict == subdistrict)&&(identical(other.ward, ward) || other.ward == ward)&&(identical(other.village, village) || other.village == village)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.images, images)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.sellerName, sellerName) || other.sellerName == sellerName)&&(identical(other.sellerPhone, sellerPhone) || other.sellerPhone == sellerPhone));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,adCode,userId,title,description,condition,amount,address,province,city,subdistrict,ward,village,status,const DeepCollectionEquality().hash(images),createdAt,updatedAt,sellerName,sellerPhone]);

@override
String toString() {
  return 'SecondhandEntity(id: $id, adCode: $adCode, userId: $userId, title: $title, description: $description, condition: $condition, amount: $amount, address: $address, province: $province, city: $city, subdistrict: $subdistrict, ward: $ward, village: $village, status: $status, images: $images, createdAt: $createdAt, updatedAt: $updatedAt, sellerName: $sellerName, sellerPhone: $sellerPhone)';
}


}

/// @nodoc
abstract mixin class $SecondhandEntityCopyWith<$Res>  {
  factory $SecondhandEntityCopyWith(SecondhandEntity value, $Res Function(SecondhandEntity) _then) = _$SecondhandEntityCopyWithImpl;
@useResult
$Res call({
 String id, String adCode, String userId, String title, String description, String condition, int amount, String address, String province, String city, String subdistrict, String ward, String village, String status, List<SecondhandImageEntity> images, DateTime? createdAt, DateTime? updatedAt, String sellerName, String sellerPhone
});




}
/// @nodoc
class _$SecondhandEntityCopyWithImpl<$Res>
    implements $SecondhandEntityCopyWith<$Res> {
  _$SecondhandEntityCopyWithImpl(this._self, this._then);

  final SecondhandEntity _self;
  final $Res Function(SecondhandEntity) _then;

/// Create a copy of SecondhandEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? adCode = null,Object? userId = null,Object? title = null,Object? description = null,Object? condition = null,Object? amount = null,Object? address = null,Object? province = null,Object? city = null,Object? subdistrict = null,Object? ward = null,Object? village = null,Object? status = null,Object? images = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? sellerName = null,Object? sellerPhone = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,adCode: null == adCode ? _self.adCode : adCode // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
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
as List<SecondhandImageEntity>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,sellerName: null == sellerName ? _self.sellerName : sellerName // ignore: cast_nullable_to_non_nullable
as String,sellerPhone: null == sellerPhone ? _self.sellerPhone : sellerPhone // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SecondhandEntity].
extension SecondhandEntityPatterns on SecondhandEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SecondhandEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SecondhandEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SecondhandEntity value)  $default,){
final _that = this;
switch (_that) {
case _SecondhandEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SecondhandEntity value)?  $default,){
final _that = this;
switch (_that) {
case _SecondhandEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String adCode,  String userId,  String title,  String description,  String condition,  int amount,  String address,  String province,  String city,  String subdistrict,  String ward,  String village,  String status,  List<SecondhandImageEntity> images,  DateTime? createdAt,  DateTime? updatedAt,  String sellerName,  String sellerPhone)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SecondhandEntity() when $default != null:
return $default(_that.id,_that.adCode,_that.userId,_that.title,_that.description,_that.condition,_that.amount,_that.address,_that.province,_that.city,_that.subdistrict,_that.ward,_that.village,_that.status,_that.images,_that.createdAt,_that.updatedAt,_that.sellerName,_that.sellerPhone);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String adCode,  String userId,  String title,  String description,  String condition,  int amount,  String address,  String province,  String city,  String subdistrict,  String ward,  String village,  String status,  List<SecondhandImageEntity> images,  DateTime? createdAt,  DateTime? updatedAt,  String sellerName,  String sellerPhone)  $default,) {final _that = this;
switch (_that) {
case _SecondhandEntity():
return $default(_that.id,_that.adCode,_that.userId,_that.title,_that.description,_that.condition,_that.amount,_that.address,_that.province,_that.city,_that.subdistrict,_that.ward,_that.village,_that.status,_that.images,_that.createdAt,_that.updatedAt,_that.sellerName,_that.sellerPhone);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String adCode,  String userId,  String title,  String description,  String condition,  int amount,  String address,  String province,  String city,  String subdistrict,  String ward,  String village,  String status,  List<SecondhandImageEntity> images,  DateTime? createdAt,  DateTime? updatedAt,  String sellerName,  String sellerPhone)?  $default,) {final _that = this;
switch (_that) {
case _SecondhandEntity() when $default != null:
return $default(_that.id,_that.adCode,_that.userId,_that.title,_that.description,_that.condition,_that.amount,_that.address,_that.province,_that.city,_that.subdistrict,_that.ward,_that.village,_that.status,_that.images,_that.createdAt,_that.updatedAt,_that.sellerName,_that.sellerPhone);case _:
  return null;

}
}

}

/// @nodoc


class _SecondhandEntity extends SecondhandEntity {
  const _SecondhandEntity({required this.id, required this.adCode, required this.userId, required this.title, required this.description, required this.condition, required this.amount, required this.address, required this.province, required this.city, required this.subdistrict, this.ward = '', required this.village, required this.status, final  List<SecondhandImageEntity> images = const [], this.createdAt, this.updatedAt, this.sellerName = '', this.sellerPhone = ''}): _images = images,super._();
  

/// Unique identifier
@override final  String id;
/// Advertisement code (e.g. "31/03/2026/1774973623")
@override final  String adCode;
/// User ID of the seller
@override final  String userId;
/// Ad title
@override final  String title;
/// Item description
@override final  String description;
/// Item condition: "used" or "new"
@override final  String condition;
/// Quantity available
@override final  int amount;
/// Street address
@override final  String address;
/// Province name
@override final  String province;
/// City / kabupaten name
@override final  String city;
/// Subdistrict / kecamatan name
@override final  String subdistrict;
/// Ward / kelurahan name (may be empty from API)
@override@JsonKey() final  String ward;
/// Village name
@override final  String village;
/// Ad status (e.g. "available")
@override final  String status;
/// Attached images
 final  List<SecondhandImageEntity> _images;
/// Attached images
@override@JsonKey() List<SecondhandImageEntity> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}

/// Created at timestamp
@override final  DateTime? createdAt;
/// Updated at timestamp
@override final  DateTime? updatedAt;
/// Seller full name (from user.user_info.full_name)
@override@JsonKey() final  String sellerName;
/// Seller phone number (from user.phone_number)
@override@JsonKey() final  String sellerPhone;

/// Create a copy of SecondhandEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SecondhandEntityCopyWith<_SecondhandEntity> get copyWith => __$SecondhandEntityCopyWithImpl<_SecondhandEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SecondhandEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.adCode, adCode) || other.adCode == adCode)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.address, address) || other.address == address)&&(identical(other.province, province) || other.province == province)&&(identical(other.city, city) || other.city == city)&&(identical(other.subdistrict, subdistrict) || other.subdistrict == subdistrict)&&(identical(other.ward, ward) || other.ward == ward)&&(identical(other.village, village) || other.village == village)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._images, _images)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.sellerName, sellerName) || other.sellerName == sellerName)&&(identical(other.sellerPhone, sellerPhone) || other.sellerPhone == sellerPhone));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,adCode,userId,title,description,condition,amount,address,province,city,subdistrict,ward,village,status,const DeepCollectionEquality().hash(_images),createdAt,updatedAt,sellerName,sellerPhone]);

@override
String toString() {
  return 'SecondhandEntity(id: $id, adCode: $adCode, userId: $userId, title: $title, description: $description, condition: $condition, amount: $amount, address: $address, province: $province, city: $city, subdistrict: $subdistrict, ward: $ward, village: $village, status: $status, images: $images, createdAt: $createdAt, updatedAt: $updatedAt, sellerName: $sellerName, sellerPhone: $sellerPhone)';
}


}

/// @nodoc
abstract mixin class _$SecondhandEntityCopyWith<$Res> implements $SecondhandEntityCopyWith<$Res> {
  factory _$SecondhandEntityCopyWith(_SecondhandEntity value, $Res Function(_SecondhandEntity) _then) = __$SecondhandEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String adCode, String userId, String title, String description, String condition, int amount, String address, String province, String city, String subdistrict, String ward, String village, String status, List<SecondhandImageEntity> images, DateTime? createdAt, DateTime? updatedAt, String sellerName, String sellerPhone
});




}
/// @nodoc
class __$SecondhandEntityCopyWithImpl<$Res>
    implements _$SecondhandEntityCopyWith<$Res> {
  __$SecondhandEntityCopyWithImpl(this._self, this._then);

  final _SecondhandEntity _self;
  final $Res Function(_SecondhandEntity) _then;

/// Create a copy of SecondhandEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? adCode = null,Object? userId = null,Object? title = null,Object? description = null,Object? condition = null,Object? amount = null,Object? address = null,Object? province = null,Object? city = null,Object? subdistrict = null,Object? ward = null,Object? village = null,Object? status = null,Object? images = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? sellerName = null,Object? sellerPhone = null,}) {
  return _then(_SecondhandEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,adCode: null == adCode ? _self.adCode : adCode // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
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
as List<SecondhandImageEntity>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,sellerName: null == sellerName ? _self.sellerName : sellerName // ignore: cast_nullable_to_non_nullable
as String,sellerPhone: null == sellerPhone ? _self.sellerPhone : sellerPhone // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
