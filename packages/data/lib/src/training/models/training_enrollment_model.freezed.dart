// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'training_enrollment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TrainingEnrollmentModel {

 String get id;@JsonKey(name: 'training_id') String get trainingId;@JsonKey(name: 'user_id') String get userId; String get status;@JsonKey(name: 'rejection_reason') String? get rejectionReason;@JsonKey(name: 'payment_proof_url') String? get paymentProofUrl;@JsonKey(name: 'payment_deadline') DateTime? get paymentDeadline; TrainingModel? get training;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'updated_at') DateTime? get updatedAt;
/// Create a copy of TrainingEnrollmentModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainingEnrollmentModelCopyWith<TrainingEnrollmentModel> get copyWith => _$TrainingEnrollmentModelCopyWithImpl<TrainingEnrollmentModel>(this as TrainingEnrollmentModel, _$identity);

  /// Serializes this TrainingEnrollmentModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainingEnrollmentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.trainingId, trainingId) || other.trainingId == trainingId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.status, status) || other.status == status)&&(identical(other.rejectionReason, rejectionReason) || other.rejectionReason == rejectionReason)&&(identical(other.paymentProofUrl, paymentProofUrl) || other.paymentProofUrl == paymentProofUrl)&&(identical(other.paymentDeadline, paymentDeadline) || other.paymentDeadline == paymentDeadline)&&(identical(other.training, training) || other.training == training)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,trainingId,userId,status,rejectionReason,paymentProofUrl,paymentDeadline,training,createdAt,updatedAt);

@override
String toString() {
  return 'TrainingEnrollmentModel(id: $id, trainingId: $trainingId, userId: $userId, status: $status, rejectionReason: $rejectionReason, paymentProofUrl: $paymentProofUrl, paymentDeadline: $paymentDeadline, training: $training, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $TrainingEnrollmentModelCopyWith<$Res>  {
  factory $TrainingEnrollmentModelCopyWith(TrainingEnrollmentModel value, $Res Function(TrainingEnrollmentModel) _then) = _$TrainingEnrollmentModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'training_id') String trainingId,@JsonKey(name: 'user_id') String userId, String status,@JsonKey(name: 'rejection_reason') String? rejectionReason,@JsonKey(name: 'payment_proof_url') String? paymentProofUrl,@JsonKey(name: 'payment_deadline') DateTime? paymentDeadline, TrainingModel? training,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});


$TrainingModelCopyWith<$Res>? get training;

}
/// @nodoc
class _$TrainingEnrollmentModelCopyWithImpl<$Res>
    implements $TrainingEnrollmentModelCopyWith<$Res> {
  _$TrainingEnrollmentModelCopyWithImpl(this._self, this._then);

  final TrainingEnrollmentModel _self;
  final $Res Function(TrainingEnrollmentModel) _then;

/// Create a copy of TrainingEnrollmentModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? trainingId = null,Object? userId = null,Object? status = null,Object? rejectionReason = freezed,Object? paymentProofUrl = freezed,Object? paymentDeadline = freezed,Object? training = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,trainingId: null == trainingId ? _self.trainingId : trainingId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,rejectionReason: freezed == rejectionReason ? _self.rejectionReason : rejectionReason // ignore: cast_nullable_to_non_nullable
as String?,paymentProofUrl: freezed == paymentProofUrl ? _self.paymentProofUrl : paymentProofUrl // ignore: cast_nullable_to_non_nullable
as String?,paymentDeadline: freezed == paymentDeadline ? _self.paymentDeadline : paymentDeadline // ignore: cast_nullable_to_non_nullable
as DateTime?,training: freezed == training ? _self.training : training // ignore: cast_nullable_to_non_nullable
as TrainingModel?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of TrainingEnrollmentModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TrainingModelCopyWith<$Res>? get training {
    if (_self.training == null) {
    return null;
  }

  return $TrainingModelCopyWith<$Res>(_self.training!, (value) {
    return _then(_self.copyWith(training: value));
  });
}
}


/// Adds pattern-matching-related methods to [TrainingEnrollmentModel].
extension TrainingEnrollmentModelPatterns on TrainingEnrollmentModel {
/// A variant of `map` that fallback to returning `orElse`.
@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrainingEnrollmentModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrainingEnrollmentModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrainingEnrollmentModel value)  $default,){
final _that = this;
switch (_that) {
case _TrainingEnrollmentModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrainingEnrollmentModel value)?  $default,){
final _that = this;
switch (_that) {
case _TrainingEnrollmentModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'training_id')  String trainingId, @JsonKey(name: 'user_id')  String userId,  String status, @JsonKey(name: 'rejection_reason')  String? rejectionReason, @JsonKey(name: 'payment_proof_url')  String? paymentProofUrl, @JsonKey(name: 'payment_deadline')  DateTime? paymentDeadline,  TrainingModel? training, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrainingEnrollmentModel() when $default != null:
return $default(_that.id,_that.trainingId,_that.userId,_that.status,_that.rejectionReason,_that.paymentProofUrl,_that.paymentDeadline,_that.training,_that.createdAt,_that.updatedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'training_id')  String trainingId, @JsonKey(name: 'user_id')  String userId,  String status, @JsonKey(name: 'rejection_reason')  String? rejectionReason, @JsonKey(name: 'payment_proof_url')  String? paymentProofUrl, @JsonKey(name: 'payment_deadline')  DateTime? paymentDeadline,  TrainingModel? training, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _TrainingEnrollmentModel():
return $default(_that.id,_that.trainingId,_that.userId,_that.status,_that.rejectionReason,_that.paymentProofUrl,_that.paymentDeadline,_that.training,_that.createdAt,_that.updatedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'training_id')  String trainingId, @JsonKey(name: 'user_id')  String userId,  String status, @JsonKey(name: 'rejection_reason')  String? rejectionReason, @JsonKey(name: 'payment_proof_url')  String? paymentProofUrl, @JsonKey(name: 'payment_deadline')  DateTime? paymentDeadline,  TrainingModel? training, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _TrainingEnrollmentModel() when $default != null:
return $default(_that.id,_that.trainingId,_that.userId,_that.status,_that.rejectionReason,_that.paymentProofUrl,_that.paymentDeadline,_that.training,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrainingEnrollmentModel extends TrainingEnrollmentModel {
  const _TrainingEnrollmentModel({required this.id, @JsonKey(name: 'training_id') required this.trainingId, @JsonKey(name: 'user_id') required this.userId, required this.status, @JsonKey(name: 'rejection_reason') this.rejectionReason, @JsonKey(name: 'payment_proof_url') this.paymentProofUrl, @JsonKey(name: 'payment_deadline') this.paymentDeadline, this.training, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt}): super._();
  factory _TrainingEnrollmentModel.fromJson(Map<String, dynamic> json) => _$TrainingEnrollmentModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'training_id') final  String trainingId;
@override@JsonKey(name: 'user_id') final  String userId;
@override final  String status;
@override@JsonKey(name: 'rejection_reason') final  String? rejectionReason;
@override@JsonKey(name: 'payment_proof_url') final  String? paymentProofUrl;
@override@JsonKey(name: 'payment_deadline') final  DateTime? paymentDeadline;
@override final  TrainingModel? training;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;

/// Create a copy of TrainingEnrollmentModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrainingEnrollmentModelCopyWith<_TrainingEnrollmentModel> get copyWith => __$TrainingEnrollmentModelCopyWithImpl<_TrainingEnrollmentModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrainingEnrollmentModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrainingEnrollmentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.trainingId, trainingId) || other.trainingId == trainingId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.status, status) || other.status == status)&&(identical(other.rejectionReason, rejectionReason) || other.rejectionReason == rejectionReason)&&(identical(other.paymentProofUrl, paymentProofUrl) || other.paymentProofUrl == paymentProofUrl)&&(identical(other.paymentDeadline, paymentDeadline) || other.paymentDeadline == paymentDeadline)&&(identical(other.training, training) || other.training == training)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,trainingId,userId,status,rejectionReason,paymentProofUrl,paymentDeadline,training,createdAt,updatedAt);

@override
String toString() {
  return 'TrainingEnrollmentModel(id: $id, trainingId: $trainingId, userId: $userId, status: $status, rejectionReason: $rejectionReason, paymentProofUrl: $paymentProofUrl, paymentDeadline: $paymentDeadline, training: $training, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$TrainingEnrollmentModelCopyWith<$Res> implements $TrainingEnrollmentModelCopyWith<$Res> {
  factory _$TrainingEnrollmentModelCopyWith(_TrainingEnrollmentModel value, $Res Function(_TrainingEnrollmentModel) _then) = __$TrainingEnrollmentModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'training_id') String trainingId,@JsonKey(name: 'user_id') String userId, String status,@JsonKey(name: 'rejection_reason') String? rejectionReason,@JsonKey(name: 'payment_proof_url') String? paymentProofUrl,@JsonKey(name: 'payment_deadline') DateTime? paymentDeadline, TrainingModel? training,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});


@override $TrainingModelCopyWith<$Res>? get training;

}
/// @nodoc
class __$TrainingEnrollmentModelCopyWithImpl<$Res>
    implements _$TrainingEnrollmentModelCopyWith<$Res> {
  __$TrainingEnrollmentModelCopyWithImpl(this._self, this._then);

  final _TrainingEnrollmentModel _self;
  final $Res Function(_TrainingEnrollmentModel) _then;

/// Create a copy of TrainingEnrollmentModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? trainingId = null,Object? userId = null,Object? status = null,Object? rejectionReason = freezed,Object? paymentProofUrl = freezed,Object? paymentDeadline = freezed,Object? training = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_TrainingEnrollmentModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,trainingId: null == trainingId ? _self.trainingId : trainingId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,rejectionReason: freezed == rejectionReason ? _self.rejectionReason : rejectionReason // ignore: cast_nullable_to_non_nullable
as String?,paymentProofUrl: freezed == paymentProofUrl ? _self.paymentProofUrl : paymentProofUrl // ignore: cast_nullable_to_non_nullable
as String?,paymentDeadline: freezed == paymentDeadline ? _self.paymentDeadline : paymentDeadline // ignore: cast_nullable_to_non_nullable
as DateTime?,training: freezed == training ? _self.training : training // ignore: cast_nullable_to_non_nullable
as TrainingModel?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of TrainingEnrollmentModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TrainingModelCopyWith<$Res>? get training {
    if (_self.training == null) {
    return null;
  }

  return $TrainingModelCopyWith<$Res>(_self.training!, (value) {
    return _then(_self.copyWith(training: value));
  });
}
}

// dart format on
