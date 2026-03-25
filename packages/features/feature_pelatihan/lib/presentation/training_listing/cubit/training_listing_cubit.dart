import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import 'training_listing_state.dart';
import '../training_model.dart';

@injectable
class TrainingListingCubit extends Cubit<TrainingListingState> {
  TrainingListingCubit() : super(const TrainingListingState());

  Future<void> loadTrainings() async {
    emit(state.copyWith(isLoading: true, isFailure: false));

    try {
      // Simulate network wait (async to prevent ANR)
      await Future.delayed(const Duration(seconds: 1));

      // Check if closed to prevent memory leaks throwing state errors
      if (isClosed) return;

      final mockData = [
        const TrainingModel(
          id: '1',
          title: 'Tukang Listrik Madya Bawah (1)',
          description:
              'Pelatihan ini bertujuan untuk mengajarkan keterampilan teknikal kelistrikan tingkat madya,...',
          date: '25 November 2025',
          time: '11:00',
          location: 'Gedung Pertemuan RW Jl Pisang BAru RT 01 RW 03',
          facilities: ['Sertifikat Pelatihan', 'Badge Listrik Madya'],
          fee: 'Rp 20.000',
          feeNotice: 'Pelatihan 100% Gratis!',
        ),
      ];

      emit(state.copyWith(isLoading: false, trainings: mockData));
    } catch (e) {
      if (isClosed) return;
      emit(
        state.copyWith(
          isLoading: false,
          isFailure: true,
          errorMessage: 'Gagal memuat daftar pelatihan.',
        ),
      );
    }
  }

  void updateSearchQuery(String query) {
    // Apply local filter debounce logic avoiding Race conditions
  }
}
