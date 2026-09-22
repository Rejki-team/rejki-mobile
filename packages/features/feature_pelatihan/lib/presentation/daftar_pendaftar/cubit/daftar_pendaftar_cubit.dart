import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

import 'daftar_pendaftar_state.dart';

@injectable
class DaftarPendaftarCubit extends Cubit<DaftarPendaftarState> {
  final GetEnrollmentsByTrainingUseCase _getEnrollmentsByTrainingUseCase;

  DaftarPendaftarCubit(this._getEnrollmentsByTrainingUseCase)
    : super(const DaftarPendaftarState());

  Future<void> loadEnrollments(String trainingId) async {
    emit(state.copyWith(isLoading: true, isFailure: false, errorMessage: null));

    final result = await _getEnrollmentsByTrainingUseCase(trainingId);

    if (isClosed) return;

    result.fold(
      (failure) => emit(
        state.copyWith(
          isLoading: false,
          isFailure: true,
          errorMessage: failure.maybeWhen(
            serverError: (msg) => msg ?? 'Terjadi kesalahan pada server',
            orElse: () => 'Gagal memuat daftar pendaftar.',
          ),
        ),
      ),
      (enrollments) => emit(
        state.copyWith(
          isLoading: false,
          enrollments: enrollments
              .where((e) => e.status == 'approved')
              .toList(),
        ),
      ),
    );
  }
}
