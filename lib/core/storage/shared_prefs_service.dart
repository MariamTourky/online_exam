import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class SharedPrefsService {
  final SharedPreferences _prefs;
  static const String _tokenKey = "token";

  SharedPrefsService(this._prefs);

  Future<void> saveString(String key, String value) async {
    await _prefs.setString(key, value);
  }

  Future<String?> getToken() async {
    return _prefs.getString(_tokenKey);
  }

  Future<void> saveToken(String token) async {
    await _prefs.setString(_tokenKey, token);
  }

  Future<void> saveBool(String key, bool value) async {
    await _prefs.setBool(key, value);
  }

  bool? getBool(String key) {
    return _prefs.getBool(key);
  }

  Future<void> remove(String key) async {
    await _prefs.remove(key);
  }

  Future<void> clear() async {
    await _prefs.clear();
  }
}
