import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../failures/helper_failure.dart';
import '../repositories/helper_repository.dart';

/// Use case untuk sinkronisasi enum dari server
@injectable
class SyncEnumsUseCase {
  final HelperRepository _repository;

  SyncEnumsUseCase(this._repository);

  Future<Either<HelperFailure, Unit>> call() {
    return _repository.syncEnums();
  }
}
