import 'package:network/network.dart';
import '../models/training_model.dart';
import '../models/training_enrollment_model.dart';

abstract class TrainingRemoteDataSource {
  Future<List<TrainingEnrollmentModel>> getMyTrainingEnrollments({
    String? status,
    int page = 1,
    int limit = 10,
  });

  Future<TrainingModel> getTrainingDetail(String id);
}

class TrainingRemoteDataSourceImpl implements TrainingRemoteDataSource {
  final DioClient _dioClient;

  TrainingRemoteDataSourceImpl(this._dioClient);

  @override
  Future<List<TrainingEnrollmentModel>> getMyTrainingEnrollments({
    String? status,
    int page = 1,
    int limit = 10,
  }) async {
    final queryParameters = <String, dynamic>{
      'page': page,
      'limit': limit,
    };
    if (status != null && status.isNotEmpty) {
      queryParameters['status'] = status;
    }

    final response = await _dioClient.dio.get(
      ApiConfig.trainingEnrollments,
      queryParameters: queryParameters,
    );

    final data = response.data['data']['data'] as List;
    return data.map((json) => TrainingEnrollmentModel.fromJson(json)).toList();
  }

  @override
  Future<TrainingModel> getTrainingDetail(String id) async {
    final response = await _dioClient.dio.get(
      ApiConfig.trainingById(id),
    );

    return TrainingModel.fromJson(response.data['data']);
  }
}
