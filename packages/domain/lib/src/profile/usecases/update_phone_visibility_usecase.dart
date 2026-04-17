import 'package:fpdart/fpdart.dart';
import '../failures/profile_failure.dart';
import '../repositories/profile_repository.dart';

/// Toggle visibilitas nomor telepon user via PUT /users/phone-visibility.
///
/// Digunakan oleh [PersonalInfoCubit] ketika user meng-toggle switch
/// visibilitas nomor telepon di halaman Informasi Pribadi.
class UpdatePhoneVisibilityUseCase {
  final ProfileRepository _repository;

  UpdatePhoneVisibilityUseCase(this._repository);

  Future<Either<ProfileFailure, Unit>> call({required bool isVisible}) =>
      _repository.updatePhoneVisibility(isVisible: isVisible);
}
