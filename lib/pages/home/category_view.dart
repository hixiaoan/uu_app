part of home;

class CategoryView extends StatefulWidget {
  final String vcTag;
  const CategoryView({Key? key, required this.vcTag}) : super(key: key);

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

///AutomaticKeepAliveClientMixin使列表常驻线程
class _CategoryViewState extends State<CategoryView>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    print('controller : ${Get.find<HomeContentVC>(tag: widget.vcTag)}');
    super.build(context);
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 2),
      child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: GetBuilder<HomeContentVC>(
            tag: widget.vcTag,
            init: HomeContentVC(widget.vcTag),
            builder: (vc) {
              return RefresherView(
                  controller: vc.refreshController,
                  onRefresh: vc.onRefresh,
                  onLoading: vc.onLoading,
                  child: vc.videoList == null
                      ? Container()
                      : CustomScrollView(
                          slivers: [
                            if (vc.bannerList != null)
                              _buildBanner(vc.bannerList!),
                            SliverGrid(
                                delegate:
                                    SliverChildBuilderDelegate((ctx, index) {
                                  return VideoItem(model: vc.videoList[index]);
                                }, childCount: vc.videoList.length),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 8,
                                        mainAxisSpacing: 8,
                                        childAspectRatio: 0.9)),
                          ],
                        ));
            },
          )),
    );
  }

  Widget _buildBannerView(List<BannerList> list) {
    return SliverList(
        delegate: SliverChildBuilderDelegate((ctx, index) {
      return BannerView(bannerList: list, height: 140);
    }, childCount: 1));
  }

  _buildBanner(List<BannerList> list) {
    return BannerView(bannerList: list, height: 140);
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
