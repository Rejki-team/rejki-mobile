import 'package:freezed_annotation/freezed_annotation.dart';
import 'job_entity.dart';
import '../../worker/entities/worker_entity.dart';

part 'bid_entity.freezed.dart';

@freezed
abstract class BidEntity with _$BidEntity {
  const BidEntity._();

  const factory BidEntity({
    required String id,
    required String jobId,
    required String workerId,
    required String userId,
    required String status,
    required DateTime dateOfJob,
    JobEntity? job,
    WorkerEntity? worker,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _BidEntity;
}
