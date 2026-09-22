// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rating_aggregate_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RatingAggregateEntity {

 String get userId; double get average; int get count;
/// Create a copy of RatingAggregateEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RatingAggregateEntityCopyWith<RatingAggregateEntity> get copyWith => _$RatingAggregateEntityCopyWithImpl<RatingAggregateEntity>(this as RatingAggregateEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RatingAggregateEntity&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.average, average) || other.average == average)&&(identical(other.count, count) || other.count == count));
}


@override
int get hashCode => Object.hash(runtimeType,userId,average,count);

@override
String toString() {
  return 'RatingAggregateEntity(userId: $userId, average: $average, count: $count)';
}


}

/// @nodoc
abstract mixin class $RatingAggregateEntityCopyWith<$Res>  {
  factory $RatingAggregateEntityCopyWith(RatingAggregateEntity value, $Res Function(RatingAggregateEntity) _then) = _$RatingAggregateEntityCopyWithImpl;
@useResult
$Res call({
 String userId, double average, int count
});




}
/// @nodoc
class _$RatingAggregateEntityCopyWithImpl<$Res>
    implements $RatingAggregateEntityCopyWith<$Res> {
  _$RatingAggregateEntityCopyWithImpl(this._self, this._then);

  final RatingAggregateEntity _self;
  final $Res Function(RatingAggregateEntity) _then;

/// Create a copy of RatingAggregateEntity
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


/// Adds pattern-matching-related methods to [RatingAggregateEntity].
extension RatingAggregateEntityPatterns on RatingAggregateEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RatingAggregateEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RatingAggregateEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RatingAggregateEntity value)  $default,){
final _that = this;
switch (_that) {
case _RatingAggregateEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RatingAggregateEntity value)?  $default,){
final _that = this;
switch (_that) {
case _RatingAggregateEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId,  double average,  int count)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RatingAggregateEntity() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId,  double average,  int count)  $default,) {final _that = this;
switch (_that) {
case _RatingAggregateEntity():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userId,  double average,  int count)?  $default,) {final _that = this;
switch (_that) {
case _RatingAggregateEntity() when $default != null:
return $default(_that.userId,_that.average,_that.count);case _:
  return null;

}
}

}

/// @nodoc


class _RatingAggregateEntity implements RatingAggregateEntity {
  const _RatingAggregateEntity({required this.userId, required this.average, required this.count});
  

@override final  String userId;
@override final  double average;
@override final  int count;

/// Create a copy of RatingAggregateEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RatingAggregateEntityCopyWith<_RatingAggregateEntity> get copyWith => __$RatingAggregateEntityCopyWithImpl<_RatingAggregateEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RatingAggregateEntity&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.average, average) || other.average == average)&&(identical(other.count, count) || other.count == count));
}


@override
int get hashCode => Object.hash(runtimeType,userId,average,count);

@override
String toString() {
  return 'RatingAggregateEntity(userId: $userId, average: $average, count: $count)';
}


}

/// @nodoc
abstract mixin class _$RatingAggregateEntityCopyWith<$Res> implements $RatingAggregateEntityCopyWith<$Res> {
  factory _$RatingAggregateEntityCopyWith(_RatingAggregateEntity value, $Res Function(_RatingAggregateEntity) _then) = __$RatingAggregateEntityCopyWithImpl;
@override @useResult
$Res call({
 String userId, double average, int count
});




}
/// @nodoc
class __$RatingAggregateEntityCopyWithImpl<$Res>
    implements _$RatingAggregateEntityCopyWith<$Res> {
  __$RatingAggregateEntityCopyWithImpl(this._self, this._then);

  final _RatingAggregateEntity _self;
  final $Res Function(_RatingAggregateEntity) _then;

/// Create a copy of RatingAggregateEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? average = null,Object? count = null,}) {
  return _then(_RatingAggregateEntity(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,average: null == average ? _self.average : average // ignore: cast_nullable_to_non_nullable
as double,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
