// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'secondhands_result_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SecondhandsResultEntity {

/// List of secondhand ads for the current page
 List<SecondhandEntity> get items;/// Total number of rows across all pages
 int get totalRows;/// Total number of pages
 int get totalPages;/// Current page number (1-based)
 int get currentPage;/// Whether a next page is available
 bool get hasNext;
/// Create a copy of SecondhandsResultEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SecondhandsResultEntityCopyWith<SecondhandsResultEntity> get copyWith => _$SecondhandsResultEntityCopyWithImpl<SecondhandsResultEntity>(this as SecondhandsResultEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SecondhandsResultEntity&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.totalRows, totalRows) || other.totalRows == totalRows)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.hasNext, hasNext) || other.hasNext == hasNext));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),totalRows,totalPages,currentPage,hasNext);

@override
String toString() {
  return 'SecondhandsResultEntity(items: $items, totalRows: $totalRows, totalPages: $totalPages, currentPage: $currentPage, hasNext: $hasNext)';
}


}

/// @nodoc
abstract mixin class $SecondhandsResultEntityCopyWith<$Res>  {
  factory $SecondhandsResultEntityCopyWith(SecondhandsResultEntity value, $Res Function(SecondhandsResultEntity) _then) = _$SecondhandsResultEntityCopyWithImpl;
@useResult
$Res call({
 List<SecondhandEntity> items, int totalRows, int totalPages, int currentPage, bool hasNext
});




}
/// @nodoc
class _$SecondhandsResultEntityCopyWithImpl<$Res>
    implements $SecondhandsResultEntityCopyWith<$Res> {
  _$SecondhandsResultEntityCopyWithImpl(this._self, this._then);

  final SecondhandsResultEntity _self;
  final $Res Function(SecondhandsResultEntity) _then;

/// Create a copy of SecondhandsResultEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? totalRows = null,Object? totalPages = null,Object? currentPage = null,Object? hasNext = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<SecondhandEntity>,totalRows: null == totalRows ? _self.totalRows : totalRows // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,hasNext: null == hasNext ? _self.hasNext : hasNext // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SecondhandsResultEntity].
extension SecondhandsResultEntityPatterns on SecondhandsResultEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SecondhandsResultEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SecondhandsResultEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SecondhandsResultEntity value)  $default,){
final _that = this;
switch (_that) {
case _SecondhandsResultEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SecondhandsResultEntity value)?  $default,){
final _that = this;
switch (_that) {
case _SecondhandsResultEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<SecondhandEntity> items,  int totalRows,  int totalPages,  int currentPage,  bool hasNext)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SecondhandsResultEntity() when $default != null:
return $default(_that.items,_that.totalRows,_that.totalPages,_that.currentPage,_that.hasNext);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<SecondhandEntity> items,  int totalRows,  int totalPages,  int currentPage,  bool hasNext)  $default,) {final _that = this;
switch (_that) {
case _SecondhandsResultEntity():
return $default(_that.items,_that.totalRows,_that.totalPages,_that.currentPage,_that.hasNext);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<SecondhandEntity> items,  int totalRows,  int totalPages,  int currentPage,  bool hasNext)?  $default,) {final _that = this;
switch (_that) {
case _SecondhandsResultEntity() when $default != null:
return $default(_that.items,_that.totalRows,_that.totalPages,_that.currentPage,_that.hasNext);case _:
  return null;

}
}

}

/// @nodoc


class _SecondhandsResultEntity implements SecondhandsResultEntity {
  const _SecondhandsResultEntity({required final  List<SecondhandEntity> items, required this.totalRows, required this.totalPages, required this.currentPage, required this.hasNext}): _items = items;
  

/// List of secondhand ads for the current page
 final  List<SecondhandEntity> _items;
/// List of secondhand ads for the current page
@override List<SecondhandEntity> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

/// Total number of rows across all pages
@override final  int totalRows;
/// Total number of pages
@override final  int totalPages;
/// Current page number (1-based)
@override final  int currentPage;
/// Whether a next page is available
@override final  bool hasNext;

/// Create a copy of SecondhandsResultEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SecondhandsResultEntityCopyWith<_SecondhandsResultEntity> get copyWith => __$SecondhandsResultEntityCopyWithImpl<_SecondhandsResultEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SecondhandsResultEntity&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.totalRows, totalRows) || other.totalRows == totalRows)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.hasNext, hasNext) || other.hasNext == hasNext));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),totalRows,totalPages,currentPage,hasNext);

@override
String toString() {
  return 'SecondhandsResultEntity(items: $items, totalRows: $totalRows, totalPages: $totalPages, currentPage: $currentPage, hasNext: $hasNext)';
}


}

/// @nodoc
abstract mixin class _$SecondhandsResultEntityCopyWith<$Res> implements $SecondhandsResultEntityCopyWith<$Res> {
  factory _$SecondhandsResultEntityCopyWith(_SecondhandsResultEntity value, $Res Function(_SecondhandsResultEntity) _then) = __$SecondhandsResultEntityCopyWithImpl;
@override @useResult
$Res call({
 List<SecondhandEntity> items, int totalRows, int totalPages, int currentPage, bool hasNext
});




}
/// @nodoc
class __$SecondhandsResultEntityCopyWithImpl<$Res>
    implements _$SecondhandsResultEntityCopyWith<$Res> {
  __$SecondhandsResultEntityCopyWithImpl(this._self, this._then);

  final _SecondhandsResultEntity _self;
  final $Res Function(_SecondhandsResultEntity) _then;

/// Create a copy of SecondhandsResultEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? totalRows = null,Object? totalPages = null,Object? currentPage = null,Object? hasNext = null,}) {
  return _then(_SecondhandsResultEntity(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<SecondhandEntity>,totalRows: null == totalRows ? _self.totalRows : totalRows // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,hasNext: null == hasNext ? _self.hasNext : hasNext // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
