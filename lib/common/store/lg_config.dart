


part of store;



class ConfigStore extends GetxService{

  static ConfigStore get to => Get.find();

  Locale locale = ui.window.locale;
  List<Locale> languages = [
    const Locale('en', 'US'),
    const Locale('zh', 'CN'),
  ];
  

  @override
  void onInit() {
    super.onInit();
    _initLanguage();
    _initThemeMode();
  }

  void _initLanguage() {
    final result = StorageService.to.readString(StorageKey.localLanguage);
    if (result.isEmpty) return;
    locale = languages.firstWhere(
      (element) => element.languageCode == result,
      orElse: () => ui.window.locale,
    );
  }


  void _initThemeMode() {
    final theme = StorageService.to.readString(StorageKey.localThemeMode);
    switch (theme) {
      case StorageKey.themeLight:
        AppTheme.mode = ThemeMode.light;
        break;
      case StorageKey.themeDark:
        AppTheme.mode = ThemeMode.dark;
        break;
      default:
        AppTheme.mode = ThemeMode.system;
        break;
    }
    AppTheme.setSystemStyle();
  }


  void setLanguage(Locale value) {
    locale = value;
    Get.updateLocale(value);
    StorageService.to.writeString(StorageKey.localLanguage, value.languageCode);
  }




}