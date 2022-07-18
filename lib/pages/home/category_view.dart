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
                      : GridView.builder(
                      itemCount:vc.videoList.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 8,
                                    mainAxisSpacing: 8,
                                    childAspectRatio: 0.8),
                    itemBuilder: (BuildContext context, int index) {
                        return VideoItem(model: vc.videoList[index]);
                    },


              ));
            },
          )),
    );
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
