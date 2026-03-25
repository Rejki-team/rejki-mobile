import 'package:fpdart/fpdart.dart';
import '../entities/location_entity.dart';
import '../failures/location_failure.dart';
import '../repositories/location_repository.dart';

/// Use case for getting all provinces
///
/// Returns a list of provinces (provinsi) from the API.
class GetProvincesUseCase {
  final LocationRepository _repository;

  GetProvincesUseCase(this._repository);

  /// Execute the use case
  Future<Either<LocationFailure, List<LocationEntity>>> call() {
    return _repository.getProvinces();
  }
}
