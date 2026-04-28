import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain/domain.dart';
import 'training_model.dart';

part 'training_enrollment_model.freezed.dart';
part 'training_enrollment_model.g.dart';

@freezed
abstract class TrainingEnrollmentModel with _$TrainingEnrollmentModel {
  const TrainingEnrollmentModel._();

  const factory TrainingEnrollmentModel({
    required String id,
    @JsonKey(name: 'training_id') required String trainingId,
    @JsonKey(name: 'user_id') required String userId,
    required String status,
    @JsonKey(name: 'rejection_reason') String? rejectionReason,
    @JsonKey(name: 'payment_proof_url') String? paymentProofUrl,
    @JsonKey(name: 'payment_deadline') DateTime? paymentDeadline,
    TrainingModel? training,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _TrainingEnrollmentModel;

  factory TrainingEnrollmentModel.fromJson(Map<String, dynamic> json) =>
      _$TrainingEnrollmentModelFromJson(json);

  TrainingEnrollmentEntity toEntity() {
    return TrainingEnrollmentEntity(
      id: id,
      trainingId: trainingId,
      userId: userId,
      status: status,
      rejectionReason: rejectionReason,
      paymentProofUrl: paymentProofUrl,
      paymentDeadline: paymentDeadline,
      training: training?.toEntity(),
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
