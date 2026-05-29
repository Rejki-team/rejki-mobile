import 'package:fpdart/fpdart.dart';
import '../entities/job_bid_evidence_entity.dart';
import '../failures/job_failure.dart';
import '../repositories/job_mutation_repository.dart';

class UploadBidEvidenceUseCase {
  final JobMutationRepository _repository;

  UploadBidEvidenceUseCase(this._repository);

  Future<Either<JobFailure, List<JobBidEvidenceEntity>>> execute({
    required String jobId,
    required String bidId,
    required List<String> imagePaths,
  }) {
    return _repository.uploadBidEvidence(
      jobId: jobId,
      bidId: bidId,
      imagePaths: imagePaths,
    );
  }
}
