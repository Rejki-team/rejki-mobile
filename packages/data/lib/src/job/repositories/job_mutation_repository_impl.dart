import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:network/network.dart';
import 'package:domain/domain.dart';
import '../datasources/job_mutation_datasource.dart';

import 'package:injectable/injectable.dart';

/// Implementation of JobMutationRepository
///
/// Handles CREATE operations for jobs using the mutation data source.
@LazySingleton(as: JobMutationRepository)
class JobMutationRepositoryImpl implements JobMutationRepository {
  final JobMutationDataSource remoteDataSource;

  JobMutationRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<JobFailure, JobEntity>> createJob(
    CreateJobParams params,
  ) async {
    try {
      debugPrint('📤 [JobMutationRepository] Calling createJob...');
      final model = await remoteDataSource.createJob(params);
      debugPrint('✅ [JobMutationRepository] Job created successfully!');
      debugPrint('📦 [JobMutationRepository] Job ID: ${model.id}');

      // Convert shared JobModel to shared JobEntity
      final entity = model.toEntity();
      debugPrint(
        '✅ [JobMutationRepository] Converted to entity, returning Right...',
      );
      return Right(entity);
    } on DioException catch (e) {
      // Use ApiError for consistent error handling
      final apiError = ApiError.fromDioException(e);
      debugPrint('❌ [JobMutationRepository] ApiError: $apiError');

      // Map ApiError to JobFailure
      return Left(_mapApiErrorToJobFailure(apiError));
    } catch (e, stackTrace) {
      debugPrint('❌ [JobMutationRepository] Unexpected error: $e');
      debugPrint('❌ [JobMutationRepository] StackTrace: $stackTrace');
      return Left(JobFailure.serverError(e.toString()));
    }
  }

  @override
  Future<Either<JobFailure, Unit>> updateBidStatus({
    required String jobId,
    required String bidId,
    required String status,
  }) async {
    try {
      await remoteDataSource.updateBidStatus(
        jobId: jobId,
        bidId: bidId,
        status: status,
      );
      return const Right(unit);
    } on DioException catch (e) {
      final apiError = ApiError.fromDioException(e);
      return Left(_mapApiErrorToJobFailure(apiError));
    } catch (e) {
      return Left(JobFailure.serverError(e.toString()));
    }
  }

  @override
  Future<Either<JobFailure, Unit>> createJobReview({
    required String jobId,
    required int rating,
    required String review,
  }) async {
    try {
      await remoteDataSource.createJobReview(
        jobId: jobId,
        rating: rating,
        review: review,
      );
      return const Right(unit);
    } on DioException catch (e) {
      final apiError = ApiError.fromDioException(e);
      return Left(_mapApiErrorToJobFailure(apiError));
    } catch (e) {
      return Left(JobFailure.serverError(e.toString()));
    }
  }

  @override
  Future<Either<JobFailure, Unit>> ownerCompleteJob({
    required String jobId,
  }) async {
    try {
      await remoteDataSource.ownerCompleteJob(jobId: jobId);
      return const Right(unit);
    } on DioException catch (e) {
      final apiError = ApiError.fromDioException(e);
      return Left(_mapApiErrorToJobFailure(apiError));
    } catch (e) {
      return Left(JobFailure.serverError(e.toString()));
    }
  }

  @override
  Future<Either<JobFailure, Unit>> ownerConfirmBidComplete({
    required String jobId,
    required String bidId,
  }) async {
    try {
      await remoteDataSource.ownerConfirmBidComplete(
        jobId: jobId,
        bidId: bidId,
      );
      return const Right(unit);
    } on DioException catch (e) {
      final apiError = ApiError.fromDioException(e);
      return Left(_mapApiErrorToJobFailure(apiError));
    } catch (e) {
      return Left(JobFailure.serverError(e.toString()));
    }
  }

  @override
  Future<Either<JobFailure, Unit>> disputeBid({
    required String jobId,
    required String bidId,
    required String reason,
  }) async {
    try {
      await remoteDataSource.disputeBid(
        jobId: jobId,
        bidId: bidId,
        reason: reason,
      );
      return const Right(unit);
    } on DioException catch (e) {
      final apiError = ApiError.fromDioException(e);
      return Left(_mapApiErrorToJobFailure(apiError));
    } catch (e) {
      return Left(JobFailure.serverError(e.toString()));
    }
  }

  @override
  Future<Either<JobFailure, Unit>> cancelBid({
    required String jobId,
    required String bidId,
    required String reason,
  }) async {
    try {
      await remoteDataSource.cancelBid(
        jobId: jobId,
        bidId: bidId,
        reason: reason,
      );
      return const Right(unit);
    } on DioException catch (e) {
      final apiError = ApiError.fromDioException(e);
      return Left(_mapApiErrorToJobFailure(apiError));
    } catch (e) {
      return Left(JobFailure.serverError(e.toString()));
    }
  }

  @override
  Future<Either<JobFailure, List<JobBidEvidenceEntity>>> uploadBidEvidence({
    required String jobId,
    required String bidId,
    required List<String> imagePaths,
  }) async {
    try {
      final models = await remoteDataSource.uploadBidEvidence(
        jobId: jobId,
        bidId: bidId,
        imagePaths: imagePaths,
      );
      return Right(models.map((m) => m.toEntity()).toList());
    } on DioException catch (e) {
      final apiError = ApiError.fromDioException(e);
      return Left(_mapApiErrorToJobFailure(apiError));
    } catch (e) {
      return Left(JobFailure.serverError(e.toString()));
    }
  }

  @override
  Future<Either<JobFailure, List<JobBidEvidenceEntity>>> getBidEvidence({
    required String jobId,
    required String bidId,
  }) async {
    try {
      final models = await remoteDataSource.getBidEvidence(
        jobId: jobId,
        bidId: bidId,
      );
      return Right(models.map((m) => m.toEntity()).toList());
    } on DioException catch (e) {
      final apiError = ApiError.fromDioException(e);
      return Left(_mapApiErrorToJobFailure(apiError));
    } catch (e) {
      return Left(JobFailure.serverError(e.toString()));
    }
  }

  /// Map ApiError to JobFailure
  JobFailure _mapApiErrorToJobFailure(ApiError error) {
    switch (error.type) {
      case ApiErrorType.network:
      case ApiErrorType.timeout:
        return const JobFailure.networkError();
      case ApiErrorType.unauthorized:
        return const JobFailure.unauthorized();
      case ApiErrorType.notFound:
        return const JobFailure.notFound();
      case ApiErrorType.server:
      case ApiErrorType.validation:
      case ApiErrorType.forbidden:
      case ApiErrorType.unknown:
        return JobFailure.serverError(error.message);
    }
  }
}
