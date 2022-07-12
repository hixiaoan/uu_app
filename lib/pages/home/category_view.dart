

part of home;

class CategoryView extends StatefulWidget {

  final String categoryName;

  final List<BannerModel> bannerList;
  const CategoryView({Key? key, required this.categoryName, required this.bannerList }) : super(key: key);

  @override
  State<CategoryView> createState() => _CategoryViewState();
}
///AutomaticKeepAliveClientMixin使列表常驻线程
class _CategoryViewState extends State<CategoryView> with AutomaticKeepAliveClientMixin {

  List videoList = [];
  int pageIndex = 0;
  ScrollController controller = ScrollController();
  bool isLoadin = false;

  ///一开始是要显示的
  bool showLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(() {
      /// 最大滚动距离-已经滚动的距离
      var dis = controller.position.maxScrollExtent - controller.position.pixels;
      if (dis < 200 && !isLoadin){
        loadData(lodMore: true);
      }
    });
    loadData();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 2),
      child: RefreshIndicator(
        /// 下拉刷新
        onRefresh: loadData,
        color: primary,
        child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: LoadingContainer(
              start: showLoading,
              child: StaggeredGridView.countBuilder(
                  controller: controller,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  crossAxisCount: 2,
                  itemCount: videoList.length,
                  itemBuilder: (ctx, index) {
                    if (index == 0 && widget.bannerList.isNotEmpty){
                      return _buildBanner();
                    }
                    return VideoItem(model: videoList[index]);
                  },
                  staggeredTileBuilder: (index) {
                    if (widget.bannerList.isNotEmpty && index == 0) {
                      /// 撑满整行
                      return const StaggeredTile.fit(2);
                    } else {
                      return const StaggeredTile.fit(1);
                    }
                  }),
            )),
      ),
    );
  }


  _buildBanner() {
    return BannerView(
        bannerList: widget.bannerList,
        height: 140);
  }

  Future<void> loadData({lodMore = false}) async {
    if (isLoadin)return;
    isLoadin = true;
    if (!lodMore){
      pageIndex = 1;
    }else{
      pageIndex++;
    }
    try{
      HomeModel model = await HomeDao.requestData(widget.categoryName,pageIndex: pageIndex,pageSize: 10);
      setState(() {
        if (!lodMore){
           if (model.videoList != null){
             videoList = model.videoList!;
           }
        }else{
             videoList.addAll(model.videoList!);
           }
        showLoading = false;
        Future.delayed(Duration(seconds: 1),(){
          isLoadin = false;
        });
      });

    } on LoginError catch (e){
      setState(() {
        showLoading = false;
      });
      isLoadin = false;
      pageIndex--;
      CustomToast.fail(e.message);
    } on AuthError catch(e){
      setState(() {
        showLoading = false;
      });
      isLoadin = false;
      pageIndex--;
      CustomToast.fail(e.message);
    } on NetError catch(e){
      setState(() {
        showLoading = false;
      });
      isLoadin = false;
      pageIndex--;
       CustomToast.fail(e.message);
    }
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }
}

