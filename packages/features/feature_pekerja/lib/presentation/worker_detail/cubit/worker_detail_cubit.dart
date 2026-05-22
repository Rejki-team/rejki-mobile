import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:domain/domain.dart';
import 'worker_detail_state.dart';
import '../models/worker_detail_model.dart';

@injectable
class WorkerDetailCubit extends Cubit<WorkerDetailState> {
  final GetWorkerByIdUseCase _getWorkerByIdUseCase;

  WorkerDetailCubit(this._getWorkerByIdUseCase) : super(const WorkerDetailState());

  String _formatWage(int wage) {
    final formatted = wage.toString().replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+$)'),
      (m) => '${m[1]}.',
    );
    return 'Rp $formatted / Jam';
  }

  Future<void> loadDetail(String id) async {
    emit(state.copyWith(isLoading: true, isFailure: false));

    try {
      final result = await _getWorkerByIdUseCase(id);

      if (isClosed) return;

      result.fold(
        (failure) {
          emit(
            state.copyWith(
              isLoading: false,
              isFailure: true,
              errorMessage: failure.map(
                serverError: (s) => s.message ?? 'Server error',
                networkError: (_) => 'No Internet Connection',
                validationError: (v) => v.message,
                unknown: (_) => 'Unknown error',
              ),
            ),
          );
        },
        (workerEntity) {
          // Map to Detail Model using newly pulled API fields
          final model = WorkerDetailModel(
            id: workerEntity.id,
            name: workerEntity.name,
            adCode: workerEntity.adCode,
            statusLabel: workerEntity.statusLabel ?? 'Available',
            age: workerEntity.age,
            rating: workerEntity.rating,
            reviewCount: workerEntity.reviewCount,
            wageText: _formatWage(workerEntity.wage),
            avatarUrl: workerEntity.avatarUrl,
            address: workerEntity.address ?? 'Alamat tidak tersedia', 
            workExperiences: (workerEntity.workExperience != null && workerEntity.workExperience!.isNotEmpty)
                ? [workerEntity.workExperience!]
                : ['Tidak ada pengalaman kerja terdaftar'],
            workingHours: workerEntity.available ?? 'Fleksibel',
            phoneNumber: workerEntity.phoneNumber ?? '-',
            badges: [],
          );

          emit(state.copyWith(isLoading: false, worker: model));
        },
      );
    } catch (e) {
      if (isClosed) return;
      emit(
        state.copyWith(
          isLoading: false,
          isFailure: true,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
