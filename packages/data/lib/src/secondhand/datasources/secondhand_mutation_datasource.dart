import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:network/network.dart';
import 'package:domain/domain.dart';
import '../models/secondhand_model.dart';

/// Abstract interface for secondhand WRITE operations.
abstract class SecondhandMutationDataSource {
  Future<SecondhandModel> createSecondhand(CreateSecondhandParams params);

  /// Claim a secondhand ad (POST /secondhands/{id}/claim).
  Future<void> claimSecondhand(String id);
}

/// Implementation using raw [Dio] for multipart/form-data uploads.
class SecondhandMutationDataSourceImpl implements SecondhandMutationDataSource {
  final Dio _dio;

  SecondhandMutationDataSourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<SecondhandModel> createSecondhand(
    CreateSecondhandParams params,
  ) async {
    final imageFiles = <MultipartFile>[];
    for (final image in params.images) {
      imageFiles.add(
        await MultipartFile.fromFile(
          image.path,
          filename: image.path.split('/').last,
        ),
      );
    }

    final formData = FormData.fromMap({
      'title': params.title,
      'description': params.description,
      'condition': params.condition,
      'amount': params.amount,
      'address': params.address,
      'province': params.province,
      'city': params.city,
      'subdistrict': params.subdistrict,
      'village': params.village,
      'images': imageFiles,
      if (params.latitude != null) 'latitude': params.latitude,
      if (params.longitude != null) 'longitude': params.longitude,
    });

    debugPrint('[SecondhandMutationDataSource] POST ${ApiConfig.secondhands}');

    final response = await _dio.post(
      ApiConfig.secondhands,
      data: formData,
      options: Options(contentType: 'multipart/form-data'),
    );

    final apiResponse = ApiResponse<Map<String, dynamic>>.fromJson(
      response.data as Map<String, dynamic>,
      fromJsonT: (data) => data as Map<String, dynamic>,
    );

    if (apiResponse.hasError) {
      throw Exception(apiResponse.errorMessage);
    }

    if (!apiResponse.hasData) {
      throw Exception('No data in response');
    }

    return SecondhandModel.fromJson(apiResponse.data!);
  }

  @override
  Future<void> claimSecondhand(String id) async {
    debugPrint('[SecondhandMutationDataSource] POST ${ApiConfig.secondhandClaim(id)}');
    await _dio.post(ApiConfig.secondhandClaim(id));
  }
}
