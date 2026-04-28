import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'package:network/network.dart';
import 'package:designsystems/designsystems.dart';

import 'training_detail_state.dart';
import '../models/training_detail_model.dart';

@injectable
class TrainingDetailCubit extends Cubit<TrainingDetailState> {
  final GetTrainingDetailUseCase _getTrainingDetailUseCase;
  final EnrollTrainingUseCase _enrollTrainingUseCase;

  TrainingDetailCubit(
    this._getTrainingDetailUseCase,
    this._enrollTrainingUseCase,
  ) : super(const TrainingDetailState());

  Future<void> loadTraining(String id) async {
    emit(state.copyWith(isLoading: true, isFailure: false, errorMessage: null));

    final result = await _getTrainingDetailUseCase(id);

    if (isClosed) return;

    result.fold(
      (failure) => emit(state.copyWith(
        isLoading: false,
        isFailure: true,
        errorMessage: failure.maybeWhen(
          serverError: (msg) => msg ?? 'Terjadi kesalahan pada server',
          orElse: () => 'Gagal memuat detail pelatihan.',
        ),
      )),
      (entity) => emit(state.copyWith(
        isLoading: false,
        training: _entityToModel(entity),
      )),
    );
  }

  Future<void> registerTraining() async {
    if (state.isRegistering || state.training == null) return;
    emit(state.copyWith(isRegistering: true));

    final result = await _enrollTrainingUseCase(state.training!.id);

    if (isClosed) return;

    result.fold(
      (failure) => emit(state.copyWith(
        isRegistering: false,
        errorMessage: failure.maybeWhen(
          serverError: (msg) => msg ?? 'Terjadi kesalahan pada server',
          orElse: () => 'Gagal mendaftar pelatihan.',
        ),
      )),
      (_) => emit(state.copyWith(
        isRegistering: false,
        isRegistrationSuccess: true,
      )),
    );
  }

  TrainingDetailModel _entityToModel(TrainingEntity entity) {
    final imageUrl = entity.images.isNotEmpty
        ? ApiConfig.buildImageUrl(entity.images.first.uriPath)
        : null;

    final facilities = entity.facilities
        .map((f) => TrainingFacilityModel(
              iconAsset: AppAssets.iconPaper,
              label: f,
            ))
        .toList();

    return TrainingDetailModel(
      id: entity.id,
      imageUrl: imageUrl,
      title: entity.title,
      badge: entity.certificate ??
          (entity.feePerPerson == 0 ? 'Gratis' : 'Berbayar'),
      description: entity.description,
      date: _formatDate(entity.dateOfTraining),
      time: _formatTime(entity.dateOfTraining),
      location: entity.locationAddress,
      facilities: facilities,
      requirements: const [],
      fee: entity.formattedFee,
      feeNotice: entity.feePerPerson == 0 ? 'Pelatihan 100% Gratis!' : '',
    );
  }

  static String _formatDate(String raw) {
    try {
      final dt = DateTime.parse(raw);
      const months = [
        'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni',
        'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember',
      ];
      return '${dt.day} ${months[dt.month - 1]} ${dt.year}';
    } catch (_) {
      return raw;
    }
  }

  static String _formatTime(String raw) {
    try {
      final dt = DateTime.parse(raw);
      final h = dt.hour.toString().padLeft(2, '0');
      final m = dt.minute.toString().padLeft(2, '0');
      return '$h:$m';
    } catch (_) {
      return '';
    }
  }
}
