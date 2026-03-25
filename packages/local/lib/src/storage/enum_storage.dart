import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Pilihan penyimpanan khusus untuk Enum list mapping.
@lazySingleton
class EnumStorage {
  final SharedPreferences _prefs;

  EnumStorage(this._prefs);

  /// Simpan list string ke shared preference dengan raw key string
  /// Key: misal 'bid_statuses'
  /// Value: misal ['request', 'approve', 'decline']
  Future<void> saveEnums(String key, List<String> values) async {
    await _prefs.setStringList(key, values);
  }

  /// Mengambil list string dari shared preference
  List<String> getEnums(String key) {
    return _prefs.getStringList(key) ?? [];
  }

  /// Membersihkan record enum yang ditentukan
  Future<void> clearEnum(String key) async {
    await _prefs.remove(key);
  }
}
