import 'package:fpdart/fpdart.dart';

import '../failures/helper_failure.dart';

/// Interface untuk Helper Repository
abstract class HelperRepository {
  /// Melakukan sinkronisasi Enums dari backend lalu menyimpannya ke local storage barunya.
  Future<Either<HelperFailure, Unit>> syncEnums();
}
