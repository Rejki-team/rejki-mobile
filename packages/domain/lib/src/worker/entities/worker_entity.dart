import 'package:freezed_annotation/freezed_annotation.dart';

part 'worker_entity.freezed.dart';

/// Represents a simple worker overview (e.g. for list/search)
@freezed
abstract class WorkerEntity with _$WorkerEntity {
  const factory WorkerEntity({
    required String id,
    required String name,
    required String adCode,
    required int age,
    required double rating,
    required int reviewCount,
    required int wage,
    String? statusLabel,
    String? avatarUrl,
    @Default(false) bool isAd,
    String? adTitle,
    String? adImageUrl,
    
    // New fields for Detail Worker API
    String? education,
    String? available,
    bool? isNegotiable,
    String? phoneNumber,
    String? workExperience,
    String? address,
    double? latitude,
    double? longitude,
  }) = _WorkerEntity;
}
