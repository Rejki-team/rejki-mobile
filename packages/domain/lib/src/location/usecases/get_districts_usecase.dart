import 'package:fpdart/fpdart.dart';
import '../entities/location_entity.dart';
import '../failures/location_failure.dart';
import '../repositories/location_repository.dart';

/// Use case for getting districts by regency
///
/// Returns a list of districts (kecamatan) in the specified regency/city.
class GetDistrictsUseCase {
  final LocationRepository _repository;

  GetDistrictsUseCase(this._repository);

  /// Execute the use case
  ///
  /// [regencyId] - The ID of the regency/city to get districts for
  Future<Either<LocationFailure, List<LocationEntity>>> call(String regencyId) {
    return _repository.getDistricts(regencyId);
  }
}
