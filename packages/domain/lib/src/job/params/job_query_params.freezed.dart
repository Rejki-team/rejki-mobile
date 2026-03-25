// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job_query_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$JobQueryParams {

/// Page number (1-based)
 int get page;/// Number of items per page
 int get limit;/// Sort field and direction (e.g., "created_at desc")
 String get sort;/// Search query for job title/description
 String? get search;/// Filter by province
 String? get province;/// Filter by city
 String? get city;/// Filter by subdistrict (kecamatan)
 String? get subdistrict;/// Filter by ward (kelurahan)
 String? get ward;/// Filter by status (e.g., "open", "closed")
 String? get status;/// Current device latitude for location-based filtering
 double? get latitude;/// Current device longitude for location-based filtering
 double? get longitude;
/// Create a copy of JobQueryParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JobQueryParamsCopyWith<JobQueryParams> get copyWith => _$JobQueryParamsCopyWithImpl<JobQueryParams>(this as JobQueryParams, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobQueryParams&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.sort, sort) || other.sort == sort)&&(identical(other.search, search) || other.search == search)&&(identical(other.province, province) || other.province == province)&&(identical(other.city, city) || other.city == city)&&(identical(other.subdistrict, subdistrict) || other.subdistrict == subdistrict)&&(identical(other.ward, ward) || other.ward == ward)&&(identical(other.status, status) || other.status == status)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}


@override
int get hashCode => Object.hash(runtimeType,page,limit,sort,search,province,city,subdistrict,ward,status,latitude,longitude);

@override
String toString() {
  return 'JobQueryParams(page: $page, limit: $limit, sort: $sort, search: $search, province: $province, city: $city, subdistrict: $subdistrict, ward: $ward, status: $status, latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class $JobQueryParamsCopyWith<$Res>  {
  factory $JobQueryParamsCopyWith(JobQueryParams value, $Res Function(JobQueryParams) _then) = _$JobQueryParamsCopyWithImpl;
@useResult
$Res call({
 int page, int limit, String sort, String? search, String? province, String? city, String? subdistrict, String? ward, String? status, double? latitude, double? longitude
});




}
/// @nodoc
class _$JobQueryParamsCopyWithImpl<$Res>
    implements $JobQueryParamsCopyWith<$Res> {
  _$JobQueryParamsCopyWithImpl(this._self, this._then);

  final JobQueryParams _self;
  final $Res Function(JobQueryParams) _then;

/// Create a copy of JobQueryParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? page = null,Object? limit = null,Object? sort = null,Object? search = freezed,Object? province = freezed,Object? city = freezed,Object? subdistrict = freezed,Object? ward = freezed,Object? status = freezed,Object? latitude = freezed,Object? longitude = freezed,}) {
  return _then(_self.copyWith(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,sort: null == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as String,search: freezed == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String?,province: freezed == province ? _self.province : province // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,subdistrict: freezed == subdistrict ? _self.subdistrict : subdistrict // ignore: cast_nullable_to_non_nullable
as String?,ward: freezed == ward ? _self.ward : ward // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [JobQueryParams].
extension JobQueryParamsPatterns on JobQueryParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JobQueryParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JobQueryParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JobQueryParams value)  $default,){
final _that = this;
switch (_that) {
case _JobQueryParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JobQueryParams value)?  $default,){
final _that = this;
switch (_that) {
case _JobQueryParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int page,  int limit,  String sort,  String? search,  String? province,  String? city,  String? subdistrict,  String? ward,  String? status,  double? latitude,  double? longitude)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JobQueryParams() when $default != null:
return $default(_that.page,_that.limit,_that.sort,_that.search,_that.province,_that.city,_that.subdistrict,_that.ward,_that.status,_that.latitude,_that.longitude);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int page,  int limit,  String sort,  String? search,  String? province,  String? city,  String? subdistrict,  String? ward,  String? status,  double? latitude,  double? longitude)  $default,) {final _that = this;
switch (_that) {
case _JobQueryParams():
return $default(_that.page,_that.limit,_that.sort,_that.search,_that.province,_that.city,_that.subdistrict,_that.ward,_that.status,_that.latitude,_that.longitude);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int page,  int limit,  String sort,  String? search,  String? province,  String? city,  String? subdistrict,  String? ward,  String? status,  double? latitude,  double? longitude)?  $default,) {final _that = this;
switch (_that) {
case _JobQueryParams() when $default != null:
return $default(_that.page,_that.limit,_that.sort,_that.search,_that.province,_that.city,_that.subdistrict,_that.ward,_that.status,_that.latitude,_that.longitude);case _:
  return null;

}
}

}

/// @nodoc


class _JobQueryParams extends JobQueryParams {
  const _JobQueryParams({this.page = 1, this.limit = 10, this.sort = 'created_at desc', this.search, this.province, this.city, this.subdistrict, this.ward, this.status, this.latitude, this.longitude}): super._();
  

/// Page number (1-based)
@override@JsonKey() final  int page;
/// Number of items per page
@override@JsonKey() final  int limit;
/// Sort field and direction (e.g., "created_at desc")
@override@JsonKey() final  String sort;
/// Search query for job title/description
@override final  String? search;
/// Filter by province
@override final  String? province;
/// Filter by city
@override final  String? city;
/// Filter by subdistrict (kecamatan)
@override final  String? subdistrict;
/// Filter by ward (kelurahan)
@override final  String? ward;
/// Filter by status (e.g., "open", "closed")
@override final  String? status;
/// Current device latitude for location-based filtering
@override final  double? latitude;
/// Current device longitude for location-based filtering
@override final  double? longitude;

/// Create a copy of JobQueryParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JobQueryParamsCopyWith<_JobQueryParams> get copyWith => __$JobQueryParamsCopyWithImpl<_JobQueryParams>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JobQueryParams&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.sort, sort) || other.sort == sort)&&(identical(other.search, search) || other.search == search)&&(identical(other.province, province) || other.province == province)&&(identical(other.city, city) || other.city == city)&&(identical(other.subdistrict, subdistrict) || other.subdistrict == subdistrict)&&(identical(other.ward, ward) || other.ward == ward)&&(identical(other.status, status) || other.status == status)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}


@override
int get hashCode => Object.hash(runtimeType,page,limit,sort,search,province,city,subdistrict,ward,status,latitude,longitude);

@override
String toString() {
  return 'JobQueryParams(page: $page, limit: $limit, sort: $sort, search: $search, province: $province, city: $city, subdistrict: $subdistrict, ward: $ward, status: $status, latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class _$JobQueryParamsCopyWith<$Res> implements $JobQueryParamsCopyWith<$Res> {
  factory _$JobQueryParamsCopyWith(_JobQueryParams value, $Res Function(_JobQueryParams) _then) = __$JobQueryParamsCopyWithImpl;
@override @useResult
$Res call({
 int page, int limit, String sort, String? search, String? province, String? city, String? subdistrict, String? ward, String? status, double? latitude, double? longitude
});




}
/// @nodoc
class __$JobQueryParamsCopyWithImpl<$Res>
    implements _$JobQueryParamsCopyWith<$Res> {
  __$JobQueryParamsCopyWithImpl(this._self, this._then);

  final _JobQueryParams _self;
  final $Res Function(_JobQueryParams) _then;

/// Create a copy of JobQueryParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? page = null,Object? limit = null,Object? sort = null,Object? search = freezed,Object? province = freezed,Object? city = freezed,Object? subdistrict = freezed,Object? ward = freezed,Object? status = freezed,Object? latitude = freezed,Object? longitude = freezed,}) {
  return _then(_JobQueryParams(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,sort: null == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as String,search: freezed == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String?,province: freezed == province ? _self.province : province // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,subdistrict: freezed == subdistrict ? _self.subdistrict : subdistrict // ignore: cast_nullable_to_non_nullable
as String?,ward: freezed == ward ? _self.ward : ward // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
