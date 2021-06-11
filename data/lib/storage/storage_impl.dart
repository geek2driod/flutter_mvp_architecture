import 'package:shared_preferences/shared_preferences.dart';

import '../export.dart';

class StorageImpl implements Storage {
  final SharedPreferences sharedPreferences;

  StorageImpl(this.sharedPreferences);

  @override
  bool getBool(String key) => sharedPreferences.getBool(key);

  @override
  int getInt(String key) => sharedPreferences.getInt(key);

  @override
  String getString(String key) => sharedPreferences.getString(key);

  @override
  void setBool(String key, bool value) => sharedPreferences.setBool(key, value);

  @override
  void setInt(String key, int value) => sharedPreferences.setInt(key, value);

  @override
  void setString(String key, String value) =>
      sharedPreferences.setString(key, value);

  @override
  bool contains(String key) => sharedPreferences.containsKey(key);

  @override
  Future<bool> remove(String key)  => sharedPreferences.remove(key);

}
