// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'training_image_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TrainingImageEntity {

 int get id; String get trainingId; String get uriPath; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of TrainingImageEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainingImageEntityCopyWith<TrainingImageEntity> get copyWith => _$TrainingImageEntityCopyWithImpl<TrainingImageEntity>(this as TrainingImageEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainingImageEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.trainingId, trainingId) || other.trainingId == trainingId)&&(identical(other.uriPath, uriPath) || other.uriPath == uriPath)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,trainingId,uriPath,createdAt,updatedAt);

@override
String toString() {
  return 'TrainingImageEntity(id: $id, trainingId: $trainingId, uriPath: $uriPath, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $TrainingImageEntityCopyWith<$Res>  {
  factory $TrainingImageEntityCopyWith(TrainingImageEntity value, $Res Function(TrainingImageEntity) _then) = _$TrainingImageEntityCopyWithImpl;
@useResult
$Res call({
 int id, String trainingId, String uriPath, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$TrainingImageEntityCopyWithImpl<$Res>
    implements $TrainingImageEntityCopyWith<$Res> {
  _$TrainingImageEntityCopyWithImpl(this._self, this._then);

  final TrainingImageEntity _self;
  final $Res Function(TrainingImageEntity) _then;

/// Create a copy of TrainingImageEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? trainingId = null,Object? uriPath = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,trainingId: null == trainingId ? _self.trainingId : trainingId // ignore: cast_nullable_to_non_nullable
as String,uriPath: null == uriPath ? _self.uriPath : uriPath // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [TrainingImageEntity].
extension TrainingImageEntityPatterns on TrainingImageEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrainingImageEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrainingImageEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrainingImageEntity value)  $default,){
final _that = this;
switch (_that) {
case _TrainingImageEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrainingImageEntity value)?  $default,){
final _that = this;
switch (_that) {
case _TrainingImageEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String trainingId,  String uriPath,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrainingImageEntity() when $default != null:
return $default(_that.id,_that.trainingId,_that.uriPath,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String trainingId,  String uriPath,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _TrainingImageEntity():
return $default(_that.id,_that.trainingId,_that.uriPath,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String trainingId,  String uriPath,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _TrainingImageEntity() when $default != null:
return $default(_that.id,_that.trainingId,_that.uriPath,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _TrainingImageEntity implements TrainingImageEntity {
  const _TrainingImageEntity({required this.id, required this.trainingId, required this.uriPath, this.createdAt, this.updatedAt});
  

@override final  int id;
@override final  String trainingId;
@override final  String uriPath;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of TrainingImageEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrainingImageEntityCopyWith<_TrainingImageEntity> get copyWith => __$TrainingImageEntityCopyWithImpl<_TrainingImageEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrainingImageEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.trainingId, trainingId) || other.trainingId == trainingId)&&(identical(other.uriPath, uriPath) || other.uriPath == uriPath)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,trainingId,uriPath,createdAt,updatedAt);

@override
String toString() {
  return 'TrainingImageEntity(id: $id, trainingId: $trainingId, uriPath: $uriPath, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$TrainingImageEntityCopyWith<$Res> implements $TrainingImageEntityCopyWith<$Res> {
  factory _$TrainingImageEntityCopyWith(_TrainingImageEntity value, $Res Function(_TrainingImageEntity) _then) = __$TrainingImageEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String trainingId, String uriPath, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class __$TrainingImageEntityCopyWithImpl<$Res>
    implements _$TrainingImageEntityCopyWith<$Res> {
  __$TrainingImageEntityCopyWithImpl(this._self, this._then);

  final _TrainingImageEntity _self;
  final $Res Function(_TrainingImageEntity) _then;

/// Create a copy of TrainingImageEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? trainingId = null,Object? uriPath = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_TrainingImageEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,trainingId: null == trainingId ? _self.trainingId : trainingId // ignore: cast_nullable_to_non_nullable
as String,uriPath: null == uriPath ? _self.uriPath : uriPath // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
