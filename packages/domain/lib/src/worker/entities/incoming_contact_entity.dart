import 'package:freezed_annotation/freezed_annotation.dart';

part 'incoming_contact_entity.freezed.dart';

/// Public info of the employer who sent the contact request
@freezed
abstract class IncomingContactEmployerEntity
    with _$IncomingContactEmployerEntity {
  const factory IncomingContactEmployerEntity({
    required String id,
    required String fullName,
  }) = _IncomingContactEmployerEntity;
}

/// A single incoming contact request targeting a worker profile owned by the user
@freezed
abstract class IncomingContactEntity with _$IncomingContactEntity {
  const factory IncomingContactEntity({
    required String id,
    required String workerId,
    required String status,
    required String createdAt,
    required String updatedAt,
    required IncomingContactEmployerEntity employer,
  }) = _IncomingContactEntity;
}

/// Paginated result of incoming contact requests
@freezed
abstract class IncomingContactsResultEntity
    with _$IncomingContactsResultEntity {
  const factory IncomingContactsResultEntity({
    required List<IncomingContactEntity> contacts,
    required int totalRows,
    required int totalPages,
    required int currentPage,
    required bool hasNext,
  }) = _IncomingContactsResultEntity;
}
