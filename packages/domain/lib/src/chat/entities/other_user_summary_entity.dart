import 'package:freezed_annotation/freezed_annotation.dart';

part 'other_user_summary_entity.freezed.dart';

/// Ringkasan lawan bicara di satu percakapan (P4.10) — username+avatar via
/// `UserClient` batch di backend, bisa null bila profil belum dilengkapi.
@freezed
abstract class OtherUserSummaryEntity with _$OtherUserSummaryEntity {
  const factory OtherUserSummaryEntity({
    required String id,
    required String username,
    String? avatar,
  }) = _OtherUserSummaryEntity;
}
