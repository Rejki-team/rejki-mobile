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

 String get searchQuery; bool get isLoading; String? get errorMessage;
/// Create a copy of SearchUsedGoodsAdState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchUsedGoodsAdStateCopyWith<SearchUsedGoodsAdState> get copyWith => _$SearchUsedGoodsAdStateCopyWithImpl<SearchUsedGoodsAdState>(this as SearchUsedGoodsAdState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchUsedGoodsAdState&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,searchQuery,isLoading,errorMessage);

@override
String toString() {
  return 'SearchUsedGoodsAdState(searchQuery: $searchQuery, isLoading: $isLoading, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $SearchUsedGoodsAdStateCopyWith<$Res>  {
  factory $SearchUsedGoodsAdStateCopyWith(SearchUsedGoodsAdState value, $Res Function(SearchUsedGoodsAdState) _then) = _$SearchUsedGoodsAdStateCopyWithImpl;
@useResult
$Res call({
 String searchQuery, bool isLoading, String? errorMessage
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
@pragma('vm:prefer-inline') @override $Res call({Object? searchQuery = null,Object? isLoading = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String searchQuery,  bool isLoading,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchUsedGoodsAdState() when $default != null:
return $default(_that.searchQuery,_that.isLoading,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String searchQuery,  bool isLoading,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _SearchUsedGoodsAdState():
return $default(_that.searchQuery,_that.isLoading,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String searchQuery,  bool isLoading,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _SearchUsedGoodsAdState() when $default != null:
return $default(_that.searchQuery,_that.isLoading,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _SearchUsedGoodsAdState implements SearchUsedGoodsAdState {
  const _SearchUsedGoodsAdState({this.searchQuery = '', this.isLoading = false, this.errorMessage});
  

@override@JsonKey() final  String searchQuery;
@override@JsonKey() final  bool isLoading;
@override final  String? errorMessage;

/// Create a copy of SearchUsedGoodsAdState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchUsedGoodsAdStateCopyWith<_SearchUsedGoodsAdState> get copyWith => __$SearchUsedGoodsAdStateCopyWithImpl<_SearchUsedGoodsAdState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchUsedGoodsAdState&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,searchQuery,isLoading,errorMessage);

@override
String toString() {
  return 'SearchUsedGoodsAdState(searchQuery: $searchQuery, isLoading: $isLoading, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$SearchUsedGoodsAdStateCopyWith<$Res> implements $SearchUsedGoodsAdStateCopyWith<$Res> {
  factory _$SearchUsedGoodsAdStateCopyWith(_SearchUsedGoodsAdState value, $Res Function(_SearchUsedGoodsAdState) _then) = __$SearchUsedGoodsAdStateCopyWithImpl;
@override @useResult
$Res call({
 String searchQuery, bool isLoading, String? errorMessage
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
@override @pragma('vm:prefer-inline') $Res call({Object? searchQuery = null,Object? isLoading = null,Object? errorMessage = freezed,}) {
  return _then(_SearchUsedGoodsAdState(
searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
