import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:domain/domain.dart';
import '../datasources/job_remote_datasource.dart';
import '../datasources/bid_job_datasource.dart';

/// Implementation of shared Job Repository
class JobRepositoryImpl extends JobRepository {
  final JobRemoteDataSource _remoteDataSource;
  final BidJobDataSource _bidJobDataSource;

  JobRepositoryImpl(this._remoteDataSource, this._bidJobDataSource);

  @override
  Future<Either<JobFailure, JobsResultEntity>> getJobs(
    JobQueryParams params,
  ) async {
    try {
      final response = await _remoteDataSource.getJobs(params);
      return Right(response.toEntity());
    } on DioException catch (e) {
      return Left(_handleDioException(e));
    } catch (e) {
      return Left(JobFailure.serverError(e.toString()));
    }
  }

  @override
  Future<Either<JobFailure, JobEntity>> getJobById(String id) async {
    try {
      final model = await _remoteDataSource.getJobById(id);
      return Right(model.toEntity());
    } on DioException catch (e) {
      return Left(_handleDioException(e));
    } catch (e) {
      return Left(JobFailure.serverError(e.toString()));
    }
  }

  @override
  Future<Either<JobFailure, Unit>> bidJob(BidJobParams params) async {
    try {
      await _bidJobDataSource.bidJob(params);
      return const Right(unit);
    } on DioException catch (e) {
      return Left(_handleDioException(e));
    } catch (e) {
      return Left(JobFailure.serverError(e.toString()));
    }
  }

  @override
  Future<Either<JobFailure, BidsResultEntity>> getMyBids({
    String? status,
    int page = 1,
    int limit = 10,
  }) async {
    try {
      final response = await _remoteDataSource.getMyBids(
        status: status,
        page: page,
        limit: limit,
      );
      return Right(response.toEntity());
    } on DioException catch (e) {
      return Left(_handleDioException(e));
    } catch (e) {
      return Left(JobFailure.serverError(e.toString()));
    }
  }

  @override
  Future<Either<JobFailure, BidsResultEntity>> getIncomingBids({
    String? jobId,
    String? status,
    int page = 1,
    int limit = 10,
  }) async {
    try {
      final response = await _remoteDataSource.getIncomingBids(
        jobId: jobId,
        status: status,
        page: page,
        limit: limit,
      );
      return Right(response.toEntity());
    } on DioException catch (e) {
      return Left(_handleDioException(e));
    } catch (e) {
      return Left(JobFailure.serverError(e.toString()));
    }
  }

  @override
  Future<Either<JobFailure, JobsResultEntity>> getMyJobs({
    int page = 1,
    int limit = 10,
  }) async {
    try {
      final response = await _remoteDataSource.getMyJobs(
        page: page,
        limit: limit,
      );
      return Right(response.toEntity());
    } on DioException catch (e) {
      return Left(_handleDioException(e));
    } catch (e) {
      return Left(JobFailure.serverError(e.toString()));
    }
  }

  /// Handle DioException and map to JobFailure
  JobFailure _handleDioException(DioException e) {
    if (e.response?.statusCode == 401) {
      return const JobFailure.unauthorized();
    }
    if (e.response?.statusCode == 404) {
      return const JobFailure.notFound();
    }
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout) {
      return const JobFailure.networkError();
    }
    final message = e.message ?? 'Terjadi kesalahan dari server';
    return JobFailure.serverError(message);
  }
}
