import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:domain/domain.dart';
import 'worker_detail_state.dart';
import '../models/worker_detail_model.dart';

@injectable
class WorkerDetailCubit extends Cubit<WorkerDetailState> {
  final GetWorkerByIdUseCase _getWorkerByIdUseCase;

  WorkerDetailCubit(this._getWorkerByIdUseCase) : super(const WorkerDetailState());

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
          // Map to Detail Model (Using placeholder mock fields for absent arrays)
          final model = WorkerDetailModel(
            id: workerEntity.id,
            name: workerEntity.name,
            adCode: workerEntity.adCode,
            statusLabel: workerEntity.statusLabel ?? 'Available',
            age: workerEntity.age,
            rating: workerEntity.rating,
            reviewCount: workerEntity.reviewCount,
            wageText: 'Rp ${workerEntity.wage} / jam',
            avatarUrl: workerEntity.avatarUrl,
            address: 'Alamat dari API tidak tersedia di base entity', 
            workExperiences: ['Pengalaman dari API'],
            workingHours: 'Fleksibel',
            phoneNumber: '08xxxxxxxxx',
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
