
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uu_app/modules/favorite_module/favorite_page.dart';
import 'package:uu_app/modules/home_module/home_page.dart';
import 'package:uu_app/modules/mine_module/mine_page.dart';
import 'package:uu_app/modules/ranking_mudule/ranking_page.dart';
import 'package:uu_app/util/color.dart';
import 'package:uu_app/util/event.dart';
import 'package:uu_app/util/router_util.dart';



class MainWidget extends StatefulWidget {

  static const routerMainName = "/MainWidget";

  const MainWidget({Key? key}) : super(key: key);

  @override
  State<MainWidget> createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FToast().init(context);
    UURouter.instance.init(context);
    eventBus.on<SelectedTabBarEvent>().listen((event) {
       setState(() {
         _currenIndex = event.currentIndex;
       });
    });
  }


  var _currenIndex = 0;
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currenIndex,
        selectedFontSize: 15,
        unselectedFontSize: 15,
        selectedItemColor: primary,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: [
          createItem(Icons.home, "首页"),
          createItem(Icons.local_fire_department, '排行榜'),
          createItem(Icons.favorite, '收藏'),
          createItem(Icons.live_tv, '我的')
        ],
        onTap: (index){
          setState(() {
            _currenIndex = index;
          });

        },
      ),
      body: IndexedStack(
        index: _currenIndex,
        children: buildModules(),
      ),
    );
  }


  List <Widget> buildModules(){
    if (_currenIndex == 0){
      return [const UUHomePage()];
    }else {
      return const [
        UUHomePage(),
        UURankingPage(),
        UUFavoritePage(),
        UUMinePage()
      ];
    }
  }
}

BottomNavigationBarItem createItem(IconData iconData,String title){

  return BottomNavigationBarItem(
    label: title,
    icon:Icon(iconData,color: Colors.grey,),
    activeIcon:Icon(iconData,color: primary),
  );
}