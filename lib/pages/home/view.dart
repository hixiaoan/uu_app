part of home;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;
  final controller = Get.put(HomeController());

  @override
  void dispose() {
    // TODO: implement dispose

    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: controller.obx(
      (state) => _buildBody(),
      onEmpty: const Center(
        child: Text('没有数据'),
      ),
      onError: (error) => Center(
        child: Text(error!),
      ),
    ));
  }

  Widget _buildBody() {
    _tabController = TabController(
        length: controller.homeTabModels.value.categoryList!.length,
        vsync: this);
    return Column(
      children: [
        UUNavigationBar(child: _buildNavigationChildWidget()),
        _buildTopTabBar(),
        _buildTabBarView()
      ],
    );
  }

  Widget _buildTopTabBar() {
    return UUTabWidget(
        unselectedLabelColor: Colors.grey,
        list: controller.homeTabModels.value.categoryList!,
        tabs: controller.homeTabModels.value.categoryList!.map<Tab>((e) {
          return Tab(
              child: Text(
            e.name,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ));
        }).toList(),
        tabController: _tabController);
  }

  Widget _buildTabBarView() {
    return Flexible(
        child: TabBarView(
      controller: _tabController,
      children: controller.homeTabModels.value.categoryList!.map((e) {
        Get.put(tag: e.name, HomeContentVC(e.name));
        return CategoryView(
          vcTag: e.name,
        );
      }).toList(),
    ));
  }

  Widget _buildNavigationChildWidget() {
    return Padding(
      padding: const EdgeInsets.only(right: 15, left: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(23),
            child: GestureDetector(
                onTap: () {
                  // eventBus.fire(SelectedTabBarEvent(3));
                },
                child: Image.asset("assets/images/avatar.png",
                    width: 40, height: 40)),
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
