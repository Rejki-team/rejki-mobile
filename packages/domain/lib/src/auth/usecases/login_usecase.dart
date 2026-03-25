import 'package:fpdart/fpdart.dart';
import '../entities/entities.dart';
import '../failures/failures.dart';
import '../repositories/repositories.dart';

/// Login Use Case
///
/// Handles user login business logic.
/// Hanya mengembalikan hasil minimal (AuthResult).
class LoginUseCase {
  final AuthRepository _repository;

  LoginUseCase(this._repository);

  /// Execute login
  ///
  /// [emailOrPhone] - Email or phone number
  /// [password] - User password
  ///
  /// Returns [AuthResult] on success, [AuthFailure] on failure.
  /// Token storage handled internally by repository.
  Future<Either<AuthFailure, AuthResult>> call({
    required String emailOrPhone,
    required String password,
  }) {
    return _repository.login(emailOrPhone: emailOrPhone, password: password);
  }
}
