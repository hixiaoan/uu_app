import 'package:shared_preferences/shared_preferences.dart';


///缓存管理类
class UUCache{

  UUCache._();
  SharedPreferences? _prefs;

  bool isPrefsInit = false;
  static UUCache? _instance;

  static UUCache get instance => UUCache._getInstance();

  static UUCache _getInstance(){
    _instance ??= UUCache._();
    return _instance!;
  }

  ///预初始化 在项目启动之前必须初始化
  static Future<UUCache> preInit() async {
    if (instance._prefs == null){
      instance._prefs = await SharedPreferences.getInstance();
    }
    return instance;
  }


  setDouble(String key, double value){
    _prefs?.setDouble(key,  value);
  }

  setBool(String key, bool value){
    _prefs?.setBool(key, value);
  }

  setInt(String key, int value){
    _prefs?.setInt(key, value);
  }

  setString(String key, String value){
    _prefs?.setString(key, value);
  }

  setStringList(String key, List<String> value){
    _prefs?.setStringList(key,  value);
  }


  T? get<T>(String key){
    if (_prefs == null){
      print("UUCache  初始化未完成");
      return null;
    }else if(!containsKey(key)){
      print("UUCache:${key}不存在");
      return null;
    }else
    {
      var result = _prefs!.get(key);
      if (result == null){
        return null;
      }
      return result as T;
    }
  }

  ///是否已存在
  bool containsKey(String key){
    return _prefs!.containsKey(key);
  }
  ///移除

  Future<bool>? remove(String key){
    return _prefs!.remove(key);
  }
}
