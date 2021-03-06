part of main_page;

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with WidgetsBindingObserver {
  get primary => null;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();
    AppTheme.setSystemStyle();
  }

  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    ///监听app的生命周期
    switch (state) {
      case AppLifecycleState.inactive: //正在使用
        print("正在使用");
        break;
      case AppLifecycleState.resumed: //从后台进入前台
        ///这是安卓的问题
        // if (this is VideoDetailPage){
        //   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
        // }
        print('进入前台');
        break;
      case AppLifecycleState.paused: //进入后台
        print('进入后台');
        break;
      case AppLifecycleState.detached: //App被结束
        print("app被结束了");
        break;
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      init: MainController(),
      builder: (controller) => Scaffold(
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller.pageController,
          onPageChanged: controller.onPageChanged,
          children: const [
            HomePage(),
            RankingPage(),
            FavoritePage(),
            MinePage(),
          ],
        ),
        bottomNavigationBar: GetBuilder<MainController>(
          id: 'navigation',
          builder: (controller) => BottomNavigationBar(
            currentIndex: controller.currentPage,
            onTap: (page) {
              // if (page != 0 && !UserStore.to.isLogin) {
              //   Get.toNamed(Routes.l);
              // } else {
              //   controller.pageController.jumpToPage(page);
              // }
              controller.pageController.jumpToPage(page);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home),
                label: '首页',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.local_fire_department_outlined),
                activeIcon: Icon(Icons.local_fire_department),
                label: '排行榜',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outline),
                activeIcon: Icon(Icons.favorite),
                label: '收藏',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                activeIcon: Icon(Icons.person),
                label: '我的',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
