import 'package:shared_preferences/shared_preferences.dart';

/// Counter lokal untuk batas tayang iklan AdMob (F-33, PRD §5.16: maksimal
/// 10 kali per hari per pengguna, reset tiap hari kalender).
///
/// Registrasi DI manual — lihat `register_module.dart` (konvensi baku
/// codebase ini, bukan via anotasi kelas).
class AdImpressionStorage {
  final SharedPreferences _prefs;

  AdImpressionStorage(this._prefs);

  static const int maxImpressionsPerDay = 10;
  static const String _keyDate = 'ad_impression_date';
  static const String _keyCount = 'ad_impression_count';

  String _dateKey(DateTime now) =>
      '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';

  /// `now` hanya untuk testability (default `DateTime.now()`).
  bool canShowAd({DateTime? now}) {
    final today = _dateKey(now ?? DateTime.now());
    if (_prefs.getString(_keyDate) != today) return true;
    return (_prefs.getInt(_keyCount) ?? 0) < maxImpressionsPerDay;
  }

  /// Dipanggil setiap iklan berhasil ditampilkan. Reset counter otomatis
  /// bila tanggal kalender sudah berganti sejak impression terakhir.
  Future<void> recordImpressionShown({DateTime? now}) async {
    final today = _dateKey(now ?? DateTime.now());
    if (_prefs.getString(_keyDate) != today) {
      await _prefs.setString(_keyDate, today);
      await _prefs.setInt(_keyCount, 1);
    } else {
      await _prefs.setInt(_keyCount, (_prefs.getInt(_keyCount) ?? 0) + 1);
    }
  }
}
