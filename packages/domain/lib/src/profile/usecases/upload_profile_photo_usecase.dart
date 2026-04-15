import 'dart:io';
import 'package:fpdart/fpdart.dart';
import '../failures/profile_failure.dart';
import '../repositories/profile_repository.dart';

/// Upload atau update foto profil pengguna.
///
/// Memanggil [ProfileRepository.uploadProfilePhoto] yang mengirim
/// `PUT /users/profile/photo` dengan form data berisi file foto.
///
/// Return [String] berisi path foto baru jika sukses.
class UploadProfilePhotoUseCase {
  final ProfileRepository _repository;

  UploadProfilePhotoUseCase(this._repository);

  Future<Either<ProfileFailure, String>> call(File photo) =>
      _repository.uploadProfilePhoto(photo);
}
