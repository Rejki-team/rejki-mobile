import 'package:fpdart/fpdart.dart';
import '../entities/location_entity.dart';
import '../failures/location_failure.dart';
import '../repositories/location_repository.dart';

/// Use case for getting villages by district
///
/// Returns a list of villages (kelurahan/desa) in the specified district.
class GetVillagesUseCase {
  final LocationRepository _repository;

  GetVillagesUseCase(this._repository);

  /// Execute the use case
  ///
  /// [districtId] - The ID of the district to get villages for
  Future<Either<LocationFailure, List<LocationEntity>>> call(
    String districtId,
  ) {
    return _repository.getVillages(districtId);
  }
}
