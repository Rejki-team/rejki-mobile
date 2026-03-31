import 'package:fpdart/fpdart.dart';
import '../failures/profile_failure.dart';
import '../params/update_profile_params.dart';
import '../repositories/profile_repository.dart';

/// Use case untuk update profile user.
///
/// Melakukan validasi field sebelum mendelegasikan ke repository.
class UpdateProfileUseCase {
  final ProfileRepository _repository;

  UpdateProfileUseCase(this._repository);

  /// Validates params and delegates to repository.
  Future<Either<ProfileFailure, Unit>> call(
    UpdateProfileParams params,
  ) {
    // Validasi NIK: harus 16 digit
    if (params.nik.length != 16) {
      return Future.value(
        left(const ProfileFailure.validationError(
          'NIK harus 16 digit',
        )),
      );
    }

    // Validasi nama tidak boleh kosong
    if (params.fullName.trim().isEmpty) {
      return Future.value(
        left(const ProfileFailure.validationError(
          'Nama lengkap harus diisi',
        )),
      );
    }

    return _repository.updateProfile(params);
  }
}
