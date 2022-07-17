part of router;

abstract class Routers {
  static final RouteObserver<Route> observer = RouteObservers();
  static List<String> history = [];

  static final List<GetPage> getPages = [
    GetPage(name: RouterName.Launch, page: () => const LaunchPage()),
    GetPage(name: RouterName.Main, page: () => const MainPage()),
    GetPage(name: RouterName.Home, page: () => const HomePage()),
    GetPage(
        name: RouterName.Login,
        binding: LoginBinding(),
        page: () => const LoginPage()),
    GetPage(
        name: RouterName.Reigster,
        binding: RegisterBindings(),
        page: () => ReigsterPage()),
    GetPage(name: RouterName.Banner, page: () => const BannerPage()),
    GetPage(name: RouterName.Favorite, page: () => const FavoritePage()),
    GetPage(name: RouterName.VideoDetail, page: () => VideoDetailPage()),
    GetPage(name: RouterName.Ranking, page: () => const RankingPage()),
    GetPage(name: RouterName.Mine, page: () => const MinePage())
  ];
}
