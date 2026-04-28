import 'package:freezed_annotation/freezed_annotation.dart';
import 'training_entity.dart';

part 'training_enrollment_entity.freezed.dart';

@freezed
abstract class TrainingEnrollmentEntity with _$TrainingEnrollmentEntity {
  const factory TrainingEnrollmentEntity({
    required String id,
    required String trainingId,
    required String userId,
    required String status,
    String? rejectionReason,
    String? paymentProofUrl,
    TrainingEntity? training,
    DateTime? paymentDeadline,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _TrainingEnrollmentEntity;
}
