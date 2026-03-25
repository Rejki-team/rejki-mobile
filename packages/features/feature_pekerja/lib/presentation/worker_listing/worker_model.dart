import 'package:freezed_annotation/freezed_annotation.dart';

part 'worker_model.freezed.dart';

@freezed
abstract class WorkerModel with _$WorkerModel {
  const factory WorkerModel({
    required String id,
    required String name,
    required String adCode,
    @Default('Availble') String statusLabel,
    required int age,
    required double rating,
    required int reviewCount,
    required int wage,
    String? avatarUrl,
    @Default(false) bool isAd,
    // Ad specific fields
    String? adTitle,
    String? adDescription,
    String? adImageUrl,
  }) = _WorkerModel;
}
