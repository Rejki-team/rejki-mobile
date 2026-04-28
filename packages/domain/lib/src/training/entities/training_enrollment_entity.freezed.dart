// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'training_enrollment_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TrainingEnrollmentEntity {

 String get id; String get trainingId; String get userId; String get status; String? get rejectionReason; String? get paymentProofUrl; TrainingEntity? get training; DateTime? get paymentDeadline; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of TrainingEnrollmentEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainingEnrollmentEntityCopyWith<TrainingEnrollmentEntity> get copyWith => _$TrainingEnrollmentEntityCopyWithImpl<TrainingEnrollmentEntity>(this as TrainingEnrollmentEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainingEnrollmentEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.trainingId, trainingId) || other.trainingId == trainingId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.status, status) || other.status == status)&&(identical(other.rejectionReason, rejectionReason) || other.rejectionReason == rejectionReason)&&(identical(other.paymentProofUrl, paymentProofUrl) || other.paymentProofUrl == paymentProofUrl)&&(identical(other.training, training) || other.training == training)&&(identical(other.paymentDeadline, paymentDeadline) || other.paymentDeadline == paymentDeadline)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,trainingId,userId,status,rejectionReason,paymentProofUrl,training,paymentDeadline,createdAt,updatedAt);

@override
String toString() {
  return 'TrainingEnrollmentEntity(id: $id, trainingId: $trainingId, userId: $userId, status: $status, rejectionReason: $rejectionReason, paymentProofUrl: $paymentProofUrl, training: $training, paymentDeadline: $paymentDeadline, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $TrainingEnrollmentEntityCopyWith<$Res>  {
  factory $TrainingEnrollmentEntityCopyWith(TrainingEnrollmentEntity value, $Res Function(TrainingEnrollmentEntity) _then) = _$TrainingEnrollmentEntityCopyWithImpl;
@useResult
$Res call({
 String id, String trainingId, String userId, String status, String? rejectionReason, String? paymentProofUrl, TrainingEntity? training, DateTime? paymentDeadline, DateTime? createdAt, DateTime? updatedAt
});


$TrainingEntityCopyWith<$Res>? get training;

}
/// @nodoc
class _$TrainingEnrollmentEntityCopyWithImpl<$Res>
    implements $TrainingEnrollmentEntityCopyWith<$Res> {
  _$TrainingEnrollmentEntityCopyWithImpl(this._self, this._then);

  final TrainingEnrollmentEntity _self;
  final $Res Function(TrainingEnrollmentEntity) _then;

/// Create a copy of TrainingEnrollmentEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? trainingId = null,Object? userId = null,Object? status = null,Object? rejectionReason = freezed,Object? paymentProofUrl = freezed,Object? training = freezed,Object? paymentDeadline = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,trainingId: null == trainingId ? _self.trainingId : trainingId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,rejectionReason: freezed == rejectionReason ? _self.rejectionReason : rejectionReason // ignore: cast_nullable_to_non_nullable
as String?,paymentProofUrl: freezed == paymentProofUrl ? _self.paymentProofUrl : paymentProofUrl // ignore: cast_nullable_to_non_nullable
as String?,training: freezed == training ? _self.training : training // ignore: cast_nullable_to_non_nullable
as TrainingEntity?,paymentDeadline: freezed == paymentDeadline ? _self.paymentDeadline : paymentDeadline // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of TrainingEnrollmentEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TrainingEntityCopyWith<$Res>? get training {
    if (_self.training == null) {
    return null;
  }

  return $TrainingEntityCopyWith<$Res>(_self.training!, (value) {
    return _then(_self.copyWith(training: value));
  });
}
}


/// Adds pattern-matching-related methods to [TrainingEnrollmentEntity].
extension TrainingEnrollmentEntityPatterns on TrainingEnrollmentEntity {
@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrainingEnrollmentEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrainingEnrollmentEntity() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrainingEnrollmentEntity value)  $default,){
final _that = this;
switch (_that) {
case _TrainingEnrollmentEntity():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrainingEnrollmentEntity value)?  $default,){
final _that = this;
switch (_that) {
case _TrainingEnrollmentEntity() when $default != null:
return $default(_that);case _:
  return null;

}
}
@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String trainingId,  String userId,  String status,  String? rejectionReason,  String? paymentProofUrl,  TrainingEntity? training,  DateTime? paymentDeadline,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrainingEnrollmentEntity() when $default != null:
return $default(_that.id,_that.trainingId,_that.userId,_that.status,_that.rejectionReason,_that.paymentProofUrl,_that.training,_that.paymentDeadline,_that.createdAt,_that.updatedAt);case _:
  return orElse();

}
}
@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String trainingId,  String userId,  String status,  String? rejectionReason,  String? paymentProofUrl,  TrainingEntity? training,  DateTime? paymentDeadline,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _TrainingEnrollmentEntity():
return $default(_that.id,_that.trainingId,_that.userId,_that.status,_that.rejectionReason,_that.paymentProofUrl,_that.training,_that.paymentDeadline,_that.createdAt,_that.updatedAt);case _:
  throw StateError('Unexpected subclass');

}
}
@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String trainingId,  String userId,  String status,  String? rejectionReason,  String? paymentProofUrl,  TrainingEntity? training,  DateTime? paymentDeadline,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _TrainingEnrollmentEntity() when $default != null:
return $default(_that.id,_that.trainingId,_that.userId,_that.status,_that.rejectionReason,_that.paymentProofUrl,_that.training,_that.paymentDeadline,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _TrainingEnrollmentEntity implements TrainingEnrollmentEntity {
  const _TrainingEnrollmentEntity({required this.id, required this.trainingId, required this.userId, required this.status, this.rejectionReason, this.paymentProofUrl, this.training, this.paymentDeadline, this.createdAt, this.updatedAt});


@override final  String id;
@override final  String trainingId;
@override final  String userId;
@override final  String status;
@override final  String? rejectionReason;
@override final  String? paymentProofUrl;
@override final  TrainingEntity? training;
@override final  DateTime? paymentDeadline;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of TrainingEnrollmentEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrainingEnrollmentEntityCopyWith<_TrainingEnrollmentEntity> get copyWith => __$TrainingEnrollmentEntityCopyWithImpl<_TrainingEnrollmentEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrainingEnrollmentEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.trainingId, trainingId) || other.trainingId == trainingId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.status, status) || other.status == status)&&(identical(other.rejectionReason, rejectionReason) || other.rejectionReason == rejectionReason)&&(identical(other.paymentProofUrl, paymentProofUrl) || other.paymentProofUrl == paymentProofUrl)&&(identical(other.training, training) || other.training == training)&&(identical(other.paymentDeadline, paymentDeadline) || other.paymentDeadline == paymentDeadline)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,trainingId,userId,status,rejectionReason,paymentProofUrl,training,paymentDeadline,createdAt,updatedAt);

@override
String toString() {
  return 'TrainingEnrollmentEntity(id: $id, trainingId: $trainingId, userId: $userId, status: $status, rejectionReason: $rejectionReason, paymentProofUrl: $paymentProofUrl, training: $training, paymentDeadline: $paymentDeadline, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$TrainingEnrollmentEntityCopyWith<$Res> implements $TrainingEnrollmentEntityCopyWith<$Res> {
  factory _$TrainingEnrollmentEntityCopyWith(_TrainingEnrollmentEntity value, $Res Function(_TrainingEnrollmentEntity) _then) = __$TrainingEnrollmentEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String trainingId, String userId, String status, String? rejectionReason, String? paymentProofUrl, TrainingEntity? training, DateTime? paymentDeadline, DateTime? createdAt, DateTime? updatedAt
});


@override $TrainingEntityCopyWith<$Res>? get training;

}
/// @nodoc
class __$TrainingEnrollmentEntityCopyWithImpl<$Res>
    implements _$TrainingEnrollmentEntityCopyWith<$Res> {
  __$TrainingEnrollmentEntityCopyWithImpl(this._self, this._then);

  final _TrainingEnrollmentEntity _self;
  final $Res Function(_TrainingEnrollmentEntity) _then;

/// Create a copy of TrainingEnrollmentEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? trainingId = null,Object? userId = null,Object? status = null,Object? rejectionReason = freezed,Object? paymentProofUrl = freezed,Object? training = freezed,Object? paymentDeadline = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_TrainingEnrollmentEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,trainingId: null == trainingId ? _self.trainingId : trainingId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,rejectionReason: freezed == rejectionReason ? _self.rejectionReason : rejectionReason // ignore: cast_nullable_to_non_nullable
as String?,paymentProofUrl: freezed == paymentProofUrl ? _self.paymentProofUrl : paymentProofUrl // ignore: cast_nullable_to_non_nullable
as String?,training: freezed == training ? _self.training : training // ignore: cast_nullable_to_non_nullable
as TrainingEntity?,paymentDeadline: freezed == paymentDeadline ? _self.paymentDeadline : paymentDeadline // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of TrainingEnrollmentEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TrainingEntityCopyWith<$Res>? get training {
    if (_self.training == null) {
    return null;
  }

  return $TrainingEntityCopyWith<$Res>(_self.training!, (value) {
    return _then(_self.copyWith(training: value));
  });
}
}

// dart format on
