// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'secondhands_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SecondhandsResponseModel {

 List<SecondhandModel> get data; PaginationSecondhandModel get pagination;
/// Create a copy of SecondhandsResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SecondhandsResponseModelCopyWith<SecondhandsResponseModel> get copyWith => _$SecondhandsResponseModelCopyWithImpl<SecondhandsResponseModel>(this as SecondhandsResponseModel, _$identity);

  /// Serializes this SecondhandsResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SecondhandsResponseModel&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.pagination, pagination) || other.pagination == pagination));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),pagination);

@override
String toString() {
  return 'SecondhandsResponseModel(data: $data, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class $SecondhandsResponseModelCopyWith<$Res>  {
  factory $SecondhandsResponseModelCopyWith(SecondhandsResponseModel value, $Res Function(SecondhandsResponseModel) _then) = _$SecondhandsResponseModelCopyWithImpl;
@useResult
$Res call({
 List<SecondhandModel> data, PaginationSecondhandModel pagination
});


$PaginationSecondhandModelCopyWith<$Res> get pagination;

}
/// @nodoc
class _$SecondhandsResponseModelCopyWithImpl<$Res>
    implements $SecondhandsResponseModelCopyWith<$Res> {
  _$SecondhandsResponseModelCopyWithImpl(this._self, this._then);

  final SecondhandsResponseModel _self;
  final $Res Function(SecondhandsResponseModel) _then;

/// Create a copy of SecondhandsResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,Object? pagination = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<SecondhandModel>,pagination: null == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as PaginationSecondhandModel,
  ));
}
/// Create a copy of SecondhandsResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationSecondhandModelCopyWith<$Res> get pagination {
  
  return $PaginationSecondhandModelCopyWith<$Res>(_self.pagination, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}
}


/// Adds pattern-matching-related methods to [SecondhandsResponseModel].
extension SecondhandsResponseModelPatterns on SecondhandsResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SecondhandsResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SecondhandsResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SecondhandsResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _SecondhandsResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SecondhandsResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _SecondhandsResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<SecondhandModel> data,  PaginationSecondhandModel pagination)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SecondhandsResponseModel() when $default != null:
return $default(_that.data,_that.pagination);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<SecondhandModel> data,  PaginationSecondhandModel pagination)  $default,) {final _that = this;
switch (_that) {
case _SecondhandsResponseModel():
return $default(_that.data,_that.pagination);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<SecondhandModel> data,  PaginationSecondhandModel pagination)?  $default,) {final _that = this;
switch (_that) {
case _SecondhandsResponseModel() when $default != null:
return $default(_that.data,_that.pagination);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SecondhandsResponseModel extends SecondhandsResponseModel {
  const _SecondhandsResponseModel({final  List<SecondhandModel> data = const [], required this.pagination}): _data = data,super._();
  factory _SecondhandsResponseModel.fromJson(Map<String, dynamic> json) => _$SecondhandsResponseModelFromJson(json);

 final  List<SecondhandModel> _data;
@override@JsonKey() List<SecondhandModel> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override final  PaginationSecondhandModel pagination;

/// Create a copy of SecondhandsResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SecondhandsResponseModelCopyWith<_SecondhandsResponseModel> get copyWith => __$SecondhandsResponseModelCopyWithImpl<_SecondhandsResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SecondhandsResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SecondhandsResponseModel&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.pagination, pagination) || other.pagination == pagination));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data),pagination);

@override
String toString() {
  return 'SecondhandsResponseModel(data: $data, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class _$SecondhandsResponseModelCopyWith<$Res> implements $SecondhandsResponseModelCopyWith<$Res> {
  factory _$SecondhandsResponseModelCopyWith(_SecondhandsResponseModel value, $Res Function(_SecondhandsResponseModel) _then) = __$SecondhandsResponseModelCopyWithImpl;
@override @useResult
$Res call({
 List<SecondhandModel> data, PaginationSecondhandModel pagination
});


@override $PaginationSecondhandModelCopyWith<$Res> get pagination;

}
/// @nodoc
class __$SecondhandsResponseModelCopyWithImpl<$Res>
    implements _$SecondhandsResponseModelCopyWith<$Res> {
  __$SecondhandsResponseModelCopyWithImpl(this._self, this._then);

  final _SecondhandsResponseModel _self;
  final $Res Function(_SecondhandsResponseModel) _then;

/// Create a copy of SecondhandsResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? pagination = null,}) {
  return _then(_SecondhandsResponseModel(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<SecondhandModel>,pagination: null == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as PaginationSecondhandModel,
  ));
}

/// Create a copy of SecondhandsResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationSecondhandModelCopyWith<$Res> get pagination {
  
  return $PaginationSecondhandModelCopyWith<$Res>(_self.pagination, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}
}

// dart format on
