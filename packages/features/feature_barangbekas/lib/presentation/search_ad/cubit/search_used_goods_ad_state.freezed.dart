// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_used_goods_ad_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SearchUsedGoodsAdState {

 String get searchQuery; List<SecondhandEntity> get items; bool get isLoading; bool get hasNextPage; int get currentPage; String? get errorMessage;/// Radius filter: km yang dipilih user (null = belum diterapkan)
 int? get radiusKm;/// Apakah radius filter sedang aktif
 bool get isRadiusFilterApplied;/// Lokasi terdaftar user — diisi saat radius filter diterapkan
 String get filterProvince; String get filterCity; String get filterSubdistrict;
/// Create a copy of SearchUsedGoodsAdState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchUsedGoodsAdStateCopyWith<SearchUsedGoodsAdState> get copyWith => _$SearchUsedGoodsAdStateCopyWithImpl<SearchUsedGoodsAdState>(this as SearchUsedGoodsAdState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchUsedGoodsAdState&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.hasNextPage, hasNextPage) || other.hasNextPage == hasNextPage)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.radiusKm, radiusKm) || other.radiusKm == radiusKm)&&(identical(other.isRadiusFilterApplied, isRadiusFilterApplied) || other.isRadiusFilterApplied == isRadiusFilterApplied)&&(identical(other.filterProvince, filterProvince) || other.filterProvince == filterProvince)&&(identical(other.filterCity, filterCity) || other.filterCity == filterCity)&&(identical(other.filterSubdistrict, filterSubdistrict) || other.filterSubdistrict == filterSubdistrict));
}


@override
int get hashCode => Object.hash(runtimeType,searchQuery,const DeepCollectionEquality().hash(items),isLoading,hasNextPage,currentPage,errorMessage,radiusKm,isRadiusFilterApplied,filterProvince,filterCity,filterSubdistrict);

@override
String toString() {
  return 'SearchUsedGoodsAdState(searchQuery: $searchQuery, items: $items, isLoading: $isLoading, hasNextPage: $hasNextPage, currentPage: $currentPage, errorMessage: $errorMessage, radiusKm: $radiusKm, isRadiusFilterApplied: $isRadiusFilterApplied, filterProvince: $filterProvince, filterCity: $filterCity, filterSubdistrict: $filterSubdistrict)';
}


}

/// @nodoc
abstract mixin class $SearchUsedGoodsAdStateCopyWith<$Res>  {
  factory $SearchUsedGoodsAdStateCopyWith(SearchUsedGoodsAdState value, $Res Function(SearchUsedGoodsAdState) _then) = _$SearchUsedGoodsAdStateCopyWithImpl;
@useResult
$Res call({
 String searchQuery, List<SecondhandEntity> items, bool isLoading, bool hasNextPage, int currentPage, String? errorMessage, int? radiusKm, bool isRadiusFilterApplied, String filterProvince, String filterCity, String filterSubdistrict
});




}
/// @nodoc
class _$SearchUsedGoodsAdStateCopyWithImpl<$Res>
    implements $SearchUsedGoodsAdStateCopyWith<$Res> {
  _$SearchUsedGoodsAdStateCopyWithImpl(this._self, this._then);

  final SearchUsedGoodsAdState _self;
  final $Res Function(SearchUsedGoodsAdState) _then;

/// Create a copy of SearchUsedGoodsAdState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? searchQuery = null,Object? items = null,Object? isLoading = null,Object? hasNextPage = null,Object? currentPage = null,Object? errorMessage = freezed,Object? radiusKm = freezed,Object? isRadiusFilterApplied = null,Object? filterProvince = null,Object? filterCity = null,Object? filterSubdistrict = null,}) {
  return _then(_self.copyWith(
searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<SecondhandEntity>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,hasNextPage: null == hasNextPage ? _self.hasNextPage : hasNextPage // ignore: cast_nullable_to_non_nullable
as bool,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,radiusKm: freezed == radiusKm ? _self.radiusKm : radiusKm // ignore: cast_nullable_to_non_nullable
as int?,isRadiusFilterApplied: null == isRadiusFilterApplied ? _self.isRadiusFilterApplied : isRadiusFilterApplied // ignore: cast_nullable_to_non_nullable
as bool,filterProvince: null == filterProvince ? _self.filterProvince : filterProvince // ignore: cast_nullable_to_non_nullable
as String,filterCity: null == filterCity ? _self.filterCity : filterCity // ignore: cast_nullable_to_non_nullable
as String,filterSubdistrict: null == filterSubdistrict ? _self.filterSubdistrict : filterSubdistrict // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchUsedGoodsAdState].
extension SearchUsedGoodsAdStatePatterns on SearchUsedGoodsAdState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchUsedGoodsAdState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchUsedGoodsAdState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchUsedGoodsAdState value)  $default,){
final _that = this;
switch (_that) {
case _SearchUsedGoodsAdState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchUsedGoodsAdState value)?  $default,){
final _that = this;
switch (_that) {
case _SearchUsedGoodsAdState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String searchQuery,  List<SecondhandEntity> items,  bool isLoading,  bool hasNextPage,  int currentPage,  String? errorMessage,  int? radiusKm,  bool isRadiusFilterApplied,  String filterProvince,  String filterCity,  String filterSubdistrict)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchUsedGoodsAdState() when $default != null:
return $default(_that.searchQuery,_that.items,_that.isLoading,_that.hasNextPage,_that.currentPage,_that.errorMessage,_that.radiusKm,_that.isRadiusFilterApplied,_that.filterProvince,_that.filterCity,_that.filterSubdistrict);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String searchQuery,  List<SecondhandEntity> items,  bool isLoading,  bool hasNextPage,  int currentPage,  String? errorMessage,  int? radiusKm,  bool isRadiusFilterApplied,  String filterProvince,  String filterCity,  String filterSubdistrict)  $default,) {final _that = this;
switch (_that) {
case _SearchUsedGoodsAdState():
return $default(_that.searchQuery,_that.items,_that.isLoading,_that.hasNextPage,_that.currentPage,_that.errorMessage,_that.radiusKm,_that.isRadiusFilterApplied,_that.filterProvince,_that.filterCity,_that.filterSubdistrict);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String searchQuery,  List<SecondhandEntity> items,  bool isLoading,  bool hasNextPage,  int currentPage,  String? errorMessage,  int? radiusKm,  bool isRadiusFilterApplied,  String filterProvince,  String filterCity,  String filterSubdistrict)?  $default,) {final _that = this;
switch (_that) {
case _SearchUsedGoodsAdState() when $default != null:
return $default(_that.searchQuery,_that.items,_that.isLoading,_that.hasNextPage,_that.currentPage,_that.errorMessage,_that.radiusKm,_that.isRadiusFilterApplied,_that.filterProvince,_that.filterCity,_that.filterSubdistrict);case _:
  return null;

}
}

}

/// @nodoc


class _SearchUsedGoodsAdState implements SearchUsedGoodsAdState {
  const _SearchUsedGoodsAdState({this.searchQuery = '', final  List<SecondhandEntity> items = const [], this.isLoading = false, this.hasNextPage = false, this.currentPage = 1, this.errorMessage, this.radiusKm, this.isRadiusFilterApplied = false, this.filterProvince = '', this.filterCity = '', this.filterSubdistrict = ''}): _items = items;
  

@override@JsonKey() final  String searchQuery;
 final  List<SecondhandEntity> _items;
@override@JsonKey() List<SecondhandEntity> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool hasNextPage;
@override@JsonKey() final  int currentPage;
@override final  String? errorMessage;
/// Radius filter: km yang dipilih user (null = belum diterapkan)
@override final  int? radiusKm;
/// Apakah radius filter sedang aktif
@override@JsonKey() final  bool isRadiusFilterApplied;
/// Lokasi terdaftar user — diisi saat radius filter diterapkan
@override@JsonKey() final  String filterProvince;
@override@JsonKey() final  String filterCity;
@override@JsonKey() final  String filterSubdistrict;

/// Create a copy of SearchUsedGoodsAdState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchUsedGoodsAdStateCopyWith<_SearchUsedGoodsAdState> get copyWith => __$SearchUsedGoodsAdStateCopyWithImpl<_SearchUsedGoodsAdState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchUsedGoodsAdState&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.hasNextPage, hasNextPage) || other.hasNextPage == hasNextPage)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.radiusKm, radiusKm) || other.radiusKm == radiusKm)&&(identical(other.isRadiusFilterApplied, isRadiusFilterApplied) || other.isRadiusFilterApplied == isRadiusFilterApplied)&&(identical(other.filterProvince, filterProvince) || other.filterProvince == filterProvince)&&(identical(other.filterCity, filterCity) || other.filterCity == filterCity)&&(identical(other.filterSubdistrict, filterSubdistrict) || other.filterSubdistrict == filterSubdistrict));
}


@override
int get hashCode => Object.hash(runtimeType,searchQuery,const DeepCollectionEquality().hash(_items),isLoading,hasNextPage,currentPage,errorMessage,radiusKm,isRadiusFilterApplied,filterProvince,filterCity,filterSubdistrict);

@override
String toString() {
  return 'SearchUsedGoodsAdState(searchQuery: $searchQuery, items: $items, isLoading: $isLoading, hasNextPage: $hasNextPage, currentPage: $currentPage, errorMessage: $errorMessage, radiusKm: $radiusKm, isRadiusFilterApplied: $isRadiusFilterApplied, filterProvince: $filterProvince, filterCity: $filterCity, filterSubdistrict: $filterSubdistrict)';
}


}

/// @nodoc
abstract mixin class _$SearchUsedGoodsAdStateCopyWith<$Res> implements $SearchUsedGoodsAdStateCopyWith<$Res> {
  factory _$SearchUsedGoodsAdStateCopyWith(_SearchUsedGoodsAdState value, $Res Function(_SearchUsedGoodsAdState) _then) = __$SearchUsedGoodsAdStateCopyWithImpl;
@override @useResult
$Res call({
 String searchQuery, List<SecondhandEntity> items, bool isLoading, bool hasNextPage, int currentPage, String? errorMessage, int? radiusKm, bool isRadiusFilterApplied, String filterProvince, String filterCity, String filterSubdistrict
});




}
/// @nodoc
class __$SearchUsedGoodsAdStateCopyWithImpl<$Res>
    implements _$SearchUsedGoodsAdStateCopyWith<$Res> {
  __$SearchUsedGoodsAdStateCopyWithImpl(this._self, this._then);

  final _SearchUsedGoodsAdState _self;
  final $Res Function(_SearchUsedGoodsAdState) _then;

/// Create a copy of SearchUsedGoodsAdState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? searchQuery = null,Object? items = null,Object? isLoading = null,Object? hasNextPage = null,Object? currentPage = null,Object? errorMessage = freezed,Object? radiusKm = freezed,Object? isRadiusFilterApplied = null,Object? filterProvince = null,Object? filterCity = null,Object? filterSubdistrict = null,}) {
  return _then(_SearchUsedGoodsAdState(
searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<SecondhandEntity>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,hasNextPage: null == hasNextPage ? _self.hasNextPage : hasNextPage // ignore: cast_nullable_to_non_nullable
as bool,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,radiusKm: freezed == radiusKm ? _self.radiusKm : radiusKm // ignore: cast_nullable_to_non_nullable
as int?,isRadiusFilterApplied: null == isRadiusFilterApplied ? _self.isRadiusFilterApplied : isRadiusFilterApplied // ignore: cast_nullable_to_non_nullable
as bool,filterProvince: null == filterProvince ? _self.filterProvince : filterProvince // ignore: cast_nullable_to_non_nullable
as String,filterCity: null == filterCity ? _self.filterCity : filterCity // ignore: cast_nullable_to_non_nullable
as String,filterSubdistrict: null == filterSubdistrict ? _self.filterSubdistrict : filterSubdistrict // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
