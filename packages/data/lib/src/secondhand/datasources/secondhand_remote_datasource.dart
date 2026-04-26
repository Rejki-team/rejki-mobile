import 'package:domain/domain.dart';
import 'package:network/network.dart';
import '../models/secondhand_model.dart';
import '../models/secondhands_response_model.dart';

/// Abstract interface for secondhand READ operations.
abstract class SecondhandRemoteDataSource {
  Future<SecondhandsResponseModel> getSecondhand(SecondhandQueryParams params);

  /// Fetch a single secondhand ad by [id].
  Future<SecondhandModel> getSecondhandById(String id);

  /// Fetch a paginated list of secondhand ads claimed by the current user.
  Future<SecondhandsResponseModel> getMyClaimedSecondhand({
    required int page,
    required int limit,
  });
}

/// Implementation using [DioClient].
class SecondhandRemoteDataSourceImpl implements SecondhandRemoteDataSource {
  final DioClient _dioClient;

  SecondhandRemoteDataSourceImpl(this._dioClient);

  @override
  Future<SecondhandsResponseModel> getSecondhand(
    SecondhandQueryParams params,
  ) async {
    final queryParameters = <String, dynamic>{
      'page': params.page,
      'limit': params.limit,
      if (params.search.isNotEmpty) 'search': params.search,
      if (params.province.isNotEmpty) 'province': params.province,
      if (params.city.isNotEmpty) 'city': params.city,
      if (params.subdistrict.isNotEmpty) 'subdistrict': params.subdistrict,
      if (params.ward.isNotEmpty) 'ward': params.ward,
    };

    final response = await _dioClient.get(
      ApiConfig.secondhands,
      queryParameters: queryParameters,
    );

    final data = response.data['data'] as Map<String, dynamic>;
    return SecondhandsResponseModel.fromJson(data);
  }

  @override
  Future<SecondhandModel> getSecondhandById(String id) async {
    final response = await _dioClient.get(ApiConfig.secondhandById(id));
    final data = response.data['data'] as Map<String, dynamic>;
    return SecondhandModel.fromJson(data);
  }

  @override
  Future<SecondhandsResponseModel> getMyClaimedSecondhand({
    required int page,
    required int limit,
  }) async {
    final response = await _dioClient.get(
      ApiConfig.secondhandMyClaims,
      queryParameters: <String, dynamic>{
        'page': page,
        'limit': limit,
      },
    );
    final data = response.data['data'] as Map<String, dynamic>;
    return SecondhandsResponseModel.fromJson(data);
  }
}
