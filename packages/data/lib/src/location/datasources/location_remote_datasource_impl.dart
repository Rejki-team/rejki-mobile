import 'package:network/network.dart';
import '../models/location_model.dart';
import 'location_remote_datasource.dart';

/// Implementation of Location Remote Data Source
///
/// Uses DioClient for proper authentication and error handling.
class LocationRemoteDataSourceImpl implements LocationRemoteDataSource {
  final DioClient _dioClient;

  LocationRemoteDataSourceImpl(this._dioClient);

  @override
  Future<List<LocationModel>> getProvinces() async {
    final response = await _dioClient.get(ApiConfig.provinces);
    final data = response.data['data'] as List<dynamic>;
    return data
        .map((json) => LocationModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<List<LocationModel>> getRegencies(String provinceId) async {
    final response = await _dioClient.get(
      ApiConfig.regenciesByProvince(provinceId),
    );
    final data = response.data['data'] as List<dynamic>;
    return data
        .map((json) => LocationModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<List<LocationModel>> getDistricts(String regencyId) async {
    final response = await _dioClient.get(
      ApiConfig.districtsByRegency(regencyId),
    );
    final data = response.data['data'] as List<dynamic>;
    return data
        .map((json) => LocationModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<List<LocationModel>> getVillages(String districtId) async {
    final response = await _dioClient.get(
      ApiConfig.villagesByDistrict(districtId),
    );
    final data = response.data['data'] as List<dynamic>;
    return data
        .map((json) => LocationModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}
