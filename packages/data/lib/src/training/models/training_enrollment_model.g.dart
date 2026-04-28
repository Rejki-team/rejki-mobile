// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_enrollment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TrainingEnrollmentModel _$TrainingEnrollmentModelFromJson(
  Map<String, dynamic> json,
) => _TrainingEnrollmentModel(
  id: json['id'] as String,
  trainingId: json['training_id'] as String,
  userId: json['user_id'] as String,
  status: json['status'] as String,
  rejectionReason: json['rejection_reason'] as String?,
  paymentProofUrl: json['payment_proof_url'] as String?,
  paymentDeadline: json['payment_deadline'] == null
      ? null
      : DateTime.parse(json['payment_deadline'] as String),
  training: json['training'] == null
      ? null
      : TrainingModel.fromJson(json['training'] as Map<String, dynamic>),
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$TrainingEnrollmentModelToJson(
  _TrainingEnrollmentModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'training_id': instance.trainingId,
  'user_id': instance.userId,
  'status': instance.status,
  'rejection_reason': instance.rejectionReason,
  'payment_proof_url': instance.paymentProofUrl,
  'payment_deadline': instance.paymentDeadline?.toIso8601String(),
  'training': instance.training,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
};
