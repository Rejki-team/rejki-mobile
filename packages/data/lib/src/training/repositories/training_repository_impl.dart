import 'package:fpdart/fpdart.dart';
import 'package:domain/domain.dart';
import '../datasources/training_remote_data_source.dart';
import 'package:dio/dio.dart';

class TrainingRepositoryImpl implements TrainingRepository {
  final TrainingRemoteDataSource remoteDataSource;

  TrainingRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<TrainingFailure, List<TrainingEnrollmentEntity>>> getMyTrainingEnrollments({
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
      final entities = models.map((model) => model.toEntity()).toList();
      return Right(entities);
    } on DioException catch (e) {
      return Left(TrainingFailure.serverError(e.response?.data['message'] ?? e.message));
    } catch (e) {
      return Left(TrainingFailure.serverError(e.toString()));
    }
  }

  @override
  Future<Either<TrainingFailure, TrainingEntity>> getTrainingDetail(String id) async {
    try {
      final model = await remoteDataSource.getTrainingDetail(id);
      return Right(model.toEntity());
    } on DioException catch (e) {
      return Left(TrainingFailure.serverError(e.response?.data['message'] ?? e.message));
    } catch (e) {
      return Left(TrainingFailure.serverError(e.toString()));
    }
  }
}
