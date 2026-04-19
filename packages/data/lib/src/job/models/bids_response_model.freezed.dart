// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bids_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BidsResponseModel {

 List<BidModel> get bids; PaginationModel get pagination;
/// Create a copy of BidsResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BidsResponseModelCopyWith<BidsResponseModel> get copyWith => _$BidsResponseModelCopyWithImpl<BidsResponseModel>(this as BidsResponseModel, _$identity);

  /// Serializes this BidsResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BidsResponseModel&&const DeepCollectionEquality().equals(other.bids, bids)&&(identical(other.pagination, pagination) || other.pagination == pagination));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(bids),pagination);

@override
String toString() {
  return 'BidsResponseModel(bids: $bids, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class $BidsResponseModelCopyWith<$Res>  {
  factory $BidsResponseModelCopyWith(BidsResponseModel value, $Res Function(BidsResponseModel) _then) = _$BidsResponseModelCopyWithImpl;
@useResult
$Res call({
 List<BidModel> bids, PaginationModel pagination
});


$PaginationModelCopyWith<$Res> get pagination;

}
/// @nodoc
class _$BidsResponseModelCopyWithImpl<$Res>
    implements $BidsResponseModelCopyWith<$Res> {
  _$BidsResponseModelCopyWithImpl(this._self, this._then);

  final BidsResponseModel _self;
  final $Res Function(BidsResponseModel) _then;

/// Create a copy of BidsResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bids = null,Object? pagination = null,}) {
  return _then(_self.copyWith(
bids: null == bids ? _self.bids : bids // ignore: cast_nullable_to_non_nullable
as List<BidModel>,pagination: null == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as PaginationModel,
  ));
}
/// Create a copy of BidsResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationModelCopyWith<$Res> get pagination {
  
  return $PaginationModelCopyWith<$Res>(_self.pagination, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}
}


/// Adds pattern-matching-related methods to [BidsResponseModel].
extension BidsResponseModelPatterns on BidsResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BidsResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BidsResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BidsResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _BidsResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BidsResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _BidsResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<BidModel> bids,  PaginationModel pagination)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BidsResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<BidModel> bids,  PaginationModel pagination)  $default,) {final _that = this;
switch (_that) {
case _BidsResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<BidModel> bids,  PaginationModel pagination)?  $default,) {final _that = this;
switch (_that) {
case _BidsResponseModel() when $default != null:
return $default(_that.bids,_that.pagination);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BidsResponseModel extends BidsResponseModel {
  const _BidsResponseModel({required final  List<BidModel> bids, required this.pagination}): _bids = bids,super._();
  factory _BidsResponseModel.fromJson(Map<String, dynamic> json) => _$BidsResponseModelFromJson(json);

 final  List<BidModel> _bids;
@override List<BidModel> get bids {
  if (_bids is EqualUnmodifiableListView) return _bids;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_bids);
}

@override final  PaginationModel pagination;

/// Create a copy of BidsResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BidsResponseModelCopyWith<_BidsResponseModel> get copyWith => __$BidsResponseModelCopyWithImpl<_BidsResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BidsResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BidsResponseModel&&const DeepCollectionEquality().equals(other._bids, _bids)&&(identical(other.pagination, pagination) || other.pagination == pagination));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_bids),pagination);

@override
String toString() {
  return 'BidsResponseModel(bids: $bids, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class _$BidsResponseModelCopyWith<$Res> implements $BidsResponseModelCopyWith<$Res> {
  factory _$BidsResponseModelCopyWith(_BidsResponseModel value, $Res Function(_BidsResponseModel) _then) = __$BidsResponseModelCopyWithImpl;
@override @useResult
$Res call({
 List<BidModel> bids, PaginationModel pagination
});


@override $PaginationModelCopyWith<$Res> get pagination;

}
/// @nodoc
class __$BidsResponseModelCopyWithImpl<$Res>
    implements _$BidsResponseModelCopyWith<$Res> {
  __$BidsResponseModelCopyWithImpl(this._self, this._then);

  final _BidsResponseModel _self;
  final $Res Function(_BidsResponseModel) _then;

/// Create a copy of BidsResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bids = null,Object? pagination = null,}) {
  return _then(_BidsResponseModel(
bids: null == bids ? _self._bids : bids // ignore: cast_nullable_to_non_nullable
as List<BidModel>,pagination: null == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as PaginationModel,
  ));
}

/// Create a copy of BidsResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationModelCopyWith<$Res> get pagination {
  
  return $PaginationModelCopyWith<$Res>(_self.pagination, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}
}

// dart format on
