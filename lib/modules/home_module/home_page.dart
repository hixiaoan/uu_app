


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:underline_indicator/underline_indicator.dart';
import 'package:uu_app/modules/home_module/child_pages/home_tap_page.dart';
import 'package:uu_app/modules/home_module/child_pages/video_detail_page.dart';
import 'package:uu_app/modules/home_module/model/home_model.dart';
import 'package:uu_app/modules/home_module/uu_home_dao.dart';
import 'package:uu_app/modules/login_module/pages/login_page.dart';
import 'package:uu_app/util/color.dart';
import 'package:uu_app/util/event.dart';
import 'package:uu_app/util/navigationbar_util.dart';
import 'package:uu_app/util/router_util.dart';
import 'package:uu_app/util/toast_util.dart';
import 'package:uu_app/widgets/uu_tab_page.dart';
import '../../uu_http_services/core/uu_net_error.dart';
import '../../widgets/banner_widget/core/banner_model.dart';

class UUHomePage extends StatefulWidget {
  const UUHomePage({Key? key}) : super(key: key);

  @override
  State<UUHomePage> createState() => _UUHomePageState();
}

class _UUHomePageState extends State<UUHomePage>  with TickerProviderStateMixin,WidgetsBindingObserver{

   List<CategoryList> categoryList = [];
   HomeModel? _model;
   List<BannerModel> bannerList = [];
   late TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: categoryList.length, vsync: this);
    loadData();
    ///前台和后台
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
    ///监听app的生命周期
    switch (state){
      case AppLifecycleState.inactive://正在使用
      print("正在使用");
        break;
      case AppLifecycleState.resumed://从后台进入前台
      ///这是安卓的问题
      if (this is VideoDetailPage){
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
      }
      print('进入前台');
        break;
      case AppLifecycleState.paused://进入后台
      print('进入后台');
        break;
      case AppLifecycleState.detached://App被结束
      print("app被结束了");
        break;

    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    WidgetsBinding.instance.removeObserver(this);
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        UUNavigationBar(child: _buildNavigationChildWidget()),
        _buildTopTabBar(),
        _buildTabBarView()
      ],
    ));
  }


  _buildTopTabBar() {
    return UUTabWidget(
        unselectedLabelColor: Colors.grey,
        list: categoryList,
        tabs: categoryList.map<Tab>((e) {
          return Tab(child: Text(e.name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ));
        }).toList(),
        tabController: _tabController);
  }

  _buildTabBarView(){
    return Flexible(
        child: TabBarView(
          controller: _tabController,
          children: categoryList.map((e) {
            if (e.name != "推荐") {
              bannerList = [];
            }
            return UUHomeTabPage(
              categoryName: e.name,
              bannerList: bannerList,
            );
          }).toList(),
        ));
  }

  void loadData() async {

    try{
        _model = await UUHomeDao.requestData("推荐");
      if (_model?.categoryList?.length != null){
        _tabController = TabController(length: _model!.categoryList!.length, vsync: this);
      }
      setState(() {
        if (_model?.categoryList?.length != null) {
          categoryList = _model!.categoryList!;
          bannerList = _model!.bannerList!;
        }
      });

    } on UULoginError catch (e){
      UURouter.pushNamed(LoginPage.routerName).then((value){
        loadData();
      });
    } on UUAuthError catch(e){
      showWarnToast(e.message);
    } on UUNetError catch(e){
      showWarnToast(e.message);
    }
  }

  Widget _buildNavigationChildWidget() {
    return Padding(
      padding: const EdgeInsets.only(right: 15, left: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(23),
            child:
                GestureDetector(
                  onTap: (){
                    eventBus.fire(SelectedTabBarEvent(3));
                  },
                    child: Image.asset("assets/images/avatar.png", width: 40, height: 40)),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(right: 15, left: 15),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Container(
                padding: const EdgeInsets.only(left: 10),
                alignment: Alignment.centerLeft,
                color: Colors.grey[100],
                height: 32,
                child: const Icon(
                  Icons.search,
                ),
              ),
            ),
          )),
          const Icon(
            Icons.explore_outlined,
            size: 23,
            color: Colors.grey,
          ),
          const SizedBox(width: 10),
          const Icon(Icons.email_outlined, color: Colors.grey, size: 23)
        ],
      ),
    );
  }
}

