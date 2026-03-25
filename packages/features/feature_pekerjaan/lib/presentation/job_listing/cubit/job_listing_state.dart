part of 'job_listing_cubit.dart';

/// Sort options for job listing
enum JobSortOption {
  /// Sort by nearest distance (fallback: created_at desc until backend supports geo-sort)
  nearestDistance,

  /// Sort by highest salary
  highestSalary,
}

/// Job Listing Status
enum JobListingStatus {
  /// Initial state
  initial,

  /// Loading jobs
  loading,

  /// Jobs loaded successfully
  success,

  /// Failed to load jobs
  failure,
}

/// Job Listing State
///
/// Immutable state for job listing page.
///
/// ## Filter Applied Semantics
/// Two boolean flags distinguish UI "default" state vs user-applied state:
///
/// - [isDistanceFilterApplied] = false → slider shows at max (2km), neutral color
/// - [isDistanceFilterApplied] = true  → slider shows applied color, user explicitly chose a value
/// - [isSortFilterApplied] = false     → no radio selected in sort sheet
/// - [isSortFilterApplied] = true      → radio lit up + filter icon shows dot badge
///
/// Default API call always uses `created_at desc` regardless of [sortOption]
/// unless [isSortFilterApplied] is true.
@freezed
abstract class JobListingState with _$JobListingState {
  const JobListingState._();

  const factory JobListingState({
    /// Current loading status
    @Default(JobListingStatus.initial) JobListingStatus status,

    /// List of jobs
    @Default([]) List<JobEntity> jobs,

    /// Search query
    @Default('') String searchQuery,

    /// Current location name for display
    @Default('Lokasi Anda') String locationName,

    /// Current device latitude (null if unavailable)
    double? latitude,

    /// Current device longitude (null if unavailable)
    double? longitude,

    /// Distance/radius in KM (0–2, default 2 = max radius / "not applied")
    @Default(2) int distanceKm,

    /// Whether the user has explicitly applied a distance filter.
    ///
    /// false = slider renders at max position without the "applied" highlight style.
    /// true  = slider renders with the active color, distance chip shows applied.
    @Default(false) bool isDistanceFilterApplied,

    /// Sort option — only used when [isSortFilterApplied] is true.
    @Default(JobSortOption.nearestDistance) JobSortOption sortOption,

    /// Whether the user has explicitly applied a sort filter.
    ///
    /// false = no radio highlighted in sort sheet; API uses `created_at desc`.
    /// true  = radio highlights [sortOption]; API uses mapped sort param.
    @Default(false) bool isSortFilterApplied,

    /// Total job count
    @Default(0) int totalJobs,

    /// Error message if any
    String? errorMessage,
  }) = _JobListingState;

  // ---------------------------------------------------------------------------
  // Computed getters
  // ---------------------------------------------------------------------------

  /// Check if loading
  bool get isLoading => status == JobListingStatus.loading;

  /// Check if initial state
  bool get isInitial => status == JobListingStatus.initial;

  /// Check if success
  bool get isSuccess => status == JobListingStatus.success;

  /// Check if failure
  bool get isFailure => status == JobListingStatus.failure;

  /// Returns the active sort option only when user has applied it; otherwise null.
  ///
  /// Used by [SortFilterBottomSheet] to determine initial selection.
  JobSortOption? get appliedSortOption =>
      isSortFilterApplied ? sortOption : null;

  /// Display text for location (e.g., "Lokasi Anda")
  String get locationDisplayText => locationName;

  /// Display text for location + distance (e.g., "Lokasi Anda - 2 KM")
  String get locationDistanceText => '$locationName - $distanceKm KM';

  /// Sub-title showing total jobs in area
  String get jobCountDisplayText => '$totalJobs Pekerjaan di sekitar anda';

  /// Display text for current distance (e.g., "2 KM")
  String get distanceDisplayText => '$distanceKm KM';
}
