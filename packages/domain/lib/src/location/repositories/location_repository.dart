import 'package:fpdart/fpdart.dart';
import '../entities/location_entity.dart';
import '../failures/location_failure.dart';

/// Location Repository Interface (Domain Layer)
///
/// Defines operations for fetching location data (provinces, regencies,
/// districts, and villages) for cascading location selection.
abstract class LocationRepository {
  /// Get all provinces
  ///
  /// Returns a list of provinces (provinsi)
  Future<Either<LocationFailure, List<LocationEntity>>> getProvinces();

  /// Get regencies/cities by province ID
  ///
  /// [provinceId] - The ID of the province
  /// Returns a list of regencies/cities (kabupaten/kota) in the province
  Future<Either<LocationFailure, List<LocationEntity>>> getRegencies(
    String provinceId,
  );

  /// Get districts by regency ID
  ///
  /// [regencyId] - The ID of the regency/city
  /// Returns a list of districts (kecamatan) in the regency
  Future<Either<LocationFailure, List<LocationEntity>>> getDistricts(
    String regencyId,
  );

  /// Get villages by district ID
  ///
  /// [districtId] - The ID of the district
  /// Returns a list of villages (kelurahan/desa) in the district
  Future<Either<LocationFailure, List<LocationEntity>>> getVillages(
    String districtId,
  );
}
