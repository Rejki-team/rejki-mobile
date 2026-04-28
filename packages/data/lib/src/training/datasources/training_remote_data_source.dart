import 'package:network/network.dart';
import 'package:domain/domain.dart';
import '../models/training_model.dart';
import '../models/training_enrollment_model.dart';

abstract class TrainingRemoteDataSource {
  Future<List<TrainingEnrollmentModel>> getMyTrainingEnrollments({
    String? status,
    int page = 1,
    int limit = 10,
  });

  Future<TrainingModel> getTrainingDetail(String id);

  Future<List<TrainingModel>> getTrainings({
    String? search,
    int page = 1,
    int limit = 10,
  });

  Future<List<TrainingModel>> getMyTrainings({
    int page = 1,
    int limit = 10,
  });

  Future<TrainingModel> createTraining(CreateTrainingParams params);

  Future<TrainingEnrollmentModel> enrollTraining(String trainingId);

  Future<TrainingEnrollmentModel> uploadPaymentProof({
    required String trainingId,
    required String enrollmentId,
    required String filePath,
  });

  Future<List<TrainingEnrollmentModel>> getEnrollmentsByTraining(
    String trainingId,
  );

  Future<void> submitTrainingBadge({
    required String trainingId,
    required String filePath,
    required String participantName,
  });
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
    final response = await _dioClient.dio.get(ApiConfig.trainingById(id));
    return TrainingModel.fromJson(response.data['data']);
  }

  @override
  Future<List<TrainingModel>> getTrainings({
    String? search,
    int page = 1,
    int limit = 10,
  }) async {
    final queryParameters = <String, dynamic>{
      'page': page,
      'limit': limit,
    };
    if (search != null && search.isNotEmpty) {
      queryParameters['search'] = search;
    }

    final response = await _dioClient.dio.get(
      ApiConfig.trainings,
      queryParameters: queryParameters,
    );

    final data = response.data['data']['data'] as List;
    return data.map((json) => TrainingModel.fromJson(json)).toList();
  }

  @override
  Future<List<TrainingModel>> getMyTrainings({
    int page = 1,
    int limit = 10,
  }) async {
    final response = await _dioClient.dio.get(
      ApiConfig.myTrainings,
      queryParameters: {'page': page, 'limit': limit},
    );

    final data = response.data['data']['data'] as List;
    return data.map((json) => TrainingModel.fromJson(json)).toList();
  }

  @override
  Future<TrainingModel> createTraining(CreateTrainingParams params) async {
    final formFields = <String, dynamic>{
      'title': params.title,
      'description': params.description,
      'company_name': params.companyName,
      'location_address': params.locationAddress,
      'date_of_training': params.dateOfTraining.toIso8601String(),
      'fee_per_person': params.feePerPerson.toString(),
    };

    for (final facility in params.facilities) {
      formFields['facilities'] = [...(formFields['facilities'] ?? []), facility];
    }

    final imageFiles = <MultipartFile>[];
    for (final path in params.imagePaths) {
      imageFiles.add(
        await MultipartFile.fromFile(path, filename: path.split('/').last),
      );
    }

    final formData = FormData.fromMap({
      ...formFields,
      if (imageFiles.isNotEmpty) 'images': imageFiles,
    });

    final response = await _dioClient.upload(
      ApiConfig.trainings,
      data: formData,
    );

    return TrainingModel.fromJson(response.data['data']);
  }

  @override
  Future<TrainingEnrollmentModel> enrollTraining(String trainingId) async {
    final response = await _dioClient.dio.post(
      ApiConfig.trainingEnroll(trainingId),
    );
    return TrainingEnrollmentModel.fromJson(response.data['data']);
  }

  @override
  Future<TrainingEnrollmentModel> uploadPaymentProof({
    required String trainingId,
    required String enrollmentId,
    required String filePath,
  }) async {
    final formData = FormData.fromMap({
      'payment_proof': await MultipartFile.fromFile(
        filePath,
        filename: filePath.split('/').last,
      ),
    });

    final response = await _dioClient.upload(
      ApiConfig.trainingPaymentProof(trainingId, enrollmentId),
      data: formData,
    );

    return TrainingEnrollmentModel.fromJson(response.data['data']);
  }

  @override
  Future<List<TrainingEnrollmentModel>> getEnrollmentsByTraining(
    String trainingId,
  ) async {
    final response = await _dioClient.dio.get(
      ApiConfig.trainingEnroll(trainingId),
    );
    final data = response.data['data']['data'] as List;
    return data.map((json) => TrainingEnrollmentModel.fromJson(json)).toList();
  }

  @override
  Future<void> submitTrainingBadge({
    required String trainingId,
    required String filePath,
    required String participantName,
  }) async {
    final formData = FormData.fromMap({
      'badge': await MultipartFile.fromFile(
        filePath,
        filename: filePath.split('/').last,
      ),
      'participant_name': participantName,
    });
    await _dioClient.upload(
      ApiConfig.trainingBadgeSubmit(trainingId),
      data: formData,
    );
  }
}
