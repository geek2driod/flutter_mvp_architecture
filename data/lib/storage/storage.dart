mixin Storage {
  String getString(String key);

  void setString(String key, String value);

  int getInt(String key);

  void setInt(String key, int value);

  void setList(String key, List<String> data);

  List<String> getList(String key);

  bool getBool(String key);

  bool contains(String key);

  Future<bool> remove(String key);

  void setBool(String key, bool value);
}
