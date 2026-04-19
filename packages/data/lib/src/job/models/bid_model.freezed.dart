// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bid_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BidModel {

 String get id;@JsonKey(name: 'job_id') String get jobId;@JsonKey(name: 'worker_id') String? get workerId;@JsonKey(name: 'user_id') String? get userId; String get status;@JsonKey(name: 'date_of_job') String get dateOfJob; JobModel? get job;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'updated_at') String? get updatedAt;
/// Create a copy of BidModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BidModelCopyWith<BidModel> get copyWith => _$BidModelCopyWithImpl<BidModel>(this as BidModel, _$identity);

  /// Serializes this BidModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BidModel&&(identical(other.id, id) || other.id == id)&&(identical(other.jobId, jobId) || other.jobId == jobId)&&(identical(other.workerId, workerId) || other.workerId == workerId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.status, status) || other.status == status)&&(identical(other.dateOfJob, dateOfJob) || other.dateOfJob == dateOfJob)&&(identical(other.job, job) || other.job == job)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,jobId,workerId,userId,status,dateOfJob,job,createdAt,updatedAt);

@override
String toString() {
  return 'BidModel(id: $id, jobId: $jobId, workerId: $workerId, userId: $userId, status: $status, dateOfJob: $dateOfJob, job: $job, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $BidModelCopyWith<$Res>  {
  factory $BidModelCopyWith(BidModel value, $Res Function(BidModel) _then) = _$BidModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'job_id') String jobId,@JsonKey(name: 'worker_id') String? workerId,@JsonKey(name: 'user_id') String? userId, String status,@JsonKey(name: 'date_of_job') String dateOfJob, JobModel? job,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt
});


$JobModelCopyWith<$Res>? get job;

}
/// @nodoc
class _$BidModelCopyWithImpl<$Res>
    implements $BidModelCopyWith<$Res> {
  _$BidModelCopyWithImpl(this._self, this._then);

  final BidModel _self;
  final $Res Function(BidModel) _then;

/// Create a copy of BidModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? jobId = null,Object? workerId = freezed,Object? userId = freezed,Object? status = null,Object? dateOfJob = null,Object? job = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,jobId: null == jobId ? _self.jobId : jobId // ignore: cast_nullable_to_non_nullable
as String,workerId: freezed == workerId ? _self.workerId : workerId // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,dateOfJob: null == dateOfJob ? _self.dateOfJob : dateOfJob // ignore: cast_nullable_to_non_nullable
as String,job: freezed == job ? _self.job : job // ignore: cast_nullable_to_non_nullable
as JobModel?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of BidModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JobModelCopyWith<$Res>? get job {
    if (_self.job == null) {
    return null;
  }

  return $JobModelCopyWith<$Res>(_self.job!, (value) {
    return _then(_self.copyWith(job: value));
  });
}
}


/// Adds pattern-matching-related methods to [BidModel].
extension BidModelPatterns on BidModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BidModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BidModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BidModel value)  $default,){
final _that = this;
switch (_that) {
case _BidModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BidModel value)?  $default,){
final _that = this;
switch (_that) {
case _BidModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'job_id')  String jobId, @JsonKey(name: 'worker_id')  String? workerId, @JsonKey(name: 'user_id')  String? userId,  String status, @JsonKey(name: 'date_of_job')  String dateOfJob,  JobModel? job, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BidModel() when $default != null:
return $default(_that.id,_that.jobId,_that.workerId,_that.userId,_that.status,_that.dateOfJob,_that.job,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'job_id')  String jobId, @JsonKey(name: 'worker_id')  String? workerId, @JsonKey(name: 'user_id')  String? userId,  String status, @JsonKey(name: 'date_of_job')  String dateOfJob,  JobModel? job, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _BidModel():
return $default(_that.id,_that.jobId,_that.workerId,_that.userId,_that.status,_that.dateOfJob,_that.job,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'job_id')  String jobId, @JsonKey(name: 'worker_id')  String? workerId, @JsonKey(name: 'user_id')  String? userId,  String status, @JsonKey(name: 'date_of_job')  String dateOfJob,  JobModel? job, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _BidModel() when $default != null:
return $default(_that.id,_that.jobId,_that.workerId,_that.userId,_that.status,_that.dateOfJob,_that.job,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BidModel extends BidModel {
  const _BidModel({required this.id, @JsonKey(name: 'job_id') required this.jobId, @JsonKey(name: 'worker_id') this.workerId, @JsonKey(name: 'user_id') this.userId, required this.status, @JsonKey(name: 'date_of_job') required this.dateOfJob, this.job, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt}): super._();
  factory _BidModel.fromJson(Map<String, dynamic> json) => _$BidModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'job_id') final  String jobId;
@override@JsonKey(name: 'worker_id') final  String? workerId;
@override@JsonKey(name: 'user_id') final  String? userId;
@override final  String status;
@override@JsonKey(name: 'date_of_job') final  String dateOfJob;
@override final  JobModel? job;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'updated_at') final  String? updatedAt;

/// Create a copy of BidModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BidModelCopyWith<_BidModel> get copyWith => __$BidModelCopyWithImpl<_BidModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BidModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BidModel&&(identical(other.id, id) || other.id == id)&&(identical(other.jobId, jobId) || other.jobId == jobId)&&(identical(other.workerId, workerId) || other.workerId == workerId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.status, status) || other.status == status)&&(identical(other.dateOfJob, dateOfJob) || other.dateOfJob == dateOfJob)&&(identical(other.job, job) || other.job == job)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,jobId,workerId,userId,status,dateOfJob,job,createdAt,updatedAt);

@override
String toString() {
  return 'BidModel(id: $id, jobId: $jobId, workerId: $workerId, userId: $userId, status: $status, dateOfJob: $dateOfJob, job: $job, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$BidModelCopyWith<$Res> implements $BidModelCopyWith<$Res> {
  factory _$BidModelCopyWith(_BidModel value, $Res Function(_BidModel) _then) = __$BidModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'job_id') String jobId,@JsonKey(name: 'worker_id') String? workerId,@JsonKey(name: 'user_id') String? userId, String status,@JsonKey(name: 'date_of_job') String dateOfJob, JobModel? job,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt
});


@override $JobModelCopyWith<$Res>? get job;

}
/// @nodoc
class __$BidModelCopyWithImpl<$Res>
    implements _$BidModelCopyWith<$Res> {
  __$BidModelCopyWithImpl(this._self, this._then);

  final _BidModel _self;
  final $Res Function(_BidModel) _then;

/// Create a copy of BidModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? jobId = null,Object? workerId = freezed,Object? userId = freezed,Object? status = null,Object? dateOfJob = null,Object? job = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_BidModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,jobId: null == jobId ? _self.jobId : jobId // ignore: cast_nullable_to_non_nullable
as String,workerId: freezed == workerId ? _self.workerId : workerId // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,dateOfJob: null == dateOfJob ? _self.dateOfJob : dateOfJob // ignore: cast_nullable_to_non_nullable
as String,job: freezed == job ? _self.job : job // ignore: cast_nullable_to_non_nullable
as JobModel?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of BidModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JobModelCopyWith<$Res>? get job {
    if (_self.job == null) {
    return null;
  }

  return $JobModelCopyWith<$Res>(_self.job!, (value) {
    return _then(_self.copyWith(job: value));
  });
}
}

// dart format on
