

part of util;

abstract class StorageKey{

  static const String localAccount = 'storage_account';
  static const String localThemeMode = 'storage_theme_mode';
  static const String localLanguage = 'storage_lang';
  static const String boardingPass = 'boarding-pass';
  /// 求职者
  static const String roleGeek = '0';
  /// 老板
  static const String roleBoss = '1';

  /// 自动主题
  static const String themeSystem = '0';
  /// 亮色主题
  static const String themeLight = '1';
  /// 暗色主题
  static const String themeDark = '2';
}