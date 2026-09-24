import 'package:freezed_annotation/freezed_annotation.dart';

part 'rating_aggregate_entity.freezed.dart';

/// Agregasi rating satu user (F-17, PRD §5.15) — dipakai di halaman detail
/// Iklan Pekerjaan (rating pemberi kerja), detail/kartu Iklan Pekerja (rating
/// pekerja), dan "rating keaktifan" di halaman Profil. Module-agnostic di
/// backend (`GET /rating/profil/{userId}`), sama untuk ketiga konteks ini.
@freezed
abstract class RatingAggregateEntity with _$RatingAggregateEntity {
  const factory RatingAggregateEntity({
    required String userId,
    required double average,
    required int count,
  }) = _RatingAggregateEntity;

  factory RatingAggregateEntity.empty(String userId) =>
      RatingAggregateEntity(userId: userId, average: 0.0, count: 0);
}
