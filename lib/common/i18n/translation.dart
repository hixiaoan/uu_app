part of i18n;

class Translation extends Translations {
  static const Iterable<Locale> supported = [
    Locale('en', 'US'),
    Locale('zh', 'CN'),
  ];
  static const Locale fallback = Locale('en', 'US');

  @override
  Map<String, Map<String, String>> get keys => {
        'en': enUS,
        'zh': zhCN,
      };
}
