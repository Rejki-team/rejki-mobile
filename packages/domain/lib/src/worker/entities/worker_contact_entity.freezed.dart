// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'worker_contact_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WorkerContactEntity {

 String get id; String get status; String get workerId; WorkerEntity get worker; String get createdAt; String get updatedAt;
/// Create a copy of WorkerContactEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkerContactEntityCopyWith<WorkerContactEntity> get copyWith => _$WorkerContactEntityCopyWithImpl<WorkerContactEntity>(this as WorkerContactEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkerContactEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.workerId, workerId) || other.workerId == workerId)&&(identical(other.worker, worker) || other.worker == worker)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,status,workerId,worker,createdAt,updatedAt);

@override
String toString() {
  return 'WorkerContactEntity(id: $id, status: $status, workerId: $workerId, worker: $worker, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $WorkerContactEntityCopyWith<$Res>  {
  factory $WorkerContactEntityCopyWith(WorkerContactEntity value, $Res Function(WorkerContactEntity) _then) = _$WorkerContactEntityCopyWithImpl;
@useResult
$Res call({
 String id, String status, String workerId, WorkerEntity worker, String createdAt, String updatedAt
});


$WorkerEntityCopyWith<$Res> get worker;

}
/// @nodoc
class _$WorkerContactEntityCopyWithImpl<$Res>
    implements $WorkerContactEntityCopyWith<$Res> {
  _$WorkerContactEntityCopyWithImpl(this._self, this._then);

  final WorkerContactEntity _self;
  final $Res Function(WorkerContactEntity) _then;

/// Create a copy of WorkerContactEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? status = null,Object? workerId = null,Object? worker = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,workerId: null == workerId ? _self.workerId : workerId // ignore: cast_nullable_to_non_nullable
as String,worker: null == worker ? _self.worker : worker // ignore: cast_nullable_to_non_nullable
as WorkerEntity,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of WorkerContactEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WorkerEntityCopyWith<$Res> get worker {
  
  return $WorkerEntityCopyWith<$Res>(_self.worker, (value) {
    return _then(_self.copyWith(worker: value));
  });
}
}


/// Adds pattern-matching-related methods to [WorkerContactEntity].
extension WorkerContactEntityPatterns on WorkerContactEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WorkerContactEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WorkerContactEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WorkerContactEntity value)  $default,){
final _that = this;
switch (_that) {
case _WorkerContactEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WorkerContactEntity value)?  $default,){
final _that = this;
switch (_that) {
case _WorkerContactEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String status,  String workerId,  WorkerEntity worker,  String createdAt,  String updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WorkerContactEntity() when $default != null:
return $default(_that.id,_that.status,_that.workerId,_that.worker,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String status,  String workerId,  WorkerEntity worker,  String createdAt,  String updatedAt)  $default,) {final _that = this;
switch (_that) {
case _WorkerContactEntity():
return $default(_that.id,_that.status,_that.workerId,_that.worker,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String status,  String workerId,  WorkerEntity worker,  String createdAt,  String updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _WorkerContactEntity() when $default != null:
return $default(_that.id,_that.status,_that.workerId,_that.worker,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _WorkerContactEntity implements WorkerContactEntity {
  const _WorkerContactEntity({required this.id, required this.status, required this.workerId, required this.worker, required this.createdAt, required this.updatedAt});
  

@override final  String id;
@override final  String status;
@override final  String workerId;
@override final  WorkerEntity worker;
@override final  String createdAt;
@override final  String updatedAt;

/// Create a copy of WorkerContactEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkerContactEntityCopyWith<_WorkerContactEntity> get copyWith => __$WorkerContactEntityCopyWithImpl<_WorkerContactEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkerContactEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.workerId, workerId) || other.workerId == workerId)&&(identical(other.worker, worker) || other.worker == worker)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,status,workerId,worker,createdAt,updatedAt);

@override
String toString() {
  return 'WorkerContactEntity(id: $id, status: $status, workerId: $workerId, worker: $worker, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$WorkerContactEntityCopyWith<$Res> implements $WorkerContactEntityCopyWith<$Res> {
  factory _$WorkerContactEntityCopyWith(_WorkerContactEntity value, $Res Function(_WorkerContactEntity) _then) = __$WorkerContactEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String status, String workerId, WorkerEntity worker, String createdAt, String updatedAt
});


@override $WorkerEntityCopyWith<$Res> get worker;

}
/// @nodoc
class __$WorkerContactEntityCopyWithImpl<$Res>
    implements _$WorkerContactEntityCopyWith<$Res> {
  __$WorkerContactEntityCopyWithImpl(this._self, this._then);

  final _WorkerContactEntity _self;
  final $Res Function(_WorkerContactEntity) _then;

/// Create a copy of WorkerContactEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? status = null,Object? workerId = null,Object? worker = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_WorkerContactEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,workerId: null == workerId ? _self.workerId : workerId // ignore: cast_nullable_to_non_nullable
as String,worker: null == worker ? _self.worker : worker // ignore: cast_nullable_to_non_nullable
as WorkerEntity,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of WorkerContactEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WorkerEntityCopyWith<$Res> get worker {
  
  return $WorkerEntityCopyWith<$Res>(_self.worker, (value) {
    return _then(_self.copyWith(worker: value));
  });
}
}

// dart format on
