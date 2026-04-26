/// Job Formatter Utilities
///
/// Centralizes all formatting logic for Job-related data display.
/// Eliminates duplicate formatting code across feature packages.
///
/// Usage:
/// ```dart
/// import 'package:core/core.dart';
///
/// final dateText = JobFormatter.formatDate(job.dateOfJob);
/// final salaryText = JobFormatter.formatSalary(job.salary, job.salaryType);
/// ```
class JobFormatter {
  // Private constructor — prevents instantiation. Use static methods only.
  const JobFormatter._();

  /// Formats [DateTime] as `dd Bulan yyyy` in Indonesian locale.
  ///
  /// Returns `'-'` if [date] is null.
  static String formatDate(DateTime? date) {
    if (date == null) return '-';
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
    return '${date.day} ${months[date.month - 1]} ${date.year}';
  }

  /// Formats [DateTime] as `HH:mm`.
  ///
  /// Returns `'-'` if [date] is null.
  static String formatTime(DateTime? date) {
    if (date == null) return '-';
    final hour = date.hour.toString().padLeft(2, '0');
    final minute = date.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  /// Formats salary as `Rp. 50,000 - Borongan`.
  ///
  /// If [salaryType] is empty, returns just `Rp. 50,000`.
  static String formatSalary(int salary, String salaryType) {
    final formatted = 'Rp. ${formatNumber(salary)}';
    if (salaryType.isNotEmpty) {
      return '$formatted - $salaryType';
    }
    return formatted;
  }

  /// Formats an integer with thousand separators.
  ///
  /// Example: `50000` → `'50,000'`
  static String formatNumber(int number) {
    return number.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );
  }

  /// Maps job status string to user-friendly Indonesian label.
  ///
  /// - `'open'` → `'Tersedia'`
  /// - `'in_progress'` → `'Dalam Proses'`
  /// - `'done'` → `'Selesai'`
  /// - `'canceled'` → `'Dibatalkan'`
  /// - `'closed'` → `'Selesai'` (legacy)
  /// - otherwise → `'Tersedia'`
  static String getStatusLabel(String status) {
    switch (status.toLowerCase()) {
      case 'open':
        return 'Tersedia';
      case 'in_progress':
        return 'Dalam Proses';
      case 'done':
      case 'closed':
        return 'Selesai';
      case 'canceled':
        return 'Dibatalkan';
      default:
        return 'Tersedia';
    }
  }

  /// Maps job status string to short UI badge label.
  ///
  /// - `'open'` → `'Baru'`
  /// - `'in_progress'` → `'Progress'`
  /// - `'done'` → `'Selesai'`
  /// - `'canceled'` → `'Dibatalkan'`
  /// - `'closed'` → `'Selesai'` (legacy)
  /// - otherwise → `'Baru'`
  static String getStatusLabelShort(String status) {
    switch (status.toLowerCase()) {
      case 'open':
        return 'Baru';
      case 'in_progress':
        return 'Progress';
      case 'done':
      case 'closed':
        return 'Selesai';
      case 'canceled':
        return 'Dibatalkan';
      default:
        return 'Baru';
    }
  }

  /// Maps bid status string to UI label.
  ///
  /// - `'request'` → `'Melamar'`
  /// - `'approve'` → `'Diterima'`
  /// - `'decline'` → `'Ditolak'`
  /// - otherwise → `'Melamar'`
  static String getBidStatusLabel(String status) {
    switch (status.toLowerCase()) {
      case 'request':
        return 'Melamar';
      case 'approve':
        return 'Diterima';
      case 'decline':
        return 'Ditolak';
      default:
        return 'Melamar';
    }
  }

  /// Formats location for display using registered address fields.
  ///
  /// Uses [address] (the literal street address, e.g. "Jl. Bungur") and
  /// [village] (readable village name, e.g. "Kebayoran Lama Selatan").
  /// Never uses province/city/subdistrict/ward because those are stored as
  /// ID codes (e.g. "3174051006") — not human-readable.
  ///
  /// Returns `'address, village'` when village is non-empty,
  /// or just `'address'` when village is null/empty.
  static String formatLocation(String address, String? village) {
    if (village != null && village.isNotEmpty) {
      return '$address, $village';
    }
    return address;
  }
}
