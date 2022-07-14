

part of services;

class StorageService extends GetxService {
  
  static StorageService get to => Get.find();
  late final SharedPreferences _prefs;

  Future<StorageService> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> writeString(String key, String value) async {
    return await _prefs.setString(key, value);
  }

  Future<bool> writeBool(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }

  Future<bool> writeList(String key, List<String> value) async {
    return await _prefs.setStringList(key, value);
  }

  String readString(String key) {
    return _prefs.getString(key) ?? '';
  }

  bool readBool(String key) {
    return _prefs.getBool(key) ?? false;
  }

  List<String> readList(String key) {
    return _prefs.getStringList(key) ?? [];
  }

  Future<bool> remove(String key) async {
    return await _prefs.remove(key);
  }
  
}