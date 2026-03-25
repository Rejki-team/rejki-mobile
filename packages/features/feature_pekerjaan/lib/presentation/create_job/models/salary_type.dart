/// Salary type options for job creation.
///
/// ## Mapping
/// The UI shows Indonesian labels while the server expects specific API values.
///
/// | UI Label  | API Value  |
/// |-----------|------------|
/// | Borongan  | Borongan   |
/// | Harian    | Perhari    |
enum SalaryType {
  /// Dibayar per proyek / borongan.
  borongan,

  /// Dibayar per hari kerja.
  harian;

  /// Human-readable display label shown in the UI dropdown.
  String get displayLabel {
    switch (this) {
      case SalaryType.borongan:
        return 'Borongan';
      case SalaryType.harian:
        return 'Harian';
    }
  }

  /// API value sent to the server.
  String get apiValue {
    switch (this) {
      case SalaryType.borongan:
        return 'Borongan';
      case SalaryType.harian:
        return 'Perhari';
    }
  }

  /// All available salary types (for UI dropdown).
  static List<SalaryType> get options => [borongan, harian];

  /// Display labels for all salary types (for UI dropdown items).
  static List<String> get displayLabels =>
      options.map((e) => e.displayLabel).toList();

  /// Looks up a [SalaryType] by its [displayLabel].
  ///
  /// Returns null if [label] doesn't match any known type.
  static SalaryType? fromDisplayLabel(String label) {
    for (final type in options) {
      if (type.displayLabel == label) return type;
    }
    return null;
  }
}
