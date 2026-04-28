import 'package:freezed_annotation/freezed_annotation.dart';
import 'training_image_entity.dart';

part 'training_entity.freezed.dart';

@freezed
abstract class TrainingEntity with _$TrainingEntity {
  const TrainingEntity._();

  const factory TrainingEntity({
    required String id,
    required String title,
    required String description,
    required String companyName,
    required String locationAddress,
    required String dateOfTraining,
    required int feePerPerson,
    required String status,
    required String userId,
    String? adCode,
    String? email,
    String? role,
    String? province,
    String? city,
    String? district,
    String? village,
    String? certificate,
    @Default('') String bankName,
    @Default('') String bankAccountNumber,
    @Default('') String bankAccountHolderName,
    @Default([]) List<String> facilities,
    @Default(0) int totalApprovedEnrollees,
    @Default([]) List<TrainingImageEntity> images,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _TrainingEntity;

  String? get firstImageUrl => images.isNotEmpty ? images.first.uriPath : null;

  String get formattedFee {
    if (feePerPerson == 0) return 'Gratis';
    final formatted = feePerPerson.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (match) => '${match[1]}.',
    );
    return 'Rp $formatted';
  }
}
