// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'secondhand_query_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SecondhandQueryParams {

/// Page number (1-based)
 int get page;/// Items per page
 int get limit;/// Full-text search keyword
 String get search;/// Filter by province name
 String get province;/// Filter by city name
 String get city;/// Filter by subdistrict name
 String get subdistrict;/// Filter by ward name
 String get ward;
/// Create a copy of SecondhandQueryParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SecondhandQueryParamsCopyWith<SecondhandQueryParams> get copyWith => _$SecondhandQueryParamsCopyWithImpl<SecondhandQueryParams>(this as SecondhandQueryParams, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SecondhandQueryParams&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.search, search) || other.search == search)&&(identical(other.province, province) || other.province == province)&&(identical(other.city, city) || other.city == city)&&(identical(other.subdistrict, subdistrict) || other.subdistrict == subdistrict)&&(identical(other.ward, ward) || other.ward == ward));
}


@override
int get hashCode => Object.hash(runtimeType,page,limit,search,province,city,subdistrict,ward);

@override
String toString() {
  return 'SecondhandQueryParams(page: $page, limit: $limit, search: $search, province: $province, city: $city, subdistrict: $subdistrict, ward: $ward)';
}


}

/// @nodoc
abstract mixin class $SecondhandQueryParamsCopyWith<$Res>  {
  factory $SecondhandQueryParamsCopyWith(SecondhandQueryParams value, $Res Function(SecondhandQueryParams) _then) = _$SecondhandQueryParamsCopyWithImpl;
@useResult
$Res call({
 int page, int limit, String search, String province, String city, String subdistrict, String ward
});




}
/// @nodoc
class _$SecondhandQueryParamsCopyWithImpl<$Res>
    implements $SecondhandQueryParamsCopyWith<$Res> {
  _$SecondhandQueryParamsCopyWithImpl(this._self, this._then);

  final SecondhandQueryParams _self;
  final $Res Function(SecondhandQueryParams) _then;

/// Create a copy of SecondhandQueryParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? page = null,Object? limit = null,Object? search = null,Object? province = null,Object? city = null,Object? subdistrict = null,Object? ward = null,}) {
  return _then(_self.copyWith(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,search: null == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String,province: null == province ? _self.province : province // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,subdistrict: null == subdistrict ? _self.subdistrict : subdistrict // ignore: cast_nullable_to_non_nullable
as String,ward: null == ward ? _self.ward : ward // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SecondhandQueryParams].
extension SecondhandQueryParamsPatterns on SecondhandQueryParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SecondhandQueryParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SecondhandQueryParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SecondhandQueryParams value)  $default,){
final _that = this;
switch (_that) {
case _SecondhandQueryParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SecondhandQueryParams value)?  $default,){
final _that = this;
switch (_that) {
case _SecondhandQueryParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int page,  int limit,  String search,  String province,  String city,  String subdistrict,  String ward)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SecondhandQueryParams() when $default != null:
return $default(_that.page,_that.limit,_that.search,_that.province,_that.city,_that.subdistrict,_that.ward);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int page,  int limit,  String search,  String province,  String city,  String subdistrict,  String ward)  $default,) {final _that = this;
switch (_that) {
case _SecondhandQueryParams():
return $default(_that.page,_that.limit,_that.search,_that.province,_that.city,_that.subdistrict,_that.ward);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int page,  int limit,  String search,  String province,  String city,  String subdistrict,  String ward)?  $default,) {final _that = this;
switch (_that) {
case _SecondhandQueryParams() when $default != null:
return $default(_that.page,_that.limit,_that.search,_that.province,_that.city,_that.subdistrict,_that.ward);case _:
  return null;

}
}

}

/// @nodoc


class _SecondhandQueryParams implements SecondhandQueryParams {
  const _SecondhandQueryParams({this.page = 1, this.limit = 10, this.search = '', this.province = '', this.city = '', this.subdistrict = '', this.ward = ''});
  

/// Page number (1-based)
@override@JsonKey() final  int page;
/// Items per page
@override@JsonKey() final  int limit;
/// Full-text search keyword
@override@JsonKey() final  String search;
/// Filter by province name
@override@JsonKey() final  String province;
/// Filter by city name
@override@JsonKey() final  String city;
/// Filter by subdistrict name
@override@JsonKey() final  String subdistrict;
/// Filter by ward name
@override@JsonKey() final  String ward;

/// Create a copy of SecondhandQueryParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SecondhandQueryParamsCopyWith<_SecondhandQueryParams> get copyWith => __$SecondhandQueryParamsCopyWithImpl<_SecondhandQueryParams>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SecondhandQueryParams&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.search, search) || other.search == search)&&(identical(other.province, province) || other.province == province)&&(identical(other.city, city) || other.city == city)&&(identical(other.subdistrict, subdistrict) || other.subdistrict == subdistrict)&&(identical(other.ward, ward) || other.ward == ward));
}


@override
int get hashCode => Object.hash(runtimeType,page,limit,search,province,city,subdistrict,ward);

@override
String toString() {
  return 'SecondhandQueryParams(page: $page, limit: $limit, search: $search, province: $province, city: $city, subdistrict: $subdistrict, ward: $ward)';
}


}

/// @nodoc
abstract mixin class _$SecondhandQueryParamsCopyWith<$Res> implements $SecondhandQueryParamsCopyWith<$Res> {
  factory _$SecondhandQueryParamsCopyWith(_SecondhandQueryParams value, $Res Function(_SecondhandQueryParams) _then) = __$SecondhandQueryParamsCopyWithImpl;
@override @useResult
$Res call({
 int page, int limit, String search, String province, String city, String subdistrict, String ward
});




}
/// @nodoc
class __$SecondhandQueryParamsCopyWithImpl<$Res>
    implements _$SecondhandQueryParamsCopyWith<$Res> {
  __$SecondhandQueryParamsCopyWithImpl(this._self, this._then);

  final _SecondhandQueryParams _self;
  final $Res Function(_SecondhandQueryParams) _then;

/// Create a copy of SecondhandQueryParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? page = null,Object? limit = null,Object? search = null,Object? province = null,Object? city = null,Object? subdistrict = null,Object? ward = null,}) {
  return _then(_SecondhandQueryParams(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,search: null == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String,province: null == province ? _self.province : province // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,subdistrict: null == subdistrict ? _self.subdistrict : subdistrict // ignore: cast_nullable_to_non_nullable
as String,ward: null == ward ? _self.ward : ward // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
