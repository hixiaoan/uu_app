

import 'package:flutter/material.dart';
import 'package:uu_app/util/cache_util.dart';
import 'package:uu_app/util/color.dart';
import 'package:uu_app/util/macro.dart';
import '../util/cache_util.dart';
import '../util/color.dart';
extension ThemeModeExtension on ThemeMode {
  String get value => <String>['System', 'Light', 'Dark'][index];
}

class ThemeProvider extends ChangeNotifier{


  ///获取主题模式
  ThemeMode getThemeMode() {
   ThemeMode _themeMode;
    String? _themeModeStr = UUCache.instance.get(UUCacheKey.themeData);
    switch (_themeModeStr) {
      case 'Dark':
        _themeMode = ThemeMode.dark;
        break;
      case 'System':
        _themeMode = ThemeMode.system;
        break;
      default:
        _themeMode = ThemeMode.light;
        break;
    }
    return _themeMode;
  }


  ///设置主题
  void setTheme(ThemeMode themeMode) {
    UUCache.instance.setString(UUCacheKey.themeData, themeMode.value);
    notifyListeners();
  }

  ///获取主题
  ThemeData getThemeData({bool isDarkMode = false}) {
    var themeData = ThemeData(
        primarySwatch: white,
        ///取消点击时按钮的高亮效果
        splashColor: Colors.transparent,
        ///取消长按钮高亮状态 设置透明
        highlightColor: Colors.transparent,
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
        errorColor: isDarkMode ? UUColor.dark_red : UUColor.red,
        primaryColor: isDarkMode ? UUColor.dark_bg : white,
        //Tab指示器的颜色
        indicatorColor: isDarkMode ? primary[50] : white,
        //页面背景色
        scaffoldBackgroundColor: isDarkMode ? UUColor.dark_bg : white);
    return themeData;
  }
}