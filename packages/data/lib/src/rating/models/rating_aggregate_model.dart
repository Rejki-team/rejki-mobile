import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain/domain.dart';

part 'rating_aggregate_model.freezed.dart';
part 'rating_aggregate_model.g.dart';

/// DTO untuk `RatingAggregateResponse` backend (`GET /rating/profil/{userId}`,
/// F-17, PRD §5.15, Kelompok 3 Fase 5.4).
@freezed
abstract class RatingAggregateModel with _$RatingAggregateModel {
  const RatingAggregateModel._();

  const factory RatingAggregateModel({
    @JsonKey(name: 'user_id') required String userId,
    @Default(0.0) double average,
    @Default(0) int count,
  }) = _RatingAggregateModel;

  factory RatingAggregateModel.fromJson(Map<String, dynamic> json) =>
      _$RatingAggregateModelFromJson(json);

  RatingAggregateEntity toEntity() =>
      RatingAggregateEntity(userId: userId, average: average, count: count);
}
