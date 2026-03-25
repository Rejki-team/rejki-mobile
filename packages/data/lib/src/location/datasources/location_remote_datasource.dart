import '../models/location_model.dart';

/// Location Remote Data Source (Data Layer)
///
/// Interface for fetching location data from remote API.
abstract class LocationRemoteDataSource {
  /// Fetch all provinces
  ///
  /// Returns a list of provinces (provinsi) from the API
  Future<List<LocationModel>> getProvinces();

  /// Fetch regencies/cities by province ID
  ///
  /// [provinceId] - The ID of the province
  /// Returns a list of regencies/cities (kabupaten/kota)
  Future<List<LocationModel>> getRegencies(String provinceId);

  /// Fetch districts by regency ID
  ///
  /// [regencyId] - The ID of the regency/city
  /// Returns a list of districts (kecamatan)
  Future<List<LocationModel>> getDistricts(String regencyId);

  /// Fetch villages by district ID
  ///
  /// [districtId] - The ID of the district
  /// Returns a list of villages (kelurahan/desa)
  Future<List<LocationModel>> getVillages(String districtId);
}
