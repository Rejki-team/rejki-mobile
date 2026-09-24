import 'dart:typed_data';

import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../failures/report_failure.dart';
import '../repositories/report_repository.dart';

@lazySingleton
class PelaporanMasalahUseCase {
  final ReportRepository _repository;

  PelaporanMasalahUseCase(this._repository);

  Future<Either<ReportFailure, Unit>> execute({
    String? targetId,
    required String keterangan,
    required Uint8List buktiBytes,
    required String buktiMime,
  }) {
    return _repository.pelaporanMasalah(
      targetId: targetId,
      keterangan: keterangan,
      buktiBytes: buktiBytes,
      buktiMime: buktiMime,
    );
  }
}
