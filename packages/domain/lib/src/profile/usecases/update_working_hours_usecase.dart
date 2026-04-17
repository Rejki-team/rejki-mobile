import 'package:fpdart/fpdart.dart';
import '../failures/profile_failure.dart';
import '../repositories/profile_repository.dart';

/// Update jam kerja user via PUT /users/working-hours.
///
/// Digunakan oleh [PersonalInfoCubit] ketika user mengubah pilihan
/// jam kerja dari dropdown di halaman Informasi Pribadi.
class UpdateWorkingHoursUseCase {
  final ProfileRepository _repository;

  UpdateWorkingHoursUseCase(this._repository);

  Future<Either<ProfileFailure, Unit>> call(String workingHours) =>
      _repository.updateWorkingHours(workingHours);
}
