import 'package:fpdart/fpdart.dart';
import 'package:domain/domain.dart';
import 'package:dio/dio.dart';
import '../datasources/training_remote_data_source.dart';

class TrainingRepositoryImpl implements TrainingRepository {
  final TrainingRemoteDataSource remoteDataSource;

  TrainingRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<TrainingFailure, List<TrainingEnrollmentEntity>>>
  getMyTrainingEnrollments({
    String? status,
    int page = 1,
    int limit = 10,
  }) async {
    try {
      final models = await remoteDataSource.getMyTrainingEnrollments(
        status: status,
        page: page,
        limit: limit,
      );
      return Right(models.map((m) => m.toEntity()).toList());
    } on DioException catch (e) {
      return Left(
        TrainingFailure.serverError(e.response?.data['message'] ?? e.message),
      );
    } catch (e) {
      return Left(TrainingFailure.serverError(e.toString()));
    }
  }

  @override
  Future<Either<TrainingFailure, TrainingEntity>> getTrainingDetail(
    String id,
  ) async {
    try {
      final model = await remoteDataSource.getTrainingDetail(id);
      return Right(model.toEntity());
    } on DioException catch (e) {
      return Left(
        TrainingFailure.serverError(e.response?.data['message'] ?? e.message),
      );
    } catch (e) {
      return Left(TrainingFailure.serverError(e.toString()));
    }
  }

  @override
  Future<Either<TrainingFailure, List<TrainingEntity>>> getTrainings({
    String? search,
    int page = 1,
    int limit = 10,
    double? latitude,
    double? longitude,
  }) async {
    try {
      final models = await remoteDataSource.getTrainings(
        search: search,
        page: page,
        limit: limit,
        latitude: latitude,
        longitude: longitude,
      );
      return Right(models.map((m) => m.toEntity()).toList());
    } on DioException catch (e) {
      return Left(
        TrainingFailure.serverError(e.response?.data['message'] ?? e.message),
      );
    } catch (e) {
      return Left(TrainingFailure.serverError(e.toString()));
    }
  }

  @override
  Future<Either<TrainingFailure, List<TrainingEntity>>> getMyTrainings({
    int page = 1,
    int limit = 10,
  }) async {
    try {
      final models = await remoteDataSource.getMyTrainings(
        page: page,
        limit: limit,
      );
      return Right(models.map((m) => m.toEntity()).toList());
    } on DioException catch (e) {
      return Left(
        TrainingFailure.serverError(e.response?.data['message'] ?? e.message),
      );
    } catch (e) {
      return Left(TrainingFailure.serverError(e.toString()));
    }
  }

  @override
  Future<Either<TrainingFailure, TrainingEntity>> createTraining(
    CreateTrainingParams params,
  ) async {
    try {
      final model = await remoteDataSource.createTraining(params);
      return Right(model.toEntity());
    } on DioException catch (e) {
      return Left(
        TrainingFailure.serverError(e.response?.data['message'] ?? e.message),
      );
    } catch (e) {
      return Left(TrainingFailure.serverError(e.toString()));
    }
  }

  @override
  Future<Either<TrainingFailure, TrainingEnrollmentEntity>> enrollTraining(
    String trainingId,
  ) async {
    try {
      final model = await remoteDataSource.enrollTraining(trainingId);
      return Right(model.toEntity());
    } on DioException catch (e) {
      return Left(
        TrainingFailure.serverError(e.response?.data['message'] ?? e.message),
      );
    } catch (e) {
      return Left(TrainingFailure.serverError(e.toString()));
    }
  }

  @override
  Future<Either<TrainingFailure, TrainingEnrollmentEntity>> uploadPaymentProof({
    required String trainingId,
    required String enrollmentId,
    required String filePath,
  }) async {
    try {
      final model = await remoteDataSource.uploadPaymentProof(
        trainingId: trainingId,
        enrollmentId: enrollmentId,
        filePath: filePath,
      );
      return Right(model.toEntity());
    } on DioException catch (e) {
      return Left(
        TrainingFailure.serverError(e.response?.data['message'] ?? e.message),
      );
    } catch (e) {
      return Left(TrainingFailure.serverError(e.toString()));
    }
  }

  @override
  Future<Either<TrainingFailure, List<TrainingEnrollmentEntity>>>
  getEnrollmentsByTraining(String trainingId) async {
    try {
      final models = await remoteDataSource.getEnrollmentsByTraining(
        trainingId,
      );
      return Right(models.map((m) => m.toEntity()).toList());
    } on DioException catch (e) {
      return Left(
        TrainingFailure.serverError(e.response?.data['message'] ?? e.message),
      );
    } catch (e) {
      return Left(TrainingFailure.serverError(e.toString()));
    }
  }

  @override
  Future<Either<TrainingFailure, void>> submitTrainingBadge({
    required String trainingId,
    required String filePath,
    required String participantName,
  }) async {
    try {
      await remoteDataSource.submitTrainingBadge(
        trainingId: trainingId,
        filePath: filePath,
        participantName: participantName,
      );
      return const Right(null);
    } on DioException catch (e) {
      return Left(
        TrainingFailure.serverError(e.response?.data['message'] ?? e.message),
      );
    } catch (e) {
      return Left(TrainingFailure.serverError(e.toString()));
    }
  }
}
