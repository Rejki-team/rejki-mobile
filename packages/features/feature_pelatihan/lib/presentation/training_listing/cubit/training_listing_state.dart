import 'package:freezed_annotation/freezed_annotation.dart';

import '../training_model.dart';

part 'training_listing_state.freezed.dart';

@freezed
abstract class TrainingListingState with _$TrainingListingState {
  const TrainingListingState._();

  const factory TrainingListingState({
    @Default([]) List<TrainingModel> trainings,
    @Default(true) bool isLoading,
    @Default(false) bool isFailure,
    String? errorMessage,
    @Default('16 Pelatihan tersedia') String summaryDisplayText,

    /// Nama lokasi untuk display (mis. hasil reverse-geocode atau default).
    @Default('Lokasi Anda') String locationName,

    /// Koordinat device saat ini (F-1/F-14) — `null` bila GPS belum tersedia/ditolak.
    double? latitude,
    double? longitude,

    /// Radius filter (0-10 KM, default 10 = max / "belum diterapkan") — PRD §5.13.1
    /// mem-fix radius Pelatihan di 10km sisi backend (tidak ada override param),
    /// slider ini murni indikator visual, konsisten dengan pola Iklan Pekerjaan.
    @Default(10) int distanceKm,
    @Default(false) bool isDistanceFilterApplied,
  }) = _TrainingListingState;

  /// Display text lokasi + radius (mis. "Lokasi Anda - 10 km").
  String get locationDisplayText => '$locationName - $distanceKm km';
}
