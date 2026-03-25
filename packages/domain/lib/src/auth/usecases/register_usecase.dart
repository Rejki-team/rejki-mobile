import 'package:fpdart/fpdart.dart';
import '../entities/entities.dart';
import '../failures/failures.dart';
import '../repositories/repositories.dart';
import 'register_params.dart';

/// Register Use Case
///
/// Handles user registration business logic.
/// Hanya mengembalikan hasil minimal (AuthResult).
class RegisterUseCase {
  final AuthRepository _repository;

  RegisterUseCase(this._repository);

  /// Execute registration
  ///
  /// [params] - Register parameters including email, password, phone, and consent
  ///
  /// Returns [AuthResult] on success, [AuthFailure] on failure.
  /// Token storage handled internally by repository.
  Future<Either<AuthFailure, AuthResult>> call(RegisterParams params) {
    return _repository.register(params: params);
  }
}
