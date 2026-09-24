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

 List<SecondhandEntity> get items; bool get isLoading; bool get hasNextPage; int get currentPage; String? get errorMessage;/// Backend TIDAK punya parameter `search` (kontrak `GET /barang` hanya
/// `limit/offset/latitude/longitude`) — difilter CLIENT-SIDE dari [items]
/// yang sudah dimuat (gap dicatat P4.6, bukan hilang diam-diam).
 String get searchQuery;/// Radius filter (F-1, PRD §5.14.1): km yang dipilih user (null = belum
/// diterapkan).
 int? get radiusKm; bool get isRadiusFilterApplied; double? get filterLatitude; double? get filterLongitude;
/// Create a copy of SearchUsedGoodsAdState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchUsedGoodsAdStateCopyWith<SearchUsedGoodsAdState> get copyWith => _$SearchUsedGoodsAdStateCopyWithImpl<SearchUsedGoodsAdState>(this as SearchUsedGoodsAdState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchUsedGoodsAdState&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.hasNextPage, hasNextPage) || other.hasNextPage == hasNextPage)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.radiusKm, radiusKm) || other.radiusKm == radiusKm)&&(identical(other.isRadiusFilterApplied, isRadiusFilterApplied) || other.isRadiusFilterApplied == isRadiusFilterApplied)&&(identical(other.filterLatitude, filterLatitude) || other.filterLatitude == filterLatitude)&&(identical(other.filterLongitude, filterLongitude) || other.filterLongitude == filterLongitude));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),isLoading,hasNextPage,currentPage,errorMessage,searchQuery,radiusKm,isRadiusFilterApplied,filterLatitude,filterLongitude);

@override
String toString() {
  return 'SearchUsedGoodsAdState(items: $items, isLoading: $isLoading, hasNextPage: $hasNextPage, currentPage: $currentPage, errorMessage: $errorMessage, searchQuery: $searchQuery, radiusKm: $radiusKm, isRadiusFilterApplied: $isRadiusFilterApplied, filterLatitude: $filterLatitude, filterLongitude: $filterLongitude)';
}


}

/// @nodoc
abstract mixin class $SearchUsedGoodsAdStateCopyWith<$Res>  {
  factory $SearchUsedGoodsAdStateCopyWith(SearchUsedGoodsAdState value, $Res Function(SearchUsedGoodsAdState) _then) = _$SearchUsedGoodsAdStateCopyWithImpl;
@useResult
$Res call({
 List<SecondhandEntity> items, bool isLoading, bool hasNextPage, int currentPage, String? errorMessage, String searchQuery, int? radiusKm, bool isRadiusFilterApplied, double? filterLatitude, double? filterLongitude
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
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? isLoading = null,Object? hasNextPage = null,Object? currentPage = null,Object? errorMessage = freezed,Object? searchQuery = null,Object? radiusKm = freezed,Object? isRadiusFilterApplied = null,Object? filterLatitude = freezed,Object? filterLongitude = freezed,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<SecondhandEntity>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,hasNextPage: null == hasNextPage ? _self.hasNextPage : hasNextPage // ignore: cast_nullable_to_non_nullable
as bool,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,radiusKm: freezed == radiusKm ? _self.radiusKm : radiusKm // ignore: cast_nullable_to_non_nullable
as int?,isRadiusFilterApplied: null == isRadiusFilterApplied ? _self.isRadiusFilterApplied : isRadiusFilterApplied // ignore: cast_nullable_to_non_nullable
as bool,filterLatitude: freezed == filterLatitude ? _self.filterLatitude : filterLatitude // ignore: cast_nullable_to_non_nullable
as double?,filterLongitude: freezed == filterLongitude ? _self.filterLongitude : filterLongitude // ignore: cast_nullable_to_non_nullable
as double?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<SecondhandEntity> items,  bool isLoading,  bool hasNextPage,  int currentPage,  String? errorMessage,  String searchQuery,  int? radiusKm,  bool isRadiusFilterApplied,  double? filterLatitude,  double? filterLongitude)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchUsedGoodsAdState() when $default != null:
return $default(_that.items,_that.isLoading,_that.hasNextPage,_that.currentPage,_that.errorMessage,_that.searchQuery,_that.radiusKm,_that.isRadiusFilterApplied,_that.filterLatitude,_that.filterLongitude);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<SecondhandEntity> items,  bool isLoading,  bool hasNextPage,  int currentPage,  String? errorMessage,  String searchQuery,  int? radiusKm,  bool isRadiusFilterApplied,  double? filterLatitude,  double? filterLongitude)  $default,) {final _that = this;
switch (_that) {
case _SearchUsedGoodsAdState():
return $default(_that.items,_that.isLoading,_that.hasNextPage,_that.currentPage,_that.errorMessage,_that.searchQuery,_that.radiusKm,_that.isRadiusFilterApplied,_that.filterLatitude,_that.filterLongitude);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<SecondhandEntity> items,  bool isLoading,  bool hasNextPage,  int currentPage,  String? errorMessage,  String searchQuery,  int? radiusKm,  bool isRadiusFilterApplied,  double? filterLatitude,  double? filterLongitude)?  $default,) {final _that = this;
switch (_that) {
case _SearchUsedGoodsAdState() when $default != null:
return $default(_that.items,_that.isLoading,_that.hasNextPage,_that.currentPage,_that.errorMessage,_that.searchQuery,_that.radiusKm,_that.isRadiusFilterApplied,_that.filterLatitude,_that.filterLongitude);case _:
  return null;

}
}

}

/// @nodoc


class _SearchUsedGoodsAdState extends SearchUsedGoodsAdState {
  const _SearchUsedGoodsAdState({final  List<SecondhandEntity> items = const [], this.isLoading = false, this.hasNextPage = false, this.currentPage = 1, this.errorMessage, this.searchQuery = '', this.radiusKm, this.isRadiusFilterApplied = false, this.filterLatitude, this.filterLongitude}): _items = items,super._();
  

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
/// Backend TIDAK punya parameter `search` (kontrak `GET /barang` hanya
/// `limit/offset/latitude/longitude`) — difilter CLIENT-SIDE dari [items]
/// yang sudah dimuat (gap dicatat P4.6, bukan hilang diam-diam).
@override@JsonKey() final  String searchQuery;
/// Radius filter (F-1, PRD §5.14.1): km yang dipilih user (null = belum
/// diterapkan).
@override final  int? radiusKm;
@override@JsonKey() final  bool isRadiusFilterApplied;
@override final  double? filterLatitude;
@override final  double? filterLongitude;

/// Create a copy of SearchUsedGoodsAdState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchUsedGoodsAdStateCopyWith<_SearchUsedGoodsAdState> get copyWith => __$SearchUsedGoodsAdStateCopyWithImpl<_SearchUsedGoodsAdState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchUsedGoodsAdState&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.hasNextPage, hasNextPage) || other.hasNextPage == hasNextPage)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.radiusKm, radiusKm) || other.radiusKm == radiusKm)&&(identical(other.isRadiusFilterApplied, isRadiusFilterApplied) || other.isRadiusFilterApplied == isRadiusFilterApplied)&&(identical(other.filterLatitude, filterLatitude) || other.filterLatitude == filterLatitude)&&(identical(other.filterLongitude, filterLongitude) || other.filterLongitude == filterLongitude));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),isLoading,hasNextPage,currentPage,errorMessage,searchQuery,radiusKm,isRadiusFilterApplied,filterLatitude,filterLongitude);

@override
String toString() {
  return 'SearchUsedGoodsAdState(items: $items, isLoading: $isLoading, hasNextPage: $hasNextPage, currentPage: $currentPage, errorMessage: $errorMessage, searchQuery: $searchQuery, radiusKm: $radiusKm, isRadiusFilterApplied: $isRadiusFilterApplied, filterLatitude: $filterLatitude, filterLongitude: $filterLongitude)';
}


}

/// @nodoc
abstract mixin class _$SearchUsedGoodsAdStateCopyWith<$Res> implements $SearchUsedGoodsAdStateCopyWith<$Res> {
  factory _$SearchUsedGoodsAdStateCopyWith(_SearchUsedGoodsAdState value, $Res Function(_SearchUsedGoodsAdState) _then) = __$SearchUsedGoodsAdStateCopyWithImpl;
@override @useResult
$Res call({
 List<SecondhandEntity> items, bool isLoading, bool hasNextPage, int currentPage, String? errorMessage, String searchQuery, int? radiusKm, bool isRadiusFilterApplied, double? filterLatitude, double? filterLongitude
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
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? isLoading = null,Object? hasNextPage = null,Object? currentPage = null,Object? errorMessage = freezed,Object? searchQuery = null,Object? radiusKm = freezed,Object? isRadiusFilterApplied = null,Object? filterLatitude = freezed,Object? filterLongitude = freezed,}) {
  return _then(_SearchUsedGoodsAdState(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<SecondhandEntity>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,hasNextPage: null == hasNextPage ? _self.hasNextPage : hasNextPage // ignore: cast_nullable_to_non_nullable
as bool,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,radiusKm: freezed == radiusKm ? _self.radiusKm : radiusKm // ignore: cast_nullable_to_non_nullable
as int?,isRadiusFilterApplied: null == isRadiusFilterApplied ? _self.isRadiusFilterApplied : isRadiusFilterApplied // ignore: cast_nullable_to_non_nullable
as bool,filterLatitude: freezed == filterLatitude ? _self.filterLatitude : filterLatitude // ignore: cast_nullable_to_non_nullable
as double?,filterLongitude: freezed == filterLongitude ? _self.filterLongitude : filterLongitude // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
