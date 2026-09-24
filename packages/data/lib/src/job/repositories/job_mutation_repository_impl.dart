import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:network/network.dart';
import 'package:domain/domain.dart';
import '../datasources/job_mutation_datasource.dart';

import 'package:injectable/injectable.dart';

/// Implementation of JobMutationRepository
///
/// Handles CREATE + Lamaran mutation operations using the mutation data source.
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

      final entity = model.toEntity();
      return Right(entity);
    } on DioException catch (e) {
      final apiError = ApiError.fromDioException(e);
      debugPrint('❌ [JobMutationRepository] ApiError: $apiError');
      return Left(_mapApiErrorToJobFailure(apiError));
    } catch (e, stackTrace) {
      debugPrint('❌ [JobMutationRepository] Unexpected error: $e');
      debugPrint('❌ [JobMutationRepository] StackTrace: $stackTrace');
      return Left(JobFailure.serverError(e.toString()));
    }
  }

  @override
  Future<Either<JobFailure, LamaranEntity>> reviewLamaran({
    required String iklanId,
    required String lamaranId,
    required bool approved,
  }) async {
    try {
      final model = await remoteDataSource.reviewLamaran(
        iklanId: iklanId,
        lamaranId: lamaranId,
        approved: approved,
      );
      return Right(model.toEntity());
    } on DioException catch (e) {
      final apiError = ApiError.fromDioException(e);
      return Left(_mapApiErrorToJobFailure(apiError));
    } catch (e) {
      return Left(JobFailure.serverError(e.toString()));
    }
  }

  @override
  Future<Either<JobFailure, LamaranEntity>> mulaiBekerja({
    required String iklanId,
    required String lamaranId,
    required double latitude,
    required double longitude,
  }) async {
    try {
      final model = await remoteDataSource.mulaiBekerja(
        iklanId: iklanId,
        lamaranId: lamaranId,
        latitude: latitude,
        longitude: longitude,
      );
      return Right(model.toEntity());
    } on DioException catch (e) {
      final apiError = ApiError.fromDioException(e);
      return Left(_mapApiErrorToJobFailure(apiError));
    } catch (e) {
      return Left(JobFailure.serverError(e.toString()));
    }
  }

  @override
  Future<Either<JobFailure, LamaranEntity>> tandaiSelesai({
    required String iklanId,
    required String lamaranId,
  }) async {
    try {
      final model = await remoteDataSource.tandaiSelesai(
        iklanId: iklanId,
        lamaranId: lamaranId,
      );
      return Right(model.toEntity());
    } on DioException catch (e) {
      final apiError = ApiError.fromDioException(e);
      return Left(_mapApiErrorToJobFailure(apiError));
    } catch (e) {
      return Left(JobFailure.serverError(e.toString()));
    }
  }

  @override
  Future<Either<JobFailure, LamaranEntity>> batalkanLamaran({
    required String iklanId,
    required String lamaranId,
    required String alasan,
  }) async {
    try {
      final model = await remoteDataSource.batalkanLamaran(
        iklanId: iklanId,
        lamaranId: lamaranId,
        alasan: alasan,
      );
      return Right(model.toEntity());
    } on DioException catch (e) {
      final apiError = ApiError.fromDioException(e);
      return Left(_mapApiErrorToJobFailure(apiError));
    } catch (e) {
      return Left(JobFailure.serverError(e.toString()));
    }
  }

  @override
  Future<Either<JobFailure, Unit>> createJobReview({
    required String iklanId,
    required String posterId,
    required int bintang,
    String? ulasan,
  }) async {
    try {
      await remoteDataSource.createJobReview(
        iklanId: iklanId,
        posterId: posterId,
        bintang: bintang,
        ulasan: ulasan,
      );
      return const Right(unit);
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
