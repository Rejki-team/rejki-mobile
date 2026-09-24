import 'package:network/network.dart';

abstract class HelperRemoteDataSource {
  Future<Map<String, List<String>>> getEnums();
}

class HelperRemoteDataSourceImpl implements HelperRemoteDataSource {
  final DioClient _dioClient;

  HelperRemoteDataSourceImpl(this._dioClient);

  @override
  Future<Map<String, List<String>>> getEnums() async {
    final response = await _dioClient.get(ApiConfig.enums);
    final data = response.data['data'] as Map<String, dynamic>;

    // Map JSON object to Map<String, List<String>>
    return data.map((key, value) {
      final list = (value as List).map((e) => e.toString()).toList();
      return MapEntry(key, list);
    });
  }
}
