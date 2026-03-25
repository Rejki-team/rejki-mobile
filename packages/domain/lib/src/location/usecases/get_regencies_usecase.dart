import 'package:fpdart/fpdart.dart';
import '../entities/location_entity.dart';
import '../failures/location_failure.dart';
import '../repositories/location_repository.dart';

/// Use case for getting regencies/cities by province
///
/// Returns a list of regencies/cities (kabupaten/kota) in the specified province.
class GetRegenciesUseCase {
  final LocationRepository _repository;

  GetRegenciesUseCase(this._repository);

  /// Execute the use case
  ///
  /// [provinceId] - The ID of the province to get regencies for
  Future<Either<LocationFailure, List<LocationEntity>>> call(
    String provinceId,
  ) {
    return _repository.getRegencies(provinceId);
  }
}
