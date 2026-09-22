import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'package:network/network.dart';

import 'training_listing_state.dart';
import '../training_model.dart';

@injectable
class TrainingListingCubit extends Cubit<TrainingListingState> {
  final GetTrainingsUseCase _getTrainingsUseCase;

  TrainingListingCubit(this._getTrainingsUseCase)
    : super(const TrainingListingState());

  Future<void> loadTrainings({String? search}) async {
    emit(state.copyWith(isLoading: true, isFailure: false));

    final result = await _getTrainingsUseCase(
      search: search,
      latitude: state.latitude,
      longitude: state.longitude,
    );

    if (isClosed) return;

    result.fold(
      (failure) => emit(
        state.copyWith(
          isLoading: false,
          isFailure: true,
          errorMessage: failure.maybeWhen(
            serverError: (msg) => msg ?? 'Terjadi kesalahan pada server',
            orElse: () => 'Gagal memuat daftar pelatihan.',
          ),
        ),
      ),
      (entities) {
        final models = entities.map(_entityToModel).toList();
        emit(
          state.copyWith(
            isLoading: false,
            trainings: models,
            summaryDisplayText: '${models.length} Pelatihan tersedia',
          ),
        );
      },
    );
  }

  void updateSearchQuery(String query) {
    loadTrainings(search: query.isEmpty ? null : query);
  }

  // ---------------------------------------------------------------------------
  // Location & distance filter (F-1/F-14, PRD §5.13.1)
  // ---------------------------------------------------------------------------

  /// Update device location for radius-based API filtering. Reloads listing
  /// with the new coordinates.
  void updateLocation({
    required double latitude,
    required double longitude,
    String? locationName,
  }) {
    emit(
      state.copyWith(
        latitude: latitude,
        longitude: longitude,
        locationName: locationName ?? state.locationName,
      ),
    );
    loadTrainings();
  }

  /// Apply distance filter chosen by user (marks `isDistanceFilterApplied = true`).
  ///
  /// Backend memfix radius Pelatihan di 10km (PRD §5.13.1, tanpa parameter override) —
  /// nilai ini murni indikator visual, konsisten dengan pola Iklan Pekerjaan.
  void applyDistanceFilter(int distanceKm) {
    emit(
      state.copyWith(
        distanceKm: distanceKm.clamp(0, 10),
        isDistanceFilterApplied: true,
      ),
    );
  }

  /// Reset distance filter — reverts to max radius (10 KM) and "not applied" visual.
  void resetDistanceFilter() {
    emit(state.copyWith(distanceKm: 10, isDistanceFilterApplied: false));
  }

  TrainingModel _entityToModel(TrainingEntity entity) {
    final imageUrl = entity.images.isNotEmpty
        ? ApiConfig.buildImageUrl(entity.images.first.uriPath)
        : null;

    return TrainingModel(
      id: entity.id,
      imageUrl: imageUrl,
      title: entity.title,
      description: entity.description,
      date: _formatDate(entity.dateOfTraining),
      time: _formatTime(entity.dateOfTraining),
      location: entity.locationAddress,
      facilities: entity.facilities,
      fee: entity.formattedFee,
      feeNotice: entity.feePerPerson == 0 ? 'Pelatihan 100% Gratis!' : '',
    );
  }

  static String _formatDate(String raw) {
    try {
      final dt = DateTime.parse(raw);
      const months = [
        'Januari',
        'Februari',
        'Maret',
        'April',
        'Mei',
        'Juni',
        'Juli',
        'Agustus',
        'September',
        'Oktober',
        'November',
        'Desember',
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
