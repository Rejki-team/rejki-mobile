// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rating_aggregate_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RatingAggregateModel {

@JsonKey(name: 'user_id') String get userId; double get average; int get count;
/// Create a copy of RatingAggregateModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RatingAggregateModelCopyWith<RatingAggregateModel> get copyWith => _$RatingAggregateModelCopyWithImpl<RatingAggregateModel>(this as RatingAggregateModel, _$identity);

  /// Serializes this RatingAggregateModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RatingAggregateModel&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.average, average) || other.average == average)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,average,count);

@override
String toString() {
  return 'RatingAggregateModel(userId: $userId, average: $average, count: $count)';
}


}

/// @nodoc
abstract mixin class $RatingAggregateModelCopyWith<$Res>  {
  factory $RatingAggregateModelCopyWith(RatingAggregateModel value, $Res Function(RatingAggregateModel) _then) = _$RatingAggregateModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'user_id') String userId, double average, int count
});




}
/// @nodoc
class _$RatingAggregateModelCopyWithImpl<$Res>
    implements $RatingAggregateModelCopyWith<$Res> {
  _$RatingAggregateModelCopyWithImpl(this._self, this._then);

  final RatingAggregateModel _self;
  final $Res Function(RatingAggregateModel) _then;

/// Create a copy of RatingAggregateModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? average = null,Object? count = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,average: null == average ? _self.average : average // ignore: cast_nullable_to_non_nullable
as double,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [RatingAggregateModel].
extension RatingAggregateModelPatterns on RatingAggregateModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RatingAggregateModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RatingAggregateModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RatingAggregateModel value)  $default,){
final _that = this;
switch (_that) {
case _RatingAggregateModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RatingAggregateModel value)?  $default,){
final _that = this;
switch (_that) {
case _RatingAggregateModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'user_id')  String userId,  double average,  int count)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RatingAggregateModel() when $default != null:
return $default(_that.userId,_that.average,_that.count);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'user_id')  String userId,  double average,  int count)  $default,) {final _that = this;
switch (_that) {
case _RatingAggregateModel():
return $default(_that.userId,_that.average,_that.count);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'user_id')  String userId,  double average,  int count)?  $default,) {final _that = this;
switch (_that) {
case _RatingAggregateModel() when $default != null:
return $default(_that.userId,_that.average,_that.count);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RatingAggregateModel extends RatingAggregateModel {
  const _RatingAggregateModel({@JsonKey(name: 'user_id') required this.userId, this.average = 0.0, this.count = 0}): super._();
  factory _RatingAggregateModel.fromJson(Map<String, dynamic> json) => _$RatingAggregateModelFromJson(json);

@override@JsonKey(name: 'user_id') final  String userId;
@override@JsonKey() final  double average;
@override@JsonKey() final  int count;

/// Create a copy of RatingAggregateModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RatingAggregateModelCopyWith<_RatingAggregateModel> get copyWith => __$RatingAggregateModelCopyWithImpl<_RatingAggregateModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RatingAggregateModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RatingAggregateModel&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.average, average) || other.average == average)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,average,count);

@override
String toString() {
  return 'RatingAggregateModel(userId: $userId, average: $average, count: $count)';
}


}

/// @nodoc
abstract mixin class _$RatingAggregateModelCopyWith<$Res> implements $RatingAggregateModelCopyWith<$Res> {
  factory _$RatingAggregateModelCopyWith(_RatingAggregateModel value, $Res Function(_RatingAggregateModel) _then) = __$RatingAggregateModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'user_id') String userId, double average, int count
});




}
/// @nodoc
class __$RatingAggregateModelCopyWithImpl<$Res>
    implements _$RatingAggregateModelCopyWith<$Res> {
  __$RatingAggregateModelCopyWithImpl(this._self, this._then);

  final _RatingAggregateModel _self;
  final $Res Function(_RatingAggregateModel) _then;

/// Create a copy of RatingAggregateModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? average = null,Object? count = null,}) {
  return _then(_RatingAggregateModel(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,average: null == average ? _self.average : average // ignore: cast_nullable_to_non_nullable
as double,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
