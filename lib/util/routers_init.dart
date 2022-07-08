
import 'package:flutter/material.dart';
import 'package:uu_app/mian_page/main_page.dart';
import 'package:uu_app/modules/home_module/child_pages/banner_detail.dart';
import 'package:uu_app/modules/home_module/child_pages/video_detail_page.dart';
import 'package:uu_app/modules/login_module/pages/login_page.dart';
import 'package:uu_app/modules/login_module/pages/reigster_page.dart';

Map<String, WidgetBuilder> uuAppRoutersInit () {

  return {
    ///主页
    MainWidget.routerMainName:(ctx)=>const MainWidget(),
    ///首页模块
    UUBannerDetail.routerName:(ctx)=>const UUBannerDetail(),
    ///排行模块
    ///收藏模块
    ///我的模块
    ///登录模块
    LoginPage.routerName:(ctx)=>const LoginPage(),
    ReigsterPage.routerName:(ctx)=>const ReigsterPage(),
  };

}