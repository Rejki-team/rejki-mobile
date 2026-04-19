// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bids_result_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BidsResultEntity {

/// List of bids
 List<BidEntity> get bids;/// Pagination metadata
 PaginationEntity get pagination;
/// Create a copy of BidsResultEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BidsResultEntityCopyWith<BidsResultEntity> get copyWith => _$BidsResultEntityCopyWithImpl<BidsResultEntity>(this as BidsResultEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BidsResultEntity&&const DeepCollectionEquality().equals(other.bids, bids)&&(identical(other.pagination, pagination) || other.pagination == pagination));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(bids),pagination);

@override
String toString() {
  return 'BidsResultEntity(bids: $bids, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class $BidsResultEntityCopyWith<$Res>  {
  factory $BidsResultEntityCopyWith(BidsResultEntity value, $Res Function(BidsResultEntity) _then) = _$BidsResultEntityCopyWithImpl;
@useResult
$Res call({
 List<BidEntity> bids, PaginationEntity pagination
});


$PaginationEntityCopyWith<$Res> get pagination;

}
/// @nodoc
class _$BidsResultEntityCopyWithImpl<$Res>
    implements $BidsResultEntityCopyWith<$Res> {
  _$BidsResultEntityCopyWithImpl(this._self, this._then);

  final BidsResultEntity _self;
  final $Res Function(BidsResultEntity) _then;

/// Create a copy of BidsResultEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bids = null,Object? pagination = null,}) {
  return _then(_self.copyWith(
bids: null == bids ? _self.bids : bids // ignore: cast_nullable_to_non_nullable
as List<BidEntity>,pagination: null == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as PaginationEntity,
  ));
}
/// Create a copy of BidsResultEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationEntityCopyWith<$Res> get pagination {
  
  return $PaginationEntityCopyWith<$Res>(_self.pagination, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}
}


/// Adds pattern-matching-related methods to [BidsResultEntity].
extension BidsResultEntityPatterns on BidsResultEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BidsResultEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BidsResultEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BidsResultEntity value)  $default,){
final _that = this;
switch (_that) {
case _BidsResultEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BidsResultEntity value)?  $default,){
final _that = this;
switch (_that) {
case _BidsResultEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<BidEntity> bids,  PaginationEntity pagination)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BidsResultEntity() when $default != null:
return $default(_that.bids,_that.pagination);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<BidEntity> bids,  PaginationEntity pagination)  $default,) {final _that = this;
switch (_that) {
case _BidsResultEntity():
return $default(_that.bids,_that.pagination);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<BidEntity> bids,  PaginationEntity pagination)?  $default,) {final _that = this;
switch (_that) {
case _BidsResultEntity() when $default != null:
return $default(_that.bids,_that.pagination);case _:
  return null;

}
}

}

/// @nodoc


class _BidsResultEntity extends BidsResultEntity {
  const _BidsResultEntity({required final  List<BidEntity> bids, required this.pagination}): _bids = bids,super._();
  

/// List of bids
 final  List<BidEntity> _bids;
/// List of bids
@override List<BidEntity> get bids {
  if (_bids is EqualUnmodifiableListView) return _bids;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_bids);
}

/// Pagination metadata
@override final  PaginationEntity pagination;

/// Create a copy of BidsResultEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BidsResultEntityCopyWith<_BidsResultEntity> get copyWith => __$BidsResultEntityCopyWithImpl<_BidsResultEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BidsResultEntity&&const DeepCollectionEquality().equals(other._bids, _bids)&&(identical(other.pagination, pagination) || other.pagination == pagination));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_bids),pagination);

@override
String toString() {
  return 'BidsResultEntity(bids: $bids, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class _$BidsResultEntityCopyWith<$Res> implements $BidsResultEntityCopyWith<$Res> {
  factory _$BidsResultEntityCopyWith(_BidsResultEntity value, $Res Function(_BidsResultEntity) _then) = __$BidsResultEntityCopyWithImpl;
@override @useResult
$Res call({
 List<BidEntity> bids, PaginationEntity pagination
});


@override $PaginationEntityCopyWith<$Res> get pagination;

}
/// @nodoc
class __$BidsResultEntityCopyWithImpl<$Res>
    implements _$BidsResultEntityCopyWith<$Res> {
  __$BidsResultEntityCopyWithImpl(this._self, this._then);

  final _BidsResultEntity _self;
  final $Res Function(_BidsResultEntity) _then;

/// Create a copy of BidsResultEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bids = null,Object? pagination = null,}) {
  return _then(_BidsResultEntity(
bids: null == bids ? _self._bids : bids // ignore: cast_nullable_to_non_nullable
as List<BidEntity>,pagination: null == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as PaginationEntity,
  ));
}

/// Create a copy of BidsResultEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationEntityCopyWith<$Res> get pagination {
  
  return $PaginationEntityCopyWith<$Res>(_self.pagination, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}
}

// dart format on
