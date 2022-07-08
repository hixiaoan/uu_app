import 'package:flutter/material.dart';
import 'package:orientation/orientation.dart';
import 'package:uu_app/modules/home_module/child_pages/video_detail_page.dart';
import 'package:uu_app/util/cache_util.dart';
import 'package:uu_app/util/routers_init.dart';
import 'package:uu_app/uu_provider/providers.dart';
import 'package:uu_app/uu_provider/theme_provider.dart';

import 'mian_page/main_page.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';


final cache = UUCache.preInit();

void main() {

  ///获取设备信息,全屏
  WidgetsFlutterBinding.ensureInitialized();
  OrientationPlugin.setPreferredOrientations([DeviceOrientation.portraitUp]);
  OrientationPlugin.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  runApp(
      MultiProvider(
          providers: appRroviders,
          child: const MyApp()
          )

  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UUCache>(
        future: cache,
        builder: (context, snapshot) {

          StatefulWidget widget;
          if (snapshot.connectionState == ConnectionState.done){
            widget =  const MainWidget();
          }else{
            widget = const Scaffold(
              body:Center(
                child: Text("还在加载异步任务"),
              ),
            );
          }
          return Consumer<ThemeProvider>(builder:(ctx,provider,child){
            return MaterialApp(
              routes: uuAppRoutersInit(),
              onGenerateRoute: (settings){
                if (settings.name == VideoDetailPage.routerName){
                  return MaterialPageRoute(builder: (ctx){
                    return VideoDetailPage(videoId: settings.arguments as String);
                  });
                }
                return null;
              },
              darkTheme: provider.getThemeData(isDarkMode: true),
              themeMode: provider.getThemeMode(),
              theme: provider.getThemeData(),
              home: widget,
            );
          });
        });
  }
}

void testRegister() {

  // UULoginDao.register("faker_uzi", "18356087041", "10545853", "1587");
}

void testLogin() {

  // UULoginDao.login("faker_uzi", "18356087041");
}
