// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagination_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaginationModel {

/// Number of items per page
 int get limit;/// Current page number
 int get page;/// Sort field and direction
 String get sort;/// Total number of rows/items
@JsonKey(name: 'total_rows') int get totalRows;/// Total number of pages
@JsonKey(name: 'total_pages') int get totalPages;/// Whether there is a next page
@JsonKey(name: 'has_next') bool get hasNext;
/// Create a copy of PaginationModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginationModelCopyWith<PaginationModel> get copyWith => _$PaginationModelCopyWithImpl<PaginationModel>(this as PaginationModel, _$identity);

  /// Serializes this PaginationModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginationModel&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.page, page) || other.page == page)&&(identical(other.sort, sort) || other.sort == sort)&&(identical(other.totalRows, totalRows) || other.totalRows == totalRows)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.hasNext, hasNext) || other.hasNext == hasNext));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,limit,page,sort,totalRows,totalPages,hasNext);

@override
String toString() {
  return 'PaginationModel(limit: $limit, page: $page, sort: $sort, totalRows: $totalRows, totalPages: $totalPages, hasNext: $hasNext)';
}


}

/// @nodoc
abstract mixin class $PaginationModelCopyWith<$Res>  {
  factory $PaginationModelCopyWith(PaginationModel value, $Res Function(PaginationModel) _then) = _$PaginationModelCopyWithImpl;
@useResult
$Res call({
 int limit, int page, String sort,@JsonKey(name: 'total_rows') int totalRows,@JsonKey(name: 'total_pages') int totalPages,@JsonKey(name: 'has_next') bool hasNext
});




}
/// @nodoc
class _$PaginationModelCopyWithImpl<$Res>
    implements $PaginationModelCopyWith<$Res> {
  _$PaginationModelCopyWithImpl(this._self, this._then);

  final PaginationModel _self;
  final $Res Function(PaginationModel) _then;

/// Create a copy of PaginationModel
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


/// Adds pattern-matching-related methods to [PaginationModel].
extension PaginationModelPatterns on PaginationModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaginationModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaginationModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaginationModel value)  $default,){
final _that = this;
switch (_that) {
case _PaginationModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaginationModel value)?  $default,){
final _that = this;
switch (_that) {
case _PaginationModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int limit,  int page,  String sort, @JsonKey(name: 'total_rows')  int totalRows, @JsonKey(name: 'total_pages')  int totalPages, @JsonKey(name: 'has_next')  bool hasNext)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaginationModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int limit,  int page,  String sort, @JsonKey(name: 'total_rows')  int totalRows, @JsonKey(name: 'total_pages')  int totalPages, @JsonKey(name: 'has_next')  bool hasNext)  $default,) {final _that = this;
switch (_that) {
case _PaginationModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int limit,  int page,  String sort, @JsonKey(name: 'total_rows')  int totalRows, @JsonKey(name: 'total_pages')  int totalPages, @JsonKey(name: 'has_next')  bool hasNext)?  $default,) {final _that = this;
switch (_that) {
case _PaginationModel() when $default != null:
return $default(_that.limit,_that.page,_that.sort,_that.totalRows,_that.totalPages,_that.hasNext);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaginationModel extends PaginationModel {
  const _PaginationModel({required this.limit, required this.page, required this.sort, @JsonKey(name: 'total_rows') required this.totalRows, @JsonKey(name: 'total_pages') required this.totalPages, @JsonKey(name: 'has_next') required this.hasNext}): super._();
  factory _PaginationModel.fromJson(Map<String, dynamic> json) => _$PaginationModelFromJson(json);

/// Number of items per page
@override final  int limit;
/// Current page number
@override final  int page;
/// Sort field and direction
@override final  String sort;
/// Total number of rows/items
@override@JsonKey(name: 'total_rows') final  int totalRows;
/// Total number of pages
@override@JsonKey(name: 'total_pages') final  int totalPages;
/// Whether there is a next page
@override@JsonKey(name: 'has_next') final  bool hasNext;

/// Create a copy of PaginationModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginationModelCopyWith<_PaginationModel> get copyWith => __$PaginationModelCopyWithImpl<_PaginationModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaginationModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaginationModel&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.page, page) || other.page == page)&&(identical(other.sort, sort) || other.sort == sort)&&(identical(other.totalRows, totalRows) || other.totalRows == totalRows)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.hasNext, hasNext) || other.hasNext == hasNext));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,limit,page,sort,totalRows,totalPages,hasNext);

@override
String toString() {
  return 'PaginationModel(limit: $limit, page: $page, sort: $sort, totalRows: $totalRows, totalPages: $totalPages, hasNext: $hasNext)';
}


}

/// @nodoc
abstract mixin class _$PaginationModelCopyWith<$Res> implements $PaginationModelCopyWith<$Res> {
  factory _$PaginationModelCopyWith(_PaginationModel value, $Res Function(_PaginationModel) _then) = __$PaginationModelCopyWithImpl;
@override @useResult
$Res call({
 int limit, int page, String sort,@JsonKey(name: 'total_rows') int totalRows,@JsonKey(name: 'total_pages') int totalPages,@JsonKey(name: 'has_next') bool hasNext
});




}
/// @nodoc
class __$PaginationModelCopyWithImpl<$Res>
    implements _$PaginationModelCopyWith<$Res> {
  __$PaginationModelCopyWithImpl(this._self, this._then);

  final _PaginationModel _self;
  final $Res Function(_PaginationModel) _then;

/// Create a copy of PaginationModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? limit = null,Object? page = null,Object? sort = null,Object? totalRows = null,Object? totalPages = null,Object? hasNext = null,}) {
  return _then(_PaginationModel(
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
