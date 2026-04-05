// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagination_secondhand_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaginationSecondhandModel {

 int get limit; int get page; String get sort;@JsonKey(name: 'total_rows') int get totalRows;@JsonKey(name: 'total_pages') int get totalPages;@JsonKey(name: 'has_next') bool get hasNext;
/// Create a copy of PaginationSecondhandModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginationSecondhandModelCopyWith<PaginationSecondhandModel> get copyWith => _$PaginationSecondhandModelCopyWithImpl<PaginationSecondhandModel>(this as PaginationSecondhandModel, _$identity);

  /// Serializes this PaginationSecondhandModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginationSecondhandModel&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.page, page) || other.page == page)&&(identical(other.sort, sort) || other.sort == sort)&&(identical(other.totalRows, totalRows) || other.totalRows == totalRows)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.hasNext, hasNext) || other.hasNext == hasNext));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,limit,page,sort,totalRows,totalPages,hasNext);

@override
String toString() {
  return 'PaginationSecondhandModel(limit: $limit, page: $page, sort: $sort, totalRows: $totalRows, totalPages: $totalPages, hasNext: $hasNext)';
}


}

/// @nodoc
abstract mixin class $PaginationSecondhandModelCopyWith<$Res>  {
  factory $PaginationSecondhandModelCopyWith(PaginationSecondhandModel value, $Res Function(PaginationSecondhandModel) _then) = _$PaginationSecondhandModelCopyWithImpl;
@useResult
$Res call({
 int limit, int page, String sort,@JsonKey(name: 'total_rows') int totalRows,@JsonKey(name: 'total_pages') int totalPages,@JsonKey(name: 'has_next') bool hasNext
});




}
/// @nodoc
class _$PaginationSecondhandModelCopyWithImpl<$Res>
    implements $PaginationSecondhandModelCopyWith<$Res> {
  _$PaginationSecondhandModelCopyWithImpl(this._self, this._then);

  final PaginationSecondhandModel _self;
  final $Res Function(PaginationSecondhandModel) _then;

/// Create a copy of PaginationSecondhandModel
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


/// Adds pattern-matching-related methods to [PaginationSecondhandModel].
extension PaginationSecondhandModelPatterns on PaginationSecondhandModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaginationSecondhandModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaginationSecondhandModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaginationSecondhandModel value)  $default,){
final _that = this;
switch (_that) {
case _PaginationSecondhandModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaginationSecondhandModel value)?  $default,){
final _that = this;
switch (_that) {
case _PaginationSecondhandModel() when $default != null:
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
case _PaginationSecondhandModel() when $default != null:
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
case _PaginationSecondhandModel():
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
case _PaginationSecondhandModel() when $default != null:
return $default(_that.limit,_that.page,_that.sort,_that.totalRows,_that.totalPages,_that.hasNext);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaginationSecondhandModel implements PaginationSecondhandModel {
  const _PaginationSecondhandModel({required this.limit, required this.page, this.sort = '', @JsonKey(name: 'total_rows') required this.totalRows, @JsonKey(name: 'total_pages') required this.totalPages, @JsonKey(name: 'has_next') required this.hasNext});
  factory _PaginationSecondhandModel.fromJson(Map<String, dynamic> json) => _$PaginationSecondhandModelFromJson(json);

@override final  int limit;
@override final  int page;
@override@JsonKey() final  String sort;
@override@JsonKey(name: 'total_rows') final  int totalRows;
@override@JsonKey(name: 'total_pages') final  int totalPages;
@override@JsonKey(name: 'has_next') final  bool hasNext;

/// Create a copy of PaginationSecondhandModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginationSecondhandModelCopyWith<_PaginationSecondhandModel> get copyWith => __$PaginationSecondhandModelCopyWithImpl<_PaginationSecondhandModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaginationSecondhandModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaginationSecondhandModel&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.page, page) || other.page == page)&&(identical(other.sort, sort) || other.sort == sort)&&(identical(other.totalRows, totalRows) || other.totalRows == totalRows)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.hasNext, hasNext) || other.hasNext == hasNext));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,limit,page,sort,totalRows,totalPages,hasNext);

@override
String toString() {
  return 'PaginationSecondhandModel(limit: $limit, page: $page, sort: $sort, totalRows: $totalRows, totalPages: $totalPages, hasNext: $hasNext)';
}


}

/// @nodoc
abstract mixin class _$PaginationSecondhandModelCopyWith<$Res> implements $PaginationSecondhandModelCopyWith<$Res> {
  factory _$PaginationSecondhandModelCopyWith(_PaginationSecondhandModel value, $Res Function(_PaginationSecondhandModel) _then) = __$PaginationSecondhandModelCopyWithImpl;
@override @useResult
$Res call({
 int limit, int page, String sort,@JsonKey(name: 'total_rows') int totalRows,@JsonKey(name: 'total_pages') int totalPages,@JsonKey(name: 'has_next') bool hasNext
});




}
/// @nodoc
class __$PaginationSecondhandModelCopyWithImpl<$Res>
    implements _$PaginationSecondhandModelCopyWith<$Res> {
  __$PaginationSecondhandModelCopyWithImpl(this._self, this._then);

  final _PaginationSecondhandModel _self;
  final $Res Function(_PaginationSecondhandModel) _then;

/// Create a copy of PaginationSecondhandModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? limit = null,Object? page = null,Object? sort = null,Object? totalRows = null,Object? totalPages = null,Object? hasNext = null,}) {
  return _then(_PaginationSecondhandModel(
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
