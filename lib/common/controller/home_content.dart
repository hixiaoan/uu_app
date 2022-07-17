part of app_controller;

class HomeContentVC extends GetxController {
  var videoList = <VideoModel>[];
  List<BannerList>? bannerList;
  final categoryName;
  HomeContentVC(this.categoryName);

  var currentPageNum = 0;
  final RefreshController refreshController = RefreshController(
    initialRefresh: true,
  );

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void onRefresh() async {
    currentPageNum = 0;
    try {
      HomeModel model =
          await HomeDao.requestData(categoryName, pageIndex: currentPageNum);
      videoList = model.videoList!;
      bannerList = model.bannerList;
      update();
      refreshController.refreshCompleted(resetFooterState: true);
    } catch (error) {
      refreshController.refreshFailed();
    }
  }

  void onLoading() async {
    ///后台返回总页数，再做逻辑
    // if (_finish) {
    //   refreshController.loadNoData();
    //   return;
    // }
    currentPageNum++;
    try {
      HomeModel model =
          await HomeDao.requestData(categoryName, pageIndex: currentPageNum);
      if (model.videoList != null) {
        videoList.addAll(model.videoList!);
      }

      update();
      refreshController.loadComplete();
    } catch (error) {
      currentPageNum--;
      refreshController.loadFailed();
    }
  }
}
