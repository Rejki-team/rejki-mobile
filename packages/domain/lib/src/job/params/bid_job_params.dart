import 'package:freezed_annotation/freezed_annotation.dart';

part 'bid_job_params.freezed.dart';

/// Parameters for bidding/taking a job
@freezed
abstract class BidJobParams with _$BidJobParams {
  const factory BidJobParams({
    /// The ID of the job being bid on
    required String jobId,

    /// The ID of the worker taking the job
    required String workerId,

    /// The agreed or default date/time for the job
    /// Format: "2025-12-01 10:00:00"
    required String dateOfJob,
  }) = _BidJobParams;
}
