import 'package:freezed_annotation/freezed_annotation.dart';

part 'worker_detail_model.freezed.dart';

@freezed
abstract class WorkerDetailModel with _$WorkerDetailModel {
  const factory WorkerDetailModel({
    required String id,
    required String name,
    required String adCode,
    String? posterId,
    required String statusLabel,
    required int age,
    required double rating,
    required int reviewCount,
    required String wageText,
    String? avatarUrl,
    required String address,
    required List<String> workExperiences,
    required String workingHours,
    required String phoneNumber,
    required List<String> badges,
  }) = _WorkerDetailModel;
}
