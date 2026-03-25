// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job_image_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$JobImageEntity {

/// Image unique identifier
 String get id;/// Job ID this image belongs to
 String get jobId;/// URI path of the image
 String get uriPath;/// Image created at
 DateTime? get createdAt;/// Image updated at
 DateTime? get updatedAt;
/// Create a copy of JobImageEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JobImageEntityCopyWith<JobImageEntity> get copyWith => _$JobImageEntityCopyWithImpl<JobImageEntity>(this as JobImageEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobImageEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.jobId, jobId) || other.jobId == jobId)&&(identical(other.uriPath, uriPath) || other.uriPath == uriPath)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,jobId,uriPath,createdAt,updatedAt);

@override
String toString() {
  return 'JobImageEntity(id: $id, jobId: $jobId, uriPath: $uriPath, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $JobImageEntityCopyWith<$Res>  {
  factory $JobImageEntityCopyWith(JobImageEntity value, $Res Function(JobImageEntity) _then) = _$JobImageEntityCopyWithImpl;
@useResult
$Res call({
 String id, String jobId, String uriPath, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$JobImageEntityCopyWithImpl<$Res>
    implements $JobImageEntityCopyWith<$Res> {
  _$JobImageEntityCopyWithImpl(this._self, this._then);

  final JobImageEntity _self;
  final $Res Function(JobImageEntity) _then;

/// Create a copy of JobImageEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? jobId = null,Object? uriPath = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,jobId: null == jobId ? _self.jobId : jobId // ignore: cast_nullable_to_non_nullable
as String,uriPath: null == uriPath ? _self.uriPath : uriPath // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [JobImageEntity].
extension JobImageEntityPatterns on JobImageEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JobImageEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JobImageEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JobImageEntity value)  $default,){
final _that = this;
switch (_that) {
case _JobImageEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JobImageEntity value)?  $default,){
final _that = this;
switch (_that) {
case _JobImageEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String jobId,  String uriPath,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JobImageEntity() when $default != null:
return $default(_that.id,_that.jobId,_that.uriPath,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String jobId,  String uriPath,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _JobImageEntity():
return $default(_that.id,_that.jobId,_that.uriPath,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String jobId,  String uriPath,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _JobImageEntity() when $default != null:
return $default(_that.id,_that.jobId,_that.uriPath,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _JobImageEntity extends JobImageEntity {
  const _JobImageEntity({required this.id, required this.jobId, required this.uriPath, this.createdAt, this.updatedAt}): super._();
  

/// Image unique identifier
@override final  String id;
/// Job ID this image belongs to
@override final  String jobId;
/// URI path of the image
@override final  String uriPath;
/// Image created at
@override final  DateTime? createdAt;
/// Image updated at
@override final  DateTime? updatedAt;

/// Create a copy of JobImageEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JobImageEntityCopyWith<_JobImageEntity> get copyWith => __$JobImageEntityCopyWithImpl<_JobImageEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JobImageEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.jobId, jobId) || other.jobId == jobId)&&(identical(other.uriPath, uriPath) || other.uriPath == uriPath)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,jobId,uriPath,createdAt,updatedAt);

@override
String toString() {
  return 'JobImageEntity(id: $id, jobId: $jobId, uriPath: $uriPath, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$JobImageEntityCopyWith<$Res> implements $JobImageEntityCopyWith<$Res> {
  factory _$JobImageEntityCopyWith(_JobImageEntity value, $Res Function(_JobImageEntity) _then) = __$JobImageEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String jobId, String uriPath, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class __$JobImageEntityCopyWithImpl<$Res>
    implements _$JobImageEntityCopyWith<$Res> {
  __$JobImageEntityCopyWithImpl(this._self, this._then);

  final _JobImageEntity _self;
  final $Res Function(_JobImageEntity) _then;

/// Create a copy of JobImageEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? jobId = null,Object? uriPath = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_JobImageEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,jobId: null == jobId ? _self.jobId : jobId // ignore: cast_nullable_to_non_nullable
as String,uriPath: null == uriPath ? _self.uriPath : uriPath // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
