// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_worker_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreateWorkerParams {

 String get fullName; String get education; String get available; int get desiredSalary; bool get isNegotiable; String get phoneNumber; String get workExperience; String get address; String get province; String get city; String get subdistrict; String get ward; String get village; double get latitude; double get longitude; List<File> get images;
/// Create a copy of CreateWorkerParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateWorkerParamsCopyWith<CreateWorkerParams> get copyWith => _$CreateWorkerParamsCopyWithImpl<CreateWorkerParams>(this as CreateWorkerParams, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateWorkerParams&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.education, education) || other.education == education)&&(identical(other.available, available) || other.available == available)&&(identical(other.desiredSalary, desiredSalary) || other.desiredSalary == desiredSalary)&&(identical(other.isNegotiable, isNegotiable) || other.isNegotiable == isNegotiable)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.workExperience, workExperience) || other.workExperience == workExperience)&&(identical(other.address, address) || other.address == address)&&(identical(other.province, province) || other.province == province)&&(identical(other.city, city) || other.city == city)&&(identical(other.subdistrict, subdistrict) || other.subdistrict == subdistrict)&&(identical(other.ward, ward) || other.ward == ward)&&(identical(other.village, village) || other.village == village)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&const DeepCollectionEquality().equals(other.images, images));
}


@override
int get hashCode => Object.hash(runtimeType,fullName,education,available,desiredSalary,isNegotiable,phoneNumber,workExperience,address,province,city,subdistrict,ward,village,latitude,longitude,const DeepCollectionEquality().hash(images));

@override
String toString() {
  return 'CreateWorkerParams(fullName: $fullName, education: $education, available: $available, desiredSalary: $desiredSalary, isNegotiable: $isNegotiable, phoneNumber: $phoneNumber, workExperience: $workExperience, address: $address, province: $province, city: $city, subdistrict: $subdistrict, ward: $ward, village: $village, latitude: $latitude, longitude: $longitude, images: $images)';
}


}

/// @nodoc
abstract mixin class $CreateWorkerParamsCopyWith<$Res>  {
  factory $CreateWorkerParamsCopyWith(CreateWorkerParams value, $Res Function(CreateWorkerParams) _then) = _$CreateWorkerParamsCopyWithImpl;
@useResult
$Res call({
 String fullName, String education, String available, int desiredSalary, bool isNegotiable, String phoneNumber, String workExperience, String address, String province, String city, String subdistrict, String ward, String village, double latitude, double longitude, List<File> images
});




}
/// @nodoc
class _$CreateWorkerParamsCopyWithImpl<$Res>
    implements $CreateWorkerParamsCopyWith<$Res> {
  _$CreateWorkerParamsCopyWithImpl(this._self, this._then);

  final CreateWorkerParams _self;
  final $Res Function(CreateWorkerParams) _then;

/// Create a copy of CreateWorkerParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fullName = null,Object? education = null,Object? available = null,Object? desiredSalary = null,Object? isNegotiable = null,Object? phoneNumber = null,Object? workExperience = null,Object? address = null,Object? province = null,Object? city = null,Object? subdistrict = null,Object? ward = null,Object? village = null,Object? latitude = null,Object? longitude = null,Object? images = null,}) {
  return _then(_self.copyWith(
fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,education: null == education ? _self.education : education // ignore: cast_nullable_to_non_nullable
as String,available: null == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as String,desiredSalary: null == desiredSalary ? _self.desiredSalary : desiredSalary // ignore: cast_nullable_to_non_nullable
as int,isNegotiable: null == isNegotiable ? _self.isNegotiable : isNegotiable // ignore: cast_nullable_to_non_nullable
as bool,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,workExperience: null == workExperience ? _self.workExperience : workExperience // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,province: null == province ? _self.province : province // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,subdistrict: null == subdistrict ? _self.subdistrict : subdistrict // ignore: cast_nullable_to_non_nullable
as String,ward: null == ward ? _self.ward : ward // ignore: cast_nullable_to_non_nullable
as String,village: null == village ? _self.village : village // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<File>,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateWorkerParams].
extension CreateWorkerParamsPatterns on CreateWorkerParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateWorkerParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateWorkerParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateWorkerParams value)  $default,){
final _that = this;
switch (_that) {
case _CreateWorkerParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateWorkerParams value)?  $default,){
final _that = this;
switch (_that) {
case _CreateWorkerParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String fullName,  String education,  String available,  int desiredSalary,  bool isNegotiable,  String phoneNumber,  String workExperience,  String address,  String province,  String city,  String subdistrict,  String ward,  String village,  double latitude,  double longitude,  List<File> images)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateWorkerParams() when $default != null:
return $default(_that.fullName,_that.education,_that.available,_that.desiredSalary,_that.isNegotiable,_that.phoneNumber,_that.workExperience,_that.address,_that.province,_that.city,_that.subdistrict,_that.ward,_that.village,_that.latitude,_that.longitude,_that.images);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String fullName,  String education,  String available,  int desiredSalary,  bool isNegotiable,  String phoneNumber,  String workExperience,  String address,  String province,  String city,  String subdistrict,  String ward,  String village,  double latitude,  double longitude,  List<File> images)  $default,) {final _that = this;
switch (_that) {
case _CreateWorkerParams():
return $default(_that.fullName,_that.education,_that.available,_that.desiredSalary,_that.isNegotiable,_that.phoneNumber,_that.workExperience,_that.address,_that.province,_that.city,_that.subdistrict,_that.ward,_that.village,_that.latitude,_that.longitude,_that.images);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String fullName,  String education,  String available,  int desiredSalary,  bool isNegotiable,  String phoneNumber,  String workExperience,  String address,  String province,  String city,  String subdistrict,  String ward,  String village,  double latitude,  double longitude,  List<File> images)?  $default,) {final _that = this;
switch (_that) {
case _CreateWorkerParams() when $default != null:
return $default(_that.fullName,_that.education,_that.available,_that.desiredSalary,_that.isNegotiable,_that.phoneNumber,_that.workExperience,_that.address,_that.province,_that.city,_that.subdistrict,_that.ward,_that.village,_that.latitude,_that.longitude,_that.images);case _:
  return null;

}
}

}

/// @nodoc


class _CreateWorkerParams implements CreateWorkerParams {
  const _CreateWorkerParams({required this.fullName, required this.education, required this.available, required this.desiredSalary, required this.isNegotiable, required this.phoneNumber, required this.workExperience, required this.address, required this.province, required this.city, required this.subdistrict, required this.ward, required this.village, required this.latitude, required this.longitude, required final  List<File> images}): _images = images;
  

@override final  String fullName;
@override final  String education;
@override final  String available;
@override final  int desiredSalary;
@override final  bool isNegotiable;
@override final  String phoneNumber;
@override final  String workExperience;
@override final  String address;
@override final  String province;
@override final  String city;
@override final  String subdistrict;
@override final  String ward;
@override final  String village;
@override final  double latitude;
@override final  double longitude;
 final  List<File> _images;
@override List<File> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}


/// Create a copy of CreateWorkerParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateWorkerParamsCopyWith<_CreateWorkerParams> get copyWith => __$CreateWorkerParamsCopyWithImpl<_CreateWorkerParams>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateWorkerParams&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.education, education) || other.education == education)&&(identical(other.available, available) || other.available == available)&&(identical(other.desiredSalary, desiredSalary) || other.desiredSalary == desiredSalary)&&(identical(other.isNegotiable, isNegotiable) || other.isNegotiable == isNegotiable)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.workExperience, workExperience) || other.workExperience == workExperience)&&(identical(other.address, address) || other.address == address)&&(identical(other.province, province) || other.province == province)&&(identical(other.city, city) || other.city == city)&&(identical(other.subdistrict, subdistrict) || other.subdistrict == subdistrict)&&(identical(other.ward, ward) || other.ward == ward)&&(identical(other.village, village) || other.village == village)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&const DeepCollectionEquality().equals(other._images, _images));
}


@override
int get hashCode => Object.hash(runtimeType,fullName,education,available,desiredSalary,isNegotiable,phoneNumber,workExperience,address,province,city,subdistrict,ward,village,latitude,longitude,const DeepCollectionEquality().hash(_images));

@override
String toString() {
  return 'CreateWorkerParams(fullName: $fullName, education: $education, available: $available, desiredSalary: $desiredSalary, isNegotiable: $isNegotiable, phoneNumber: $phoneNumber, workExperience: $workExperience, address: $address, province: $province, city: $city, subdistrict: $subdistrict, ward: $ward, village: $village, latitude: $latitude, longitude: $longitude, images: $images)';
}


}

/// @nodoc
abstract mixin class _$CreateWorkerParamsCopyWith<$Res> implements $CreateWorkerParamsCopyWith<$Res> {
  factory _$CreateWorkerParamsCopyWith(_CreateWorkerParams value, $Res Function(_CreateWorkerParams) _then) = __$CreateWorkerParamsCopyWithImpl;
@override @useResult
$Res call({
 String fullName, String education, String available, int desiredSalary, bool isNegotiable, String phoneNumber, String workExperience, String address, String province, String city, String subdistrict, String ward, String village, double latitude, double longitude, List<File> images
});




}
/// @nodoc
class __$CreateWorkerParamsCopyWithImpl<$Res>
    implements _$CreateWorkerParamsCopyWith<$Res> {
  __$CreateWorkerParamsCopyWithImpl(this._self, this._then);

  final _CreateWorkerParams _self;
  final $Res Function(_CreateWorkerParams) _then;

/// Create a copy of CreateWorkerParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fullName = null,Object? education = null,Object? available = null,Object? desiredSalary = null,Object? isNegotiable = null,Object? phoneNumber = null,Object? workExperience = null,Object? address = null,Object? province = null,Object? city = null,Object? subdistrict = null,Object? ward = null,Object? village = null,Object? latitude = null,Object? longitude = null,Object? images = null,}) {
  return _then(_CreateWorkerParams(
fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,education: null == education ? _self.education : education // ignore: cast_nullable_to_non_nullable
as String,available: null == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as String,desiredSalary: null == desiredSalary ? _self.desiredSalary : desiredSalary // ignore: cast_nullable_to_non_nullable
as int,isNegotiable: null == isNegotiable ? _self.isNegotiable : isNegotiable // ignore: cast_nullable_to_non_nullable
as bool,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,workExperience: null == workExperience ? _self.workExperience : workExperience // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,province: null == province ? _self.province : province // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,subdistrict: null == subdistrict ? _self.subdistrict : subdistrict // ignore: cast_nullable_to_non_nullable
as String,ward: null == ward ? _self.ward : ward // ignore: cast_nullable_to_non_nullable
as String,village: null == village ? _self.village : village // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<File>,
  ));
}


}

// dart format on
