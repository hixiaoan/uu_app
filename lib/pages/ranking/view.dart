
part of ranking;


class RankingPage extends StatefulWidget {
  const RankingPage({Key? key}) : super(key: key);

  @override
  State<RankingPage> createState() => _RankingPageState();
}

class _RankingPageState extends State<RankingPage>  with TickerProviderStateMixin{

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


