import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:designsystems/designsystems.dart';

import 'training_detail_state.dart';
import '../models/training_detail_model.dart';

@injectable
class TrainingDetailCubit extends Cubit<TrainingDetailState> {
  TrainingDetailCubit() : super(const TrainingDetailState());

  Future<void> loadTraining(String id) async {
    emit(state.copyWith(isLoading: true, isFailure: false, errorMessage: null));

    try {
      // Async op mocking networking call
      await Future.delayed(const Duration(seconds: 1));

      // Check closed bounds avoiding late memory leaks and ANR from Race Conditions
      if (isClosed) return;

      final mockData = TrainingDetailModel(
        id: id,
        imageUrl: '', // fallback to generic widget design
        title: 'Tukang Listrik Madya Bawah (1)',
        badge: 'Gratis',
        description:
            'Pelatihan ini bertujuan untuk mengajarkan keterampilan teknikal kelistrikan tingkat madya, mencakup pemahaman dasar hingga penerapan praktis dalam instalasi listrik, perawatan sistem kelistrikan, serta penerapan prosedur kesel...',
        date: '25 November 2025',
        time: '11:00',
        location: 'Gedung Pertemuan RW Jl Pisang BAru RT 01 RW 03',
        facilities: [
          TrainingFacilityModel(
            iconAsset: AppAssets.iconPaper,
            label: 'Sertifikat Pelatihan',
          ),
          TrainingFacilityModel(
            iconAsset: AppAssets.iconInfoLine,
            label: 'Badge Listrik Madya',
          ),
        ],
        requirements: ['Pria / Wanita', 'Minimal SMK / SMU /Aliyah'],
        fee: 'Rp 20.000',
        feeNotice: 'Pelatihan 100% Gratis!',
      );

      emit(state.copyWith(isLoading: false, training: mockData));
    } catch (e) {
      if (isClosed) return;
      emit(
        state.copyWith(
          isLoading: false,
          isFailure: true,
          errorMessage: 'Gagal memuat detail pelatihan.',
        ),
      );
    }
  }

  Future<void> registerTraining() async {
    if (state.isRegistering) return; // Debounce block
    emit(state.copyWith(isRegistering: true));

    try {
      await Future.delayed(const Duration(seconds: 1));

      if (isClosed) return;

      emit(state.copyWith(isRegistering: false, isRegistrationSuccess: true));
    } catch (e) {
      if (isClosed) return;
      emit(state.copyWith(isRegistering: false));
    }
  }
}
