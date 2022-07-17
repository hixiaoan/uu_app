part of ranking;

class RankingContentPage extends StatefulWidget {
  final String tapName;
  const RankingContentPage({Key? key, required this.tapName}) : super(key: key);

  @override
  State<RankingContentPage> createState() => _RankingContentPageState();
}

class _RankingContentPageState extends State<RankingContentPage>
    with AutomaticKeepAliveClientMixin {
  int pageIndex = 1;
  bool isLoading = false;
  RankingModel? model;
  ScrollController scrollController = ScrollController();
  bool startLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(() {
      /// 最大滚动距离-已经滚动的距离
      var dis = scrollController.position.maxScrollExtent -
          scrollController.position.pixels;
      if (dis < 200 && !isLoading) {
        requestData(loadMore: true);
      }
    });
    requestData();
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      removeTop: true,
      context: context,
      child: _buildChildWidget(),
    );
  }

  _buildChildWidget() {
    if (model == null) {
      return Container();
    } else {
      return RefreshIndicator(
        color: primary,
        onRefresh: requestData,
        child: LoadingContainer(
          start: isLoading,
          child: ListView.separated(
            controller: scrollController,
            itemCount: model!.list.length,
            itemBuilder: (ctx, index) {
              return InkWell(
                onTap: () {
                  Get.toNamed(RouterName.VideoDetail,
                          arguments: model!.list[index].vid)
                      ?.then((_) {
                    SystemChrome.setSystemUIOverlayStyle(
                        SystemUiOverlayStyle.dark);
                  });
                },
                child: Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: ItmePage(
                      videoInfo: model!.list[index],
                    )),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              if (index == model!.list.length - 1) {
                return Container();
              } else {
                return SizedBox(
                    height: 0.5,
                    child: Row(
                      children: [
                        const SizedBox(width: 10),
                        Expanded(
                            child: Container(
                          color: Colors.grey[400],
                        )),
                        const SizedBox(
                          width: 10,
                        )
                      ],
                    ));
              }
            },
          ),
        ),
      );
    }
  }

  Future<void> requestData({bool loadMore = false}) async {
    if (isLoading) return;
    if (loadMore) {
      pageIndex++;
    } else {
      pageIndex = 1;
    }
    setState(() {
      isLoading = true;
    });
    RankingDao.reuestData(widget.tapName, pageIndex: pageIndex).then((value) {
      setState(() {
        if (loadMore) {
          model!.list.addAll(value.list);
        } else {
          model = value;
        }
      });
    }).whenComplete(() {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
