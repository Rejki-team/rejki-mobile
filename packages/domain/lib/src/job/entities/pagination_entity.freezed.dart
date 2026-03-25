// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagination_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PaginationEntity {

/// Number of items per page
 int get limit;/// Current page number
 int get page;/// Sort field and direction
 String get sort;/// Total number of rows/items
 int get totalRows;/// Total number of pages
 int get totalPages;/// Whether there is a next page
 bool get hasNext;
/// Create a copy of PaginationEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginationEntityCopyWith<PaginationEntity> get copyWith => _$PaginationEntityCopyWithImpl<PaginationEntity>(this as PaginationEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginationEntity&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.page, page) || other.page == page)&&(identical(other.sort, sort) || other.sort == sort)&&(identical(other.totalRows, totalRows) || other.totalRows == totalRows)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.hasNext, hasNext) || other.hasNext == hasNext));
}


@override
int get hashCode => Object.hash(runtimeType,limit,page,sort,totalRows,totalPages,hasNext);

@override
String toString() {
  return 'PaginationEntity(limit: $limit, page: $page, sort: $sort, totalRows: $totalRows, totalPages: $totalPages, hasNext: $hasNext)';
}


}

/// @nodoc
abstract mixin class $PaginationEntityCopyWith<$Res>  {
  factory $PaginationEntityCopyWith(PaginationEntity value, $Res Function(PaginationEntity) _then) = _$PaginationEntityCopyWithImpl;
@useResult
$Res call({
 int limit, int page, String sort, int totalRows, int totalPages, bool hasNext
});




}
/// @nodoc
class _$PaginationEntityCopyWithImpl<$Res>
    implements $PaginationEntityCopyWith<$Res> {
  _$PaginationEntityCopyWithImpl(this._self, this._then);

  final PaginationEntity _self;
  final $Res Function(PaginationEntity) _then;

/// Create a copy of PaginationEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? limit = null,Object? page = null,Object? sort = null,Object? totalRows = null,Object? totalPages = null,Object? hasNext = null,}) {
  return _then(_self.copyWith(
limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,sort: null == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as String,totalRows: null == totalRows ? _self.totalRows : totalRows // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,hasNext: null == hasNext ? _self.hasNext : hasNext // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PaginationEntity].
extension PaginationEntityPatterns on PaginationEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaginationEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaginationEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaginationEntity value)  $default,){
final _that = this;
switch (_that) {
case _PaginationEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaginationEntity value)?  $default,){
final _that = this;
switch (_that) {
case _PaginationEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int limit,  int page,  String sort,  int totalRows,  int totalPages,  bool hasNext)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaginationEntity() when $default != null:
return $default(_that.limit,_that.page,_that.sort,_that.totalRows,_that.totalPages,_that.hasNext);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int limit,  int page,  String sort,  int totalRows,  int totalPages,  bool hasNext)  $default,) {final _that = this;
switch (_that) {
case _PaginationEntity():
return $default(_that.limit,_that.page,_that.sort,_that.totalRows,_that.totalPages,_that.hasNext);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int limit,  int page,  String sort,  int totalRows,  int totalPages,  bool hasNext)?  $default,) {final _that = this;
switch (_that) {
case _PaginationEntity() when $default != null:
return $default(_that.limit,_that.page,_that.sort,_that.totalRows,_that.totalPages,_that.hasNext);case _:
  return null;

}
}

}

/// @nodoc


class _PaginationEntity extends PaginationEntity {
  const _PaginationEntity({required this.limit, required this.page, required this.sort, required this.totalRows, required this.totalPages, required this.hasNext}): super._();
  

/// Number of items per page
@override final  int limit;
/// Current page number
@override final  int page;
/// Sort field and direction
@override final  String sort;
/// Total number of rows/items
@override final  int totalRows;
/// Total number of pages
@override final  int totalPages;
/// Whether there is a next page
@override final  bool hasNext;

/// Create a copy of PaginationEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginationEntityCopyWith<_PaginationEntity> get copyWith => __$PaginationEntityCopyWithImpl<_PaginationEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaginationEntity&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.page, page) || other.page == page)&&(identical(other.sort, sort) || other.sort == sort)&&(identical(other.totalRows, totalRows) || other.totalRows == totalRows)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.hasNext, hasNext) || other.hasNext == hasNext));
}


@override
int get hashCode => Object.hash(runtimeType,limit,page,sort,totalRows,totalPages,hasNext);

@override
String toString() {
  return 'PaginationEntity(limit: $limit, page: $page, sort: $sort, totalRows: $totalRows, totalPages: $totalPages, hasNext: $hasNext)';
}


}

/// @nodoc
abstract mixin class _$PaginationEntityCopyWith<$Res> implements $PaginationEntityCopyWith<$Res> {
  factory _$PaginationEntityCopyWith(_PaginationEntity value, $Res Function(_PaginationEntity) _then) = __$PaginationEntityCopyWithImpl;
@override @useResult
$Res call({
 int limit, int page, String sort, int totalRows, int totalPages, bool hasNext
});




}
/// @nodoc
class __$PaginationEntityCopyWithImpl<$Res>
    implements _$PaginationEntityCopyWith<$Res> {
  __$PaginationEntityCopyWithImpl(this._self, this._then);

  final _PaginationEntity _self;
  final $Res Function(_PaginationEntity) _then;

/// Create a copy of PaginationEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? limit = null,Object? page = null,Object? sort = null,Object? totalRows = null,Object? totalPages = null,Object? hasNext = null,}) {
  return _then(_PaginationEntity(
limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,sort: null == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as String,totalRows: null == totalRows ? _self.totalRows : totalRows // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,hasNext: null == hasNext ? _self.hasNext : hasNext // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
