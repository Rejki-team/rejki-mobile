import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../failures/report_failure.dart';
import '../repositories/report_repository.dart';

@lazySingleton
class LaporkanIklanUseCase {
  final ReportRepository _repository;

  LaporkanIklanUseCase(this._repository);

  Future<Either<ReportFailure, Unit>> execute({
    required String targetType,
    required String targetId,
    required String keterangan,
    String? targetAdType,
  }) {
    return _repository.laporkanIklan(
      targetType: targetType,
      targetId: targetId,
      keterangan: keterangan,
      targetAdType: targetAdType,
    );
  }
}
