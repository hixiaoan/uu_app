part of video_detail;

// ignore: must_be_immutable
class VideoDetailPage extends StatefulWidget {
  String videoId = Get.arguments;
  VideoDetailPage({Key? key}) : super(key: key);

  @override
  State<VideoDetailPage> createState() => _VideoDetailPageState();
}

class _VideoDetailPageState extends State<VideoDetailPage>
    with TickerProviderStateMixin {
  final List list = ["简介", '评论288'];
  late TabController _tabController;
  bool startLoading = false;
  VideoDetaiModel? detailModel;
  final _barrageKey = GlobalKey<BarrageWidgetState>();
  bool isSendDanmu = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _tabController = TabController(length: list.length, vsync: this);

    ///设置安卓 黑色
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    loadDetaiInfo();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MediaQuery.removePadding(
            removeTop: Platform.isIOS,
            context: context,
            child: _buildEmptyView()));
  }

  _buildEmptyView() {
    if (detailModel == null) {
      return const Center(child: Text("数据为空"));
    } else {
      return LoadingContainer(
        start: startLoading,
        child: Column(
          children: [
            // if ( Platform.isIOS)
            UUNavigationBar(
              height: Platform.isAndroid ? 0 : 46,
              color: Colors.black,
              style: StausStyle.LIGHT_CONTENT,
              child: Container(),
            ),
            _buildVideoView(),
            _buildTopTabs(),
            _buildTabBarView()
          ],
        ),
      );
    }
  }

  _buildVideoView() {
    return VideoView(
      barrageUI: BarrageWidget(
        key: _barrageKey,
        vid: widget.videoId,
        autoPlay: true,
      ),
      allowMuting: true,
      playUrl: detailModel?.videoInfo.url ?? "",
      placeholder: CustomImage.network(
          height: MediaQuery.of(context).size.width / (16 / 9),
          width: MediaQuery.of(context).size.width,
          url: detailModel!.videoInfo.cover),
    );
  }

  _buildTopTabs() {
    return Material(
      elevation: 5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 39,
            child: UUTabWidget(
                seletedLabeColor: primary,
                unselectedLabelColor: Colors.grey,
                list: list,
                tabs: list.map<Tab>((e) {
                  return Tab(
                      child: Text(e,
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)));
                }).toList(),
                tabController: _tabController),
          ),
          GestureDetector(
            onTap: _sendDanMuAction,
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(15)),
                width: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(child: Text(isSendDanmu ? "正在编辑弹幕" : "点击发送弹幕")),
                    const Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: Icon(
                        Icons.live_tv,
                        size: 25,
                        color: primary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  _buildTabBarView() {
    return Flexible(
        child: TabBarView(
            controller: _tabController,
            children: list.map<Widget>((e) {
              if (e == "简介") {
                detailModel!.videoInfo.isLike = detailModel!.isLike;
                detailModel!.videoInfo.isFavorite = detailModel!.isFavorite;
                return AuthorPage(
                  detailModel: detailModel!,
                  onTap: (vid) {
                    widget.videoId = vid;
                    loadDetaiInfo();
                  },
                );
              } else {
                return Center(child: Text(e));
              }
            }).toList()));
  }

  void loadDetaiInfo() {
    if (startLoading) return;
    setState(() {
      startLoading = true;
    });
    VideoDetailDao.requestVideoDetaiData(widget.videoId).then((model) {
      // ignore: unnecessary_null_comparison
      if (model != null) {
        detailModel = model;
      } else {
        print("视频详情请求失败:$detailModel");
      }
    }).whenComplete(() {
      setState(() {
        startLoading = false;
      });
    });
  }

  void _sendDanMuAction() {
    HiOverlay.show(context,
        child: BarrageInput(
          editingCallBack: () {
            setState(() {
              isSendDanmu = true;
            });
          },
          onTabClose: () {
            setState(() {
              isSendDanmu = false;
            });
          },
        )).then((value) {
      isSendDanmu = false;
      if (value != null) {
        _barrageKey.currentState!.send(value);
      }
    });
  }
}
