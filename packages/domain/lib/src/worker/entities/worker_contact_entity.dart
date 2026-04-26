import 'package:freezed_annotation/freezed_annotation.dart';
import 'worker_entity.dart';

part 'worker_contact_entity.freezed.dart';

/// Represents a contact made by the user to a worker
@freezed
abstract class WorkerContactEntity with _$WorkerContactEntity {
  const factory WorkerContactEntity({
    required String id,
    required String status,
    required String workerId,
    required WorkerEntity worker,
    required String createdAt,
    required String updatedAt,
  }) = _WorkerContactEntity;
}
