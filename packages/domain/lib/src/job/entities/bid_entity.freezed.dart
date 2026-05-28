// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bid_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BidEntity {

 String get id; String get jobId; String get workerId; String get userId; String get status; DateTime get dateOfJob; JobEntity? get job; WorkerEntity? get worker; DateTime? get createdAt; DateTime? get updatedAt;// Phase 1 — dual-confirmation tracking
 DateTime? get completionClaimedAt;
/// Create a copy of BidEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BidEntityCopyWith<BidEntity> get copyWith => _$BidEntityCopyWithImpl<BidEntity>(this as BidEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BidEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.jobId, jobId) || other.jobId == jobId)&&(identical(other.workerId, workerId) || other.workerId == workerId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.status, status) || other.status == status)&&(identical(other.dateOfJob, dateOfJob) || other.dateOfJob == dateOfJob)&&(identical(other.job, job) || other.job == job)&&(identical(other.worker, worker) || other.worker == worker)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.completionClaimedAt, completionClaimedAt) || other.completionClaimedAt == completionClaimedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,jobId,workerId,userId,status,dateOfJob,job,worker,createdAt,updatedAt,completionClaimedAt);

@override
String toString() {
  return 'BidEntity(id: $id, jobId: $jobId, workerId: $workerId, userId: $userId, status: $status, dateOfJob: $dateOfJob, job: $job, worker: $worker, createdAt: $createdAt, updatedAt: $updatedAt, completionClaimedAt: $completionClaimedAt)';
}


}

/// @nodoc
abstract mixin class $BidEntityCopyWith<$Res>  {
  factory $BidEntityCopyWith(BidEntity value, $Res Function(BidEntity) _then) = _$BidEntityCopyWithImpl;
@useResult
$Res call({
 String id, String jobId, String workerId, String userId, String status, DateTime dateOfJob, JobEntity? job, WorkerEntity? worker, DateTime? createdAt, DateTime? updatedAt, DateTime? completionClaimedAt
});


$JobEntityCopyWith<$Res>? get job;$WorkerEntityCopyWith<$Res>? get worker;

}
/// @nodoc
class _$BidEntityCopyWithImpl<$Res>
    implements $BidEntityCopyWith<$Res> {
  _$BidEntityCopyWithImpl(this._self, this._then);

  final BidEntity _self;
  final $Res Function(BidEntity) _then;

/// Create a copy of BidEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? jobId = null,Object? workerId = null,Object? userId = null,Object? status = null,Object? dateOfJob = null,Object? job = freezed,Object? worker = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? completionClaimedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,jobId: null == jobId ? _self.jobId : jobId // ignore: cast_nullable_to_non_nullable
as String,workerId: null == workerId ? _self.workerId : workerId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,dateOfJob: null == dateOfJob ? _self.dateOfJob : dateOfJob // ignore: cast_nullable_to_non_nullable
as DateTime,job: freezed == job ? _self.job : job // ignore: cast_nullable_to_non_nullable
as JobEntity?,worker: freezed == worker ? _self.worker : worker // ignore: cast_nullable_to_non_nullable
as WorkerEntity?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,completionClaimedAt: freezed == completionClaimedAt ? _self.completionClaimedAt : completionClaimedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of BidEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JobEntityCopyWith<$Res>? get job {
    if (_self.job == null) {
    return null;
  }

  return $JobEntityCopyWith<$Res>(_self.job!, (value) {
    return _then(_self.copyWith(job: value));
  });
}/// Create a copy of BidEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WorkerEntityCopyWith<$Res>? get worker {
    if (_self.worker == null) {
    return null;
  }

  return $WorkerEntityCopyWith<$Res>(_self.worker!, (value) {
    return _then(_self.copyWith(worker: value));
  });
}
}


/// Adds pattern-matching-related methods to [BidEntity].
extension BidEntityPatterns on BidEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BidEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BidEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BidEntity value)  $default,){
final _that = this;
switch (_that) {
case _BidEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BidEntity value)?  $default,){
final _that = this;
switch (_that) {
case _BidEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String jobId,  String workerId,  String userId,  String status,  DateTime dateOfJob,  JobEntity? job,  WorkerEntity? worker,  DateTime? createdAt,  DateTime? updatedAt,  DateTime? completionClaimedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BidEntity() when $default != null:
return $default(_that.id,_that.jobId,_that.workerId,_that.userId,_that.status,_that.dateOfJob,_that.job,_that.worker,_that.createdAt,_that.updatedAt,_that.completionClaimedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String jobId,  String workerId,  String userId,  String status,  DateTime dateOfJob,  JobEntity? job,  WorkerEntity? worker,  DateTime? createdAt,  DateTime? updatedAt,  DateTime? completionClaimedAt)  $default,) {final _that = this;
switch (_that) {
case _BidEntity():
return $default(_that.id,_that.jobId,_that.workerId,_that.userId,_that.status,_that.dateOfJob,_that.job,_that.worker,_that.createdAt,_that.updatedAt,_that.completionClaimedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String jobId,  String workerId,  String userId,  String status,  DateTime dateOfJob,  JobEntity? job,  WorkerEntity? worker,  DateTime? createdAt,  DateTime? updatedAt,  DateTime? completionClaimedAt)?  $default,) {final _that = this;
switch (_that) {
case _BidEntity() when $default != null:
return $default(_that.id,_that.jobId,_that.workerId,_that.userId,_that.status,_that.dateOfJob,_that.job,_that.worker,_that.createdAt,_that.updatedAt,_that.completionClaimedAt);case _:
  return null;

}
}

}

/// @nodoc


class _BidEntity extends BidEntity {
  const _BidEntity({required this.id, required this.jobId, required this.workerId, required this.userId, required this.status, required this.dateOfJob, this.job, this.worker, this.createdAt, this.updatedAt, this.completionClaimedAt}): super._();
  

@override final  String id;
@override final  String jobId;
@override final  String workerId;
@override final  String userId;
@override final  String status;
@override final  DateTime dateOfJob;
@override final  JobEntity? job;
@override final  WorkerEntity? worker;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;
// Phase 1 — dual-confirmation tracking
@override final  DateTime? completionClaimedAt;

/// Create a copy of BidEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BidEntityCopyWith<_BidEntity> get copyWith => __$BidEntityCopyWithImpl<_BidEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BidEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.jobId, jobId) || other.jobId == jobId)&&(identical(other.workerId, workerId) || other.workerId == workerId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.status, status) || other.status == status)&&(identical(other.dateOfJob, dateOfJob) || other.dateOfJob == dateOfJob)&&(identical(other.job, job) || other.job == job)&&(identical(other.worker, worker) || other.worker == worker)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.completionClaimedAt, completionClaimedAt) || other.completionClaimedAt == completionClaimedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,jobId,workerId,userId,status,dateOfJob,job,worker,createdAt,updatedAt,completionClaimedAt);

@override
String toString() {
  return 'BidEntity(id: $id, jobId: $jobId, workerId: $workerId, userId: $userId, status: $status, dateOfJob: $dateOfJob, job: $job, worker: $worker, createdAt: $createdAt, updatedAt: $updatedAt, completionClaimedAt: $completionClaimedAt)';
}


}

/// @nodoc
abstract mixin class _$BidEntityCopyWith<$Res> implements $BidEntityCopyWith<$Res> {
  factory _$BidEntityCopyWith(_BidEntity value, $Res Function(_BidEntity) _then) = __$BidEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String jobId, String workerId, String userId, String status, DateTime dateOfJob, JobEntity? job, WorkerEntity? worker, DateTime? createdAt, DateTime? updatedAt, DateTime? completionClaimedAt
});


@override $JobEntityCopyWith<$Res>? get job;@override $WorkerEntityCopyWith<$Res>? get worker;

}
/// @nodoc
class __$BidEntityCopyWithImpl<$Res>
    implements _$BidEntityCopyWith<$Res> {
  __$BidEntityCopyWithImpl(this._self, this._then);

  final _BidEntity _self;
  final $Res Function(_BidEntity) _then;

/// Create a copy of BidEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? jobId = null,Object? workerId = null,Object? userId = null,Object? status = null,Object? dateOfJob = null,Object? job = freezed,Object? worker = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? completionClaimedAt = freezed,}) {
  return _then(_BidEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,jobId: null == jobId ? _self.jobId : jobId // ignore: cast_nullable_to_non_nullable
as String,workerId: null == workerId ? _self.workerId : workerId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,dateOfJob: null == dateOfJob ? _self.dateOfJob : dateOfJob // ignore: cast_nullable_to_non_nullable
as DateTime,job: freezed == job ? _self.job : job // ignore: cast_nullable_to_non_nullable
as JobEntity?,worker: freezed == worker ? _self.worker : worker // ignore: cast_nullable_to_non_nullable
as WorkerEntity?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,completionClaimedAt: freezed == completionClaimedAt ? _self.completionClaimedAt : completionClaimedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of BidEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JobEntityCopyWith<$Res>? get job {
    if (_self.job == null) {
    return null;
  }

  return $JobEntityCopyWith<$Res>(_self.job!, (value) {
    return _then(_self.copyWith(job: value));
  });
}/// Create a copy of BidEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WorkerEntityCopyWith<$Res>? get worker {
    if (_self.worker == null) {
    return null;
  }

  return $WorkerEntityCopyWith<$Res>(_self.worker!, (value) {
    return _then(_self.copyWith(worker: value));
  });
}
}

// dart format on
