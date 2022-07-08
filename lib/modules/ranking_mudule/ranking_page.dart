

import 'package:flutter/material.dart';
import 'package:uu_app/modules/ranking_mudule/rank_net.dart';
import 'package:uu_app/modules/ranking_mudule/model/ranking_model.dart';
import 'package:uu_app/util/color.dart';
import 'package:uu_app/uu_http_services/core/uu_net_error.dart';

import '../../util/navigationbar_util.dart';
import '../../widgets/uu_tab_page.dart';
import '../home_module/child_pages/author_item_page.dart';
import 'child_pages/ranking_contentPage.dart';


class UURankingPage extends StatefulWidget {
  const UURankingPage({Key? key}) : super(key: key);

  @override
  State<UURankingPage> createState() => _UURankingPageState();
}

class _UURankingPageState extends State<UURankingPage>  with TickerProviderStateMixin{

  final categoryList = ['最热','最新','收藏'];
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: categoryList.length, vsync: this);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          UUNavigationBar(child: _buildTopTabBar()),
           _buildTabBarView()
        ],
      ),
    );
  }

  _buildTopTabBar() {
    return Center(
      child: UUTabWidget(
          unselectedLabelColor: Colors.grey,
          seletedLabeColor: primary,
          list: categoryList,
          tabs: categoryList.map<Tab>((e) {
            return Tab(child: Text(e, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ));
          }).toList(),
          tabController: _tabController),
    );
  }

  _buildTabBarView(){
    return Flexible(
      child: TabBarView(
        controller: _tabController,
        children: categoryList.map((tapName) {
          return RankingContentPage(tapName: tapName,);
        }).toList(),
      ),
    );
  }

}


