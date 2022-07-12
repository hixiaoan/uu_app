

part of router;

abstract class Routers{

  static final RouteObserver<Route> observer = RouteObservers();
  static List<String> history = [];

   static final List<GetPage> getPages = [


      GetPage(name: RouterName.Launch, page: ()=>LaunchPage()),
      GetPage(name: RouterName.Main, page: ()=>MainPage()),
      GetPage(name: RouterName.Home, page: ()=>HomePage()),
      GetPage(name: RouterName.Login, page: ()=> LoginPage()),
      GetPage(name: RouterName.Reigster, page: ()=>ReigsterPage()),
      GetPage(name: RouterName.Banner, page: ()=>BannerPage()),
      GetPage(name: RouterName.Favorite, page: ()=>FavoritePage()),
      GetPage(name: RouterName.VideoDetail, page: ()=>VideoDetailPage()),
      GetPage(name: RouterName.Ranking, page: ()=>RankingPage()),
      GetPage(name: RouterName.Mine, page: ()=>MinePage())
   ];

}