// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_secondhand_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreateSecondhandParams {

/// Ad title
 String get title;/// Item description
 String get description;/// Item condition: "used" or "new"
 String get condition;/// Quantity available
 int get amount;/// Street address
 String get address;/// Province name
 String get province;/// City / kabupaten name
 String get city;/// Subdistrict / kecamatan name
 String get subdistrict;/// Village name
 String get village;/// Item photos (at least one required)
 List<File> get images;/// GPS latitude of the item location (optional — tidak block submit jika GPS gagal)
 double? get latitude;/// GPS longitude of the item location (optional — tidak block submit jika GPS gagal)
 double? get longitude;
/// Create a copy of CreateSecondhandParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateSecondhandParamsCopyWith<CreateSecondhandParams> get copyWith => _$CreateSecondhandParamsCopyWithImpl<CreateSecondhandParams>(this as CreateSecondhandParams, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateSecondhandParams&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.address, address) || other.address == address)&&(identical(other.province, province) || other.province == province)&&(identical(other.city, city) || other.city == city)&&(identical(other.subdistrict, subdistrict) || other.subdistrict == subdistrict)&&(identical(other.village, village) || other.village == village)&&const DeepCollectionEquality().equals(other.images, images)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}


@override
int get hashCode => Object.hash(runtimeType,title,description,condition,amount,address,province,city,subdistrict,village,const DeepCollectionEquality().hash(images),latitude,longitude);

@override
String toString() {
  return 'CreateSecondhandParams(title: $title, description: $description, condition: $condition, amount: $amount, address: $address, province: $province, city: $city, subdistrict: $subdistrict, village: $village, images: $images, latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class $CreateSecondhandParamsCopyWith<$Res>  {
  factory $CreateSecondhandParamsCopyWith(CreateSecondhandParams value, $Res Function(CreateSecondhandParams) _then) = _$CreateSecondhandParamsCopyWithImpl;
@useResult
$Res call({
 String title, String description, String condition, int amount, String address, String province, String city, String subdistrict, String village, List<File> images, double? latitude, double? longitude
});




}
/// @nodoc
class _$CreateSecondhandParamsCopyWithImpl<$Res>
    implements $CreateSecondhandParamsCopyWith<$Res> {
  _$CreateSecondhandParamsCopyWithImpl(this._self, this._then);

  final CreateSecondhandParams _self;
  final $Res Function(CreateSecondhandParams) _then;

/// Create a copy of CreateSecondhandParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? description = null,Object? condition = null,Object? amount = null,Object? address = null,Object? province = null,Object? city = null,Object? subdistrict = null,Object? village = null,Object? images = null,Object? latitude = freezed,Object? longitude = freezed,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,province: null == province ? _self.province : province // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,subdistrict: null == subdistrict ? _self.subdistrict : subdistrict // ignore: cast_nullable_to_non_nullable
as String,village: null == village ? _self.village : village // ignore: cast_nullable_to_non_nullable
as String,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<File>,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateSecondhandParams].
extension CreateSecondhandParamsPatterns on CreateSecondhandParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateSecondhandParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateSecondhandParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateSecondhandParams value)  $default,){
final _that = this;
switch (_that) {
case _CreateSecondhandParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateSecondhandParams value)?  $default,){
final _that = this;
switch (_that) {
case _CreateSecondhandParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String description,  String condition,  int amount,  String address,  String province,  String city,  String subdistrict,  String village,  List<File> images,  double? latitude,  double? longitude)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateSecondhandParams() when $default != null:
return $default(_that.title,_that.description,_that.condition,_that.amount,_that.address,_that.province,_that.city,_that.subdistrict,_that.village,_that.images,_that.latitude,_that.longitude);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String description,  String condition,  int amount,  String address,  String province,  String city,  String subdistrict,  String village,  List<File> images,  double? latitude,  double? longitude)  $default,) {final _that = this;
switch (_that) {
case _CreateSecondhandParams():
return $default(_that.title,_that.description,_that.condition,_that.amount,_that.address,_that.province,_that.city,_that.subdistrict,_that.village,_that.images,_that.latitude,_that.longitude);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String description,  String condition,  int amount,  String address,  String province,  String city,  String subdistrict,  String village,  List<File> images,  double? latitude,  double? longitude)?  $default,) {final _that = this;
switch (_that) {
case _CreateSecondhandParams() when $default != null:
return $default(_that.title,_that.description,_that.condition,_that.amount,_that.address,_that.province,_that.city,_that.subdistrict,_that.village,_that.images,_that.latitude,_that.longitude);case _:
  return null;

}
}

}

/// @nodoc


class _CreateSecondhandParams implements CreateSecondhandParams {
  const _CreateSecondhandParams({required this.title, required this.description, required this.condition, required this.amount, required this.address, required this.province, required this.city, required this.subdistrict, required this.village, required final  List<File> images, this.latitude, this.longitude}): _images = images;
  

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
/// Village name
@override final  String village;
/// Item photos (at least one required)
 final  List<File> _images;
/// Item photos (at least one required)
@override List<File> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}

/// GPS latitude of the item location (optional — tidak block submit jika GPS gagal)
@override final  double? latitude;
/// GPS longitude of the item location (optional — tidak block submit jika GPS gagal)
@override final  double? longitude;

/// Create a copy of CreateSecondhandParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateSecondhandParamsCopyWith<_CreateSecondhandParams> get copyWith => __$CreateSecondhandParamsCopyWithImpl<_CreateSecondhandParams>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateSecondhandParams&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.address, address) || other.address == address)&&(identical(other.province, province) || other.province == province)&&(identical(other.city, city) || other.city == city)&&(identical(other.subdistrict, subdistrict) || other.subdistrict == subdistrict)&&(identical(other.village, village) || other.village == village)&&const DeepCollectionEquality().equals(other._images, _images)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}


@override
int get hashCode => Object.hash(runtimeType,title,description,condition,amount,address,province,city,subdistrict,village,const DeepCollectionEquality().hash(_images),latitude,longitude);

@override
String toString() {
  return 'CreateSecondhandParams(title: $title, description: $description, condition: $condition, amount: $amount, address: $address, province: $province, city: $city, subdistrict: $subdistrict, village: $village, images: $images, latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class _$CreateSecondhandParamsCopyWith<$Res> implements $CreateSecondhandParamsCopyWith<$Res> {
  factory _$CreateSecondhandParamsCopyWith(_CreateSecondhandParams value, $Res Function(_CreateSecondhandParams) _then) = __$CreateSecondhandParamsCopyWithImpl;
@override @useResult
$Res call({
 String title, String description, String condition, int amount, String address, String province, String city, String subdistrict, String village, List<File> images, double? latitude, double? longitude
});




}
/// @nodoc
class __$CreateSecondhandParamsCopyWithImpl<$Res>
    implements _$CreateSecondhandParamsCopyWith<$Res> {
  __$CreateSecondhandParamsCopyWithImpl(this._self, this._then);

  final _CreateSecondhandParams _self;
  final $Res Function(_CreateSecondhandParams) _then;

/// Create a copy of CreateSecondhandParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? description = null,Object? condition = null,Object? amount = null,Object? address = null,Object? province = null,Object? city = null,Object? subdistrict = null,Object? village = null,Object? images = null,Object? latitude = freezed,Object? longitude = freezed,}) {
  return _then(_CreateSecondhandParams(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,province: null == province ? _self.province : province // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,subdistrict: null == subdistrict ? _self.subdistrict : subdistrict // ignore: cast_nullable_to_non_nullable
as String,village: null == village ? _self.village : village // ignore: cast_nullable_to_non_nullable
as String,images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<File>,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
