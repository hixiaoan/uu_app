part of widgets;

class RefresherView extends StatelessWidget {
  final Widget child;
  final VoidCallback onRefresh;
  final VoidCallback onLoading;
  final RefreshController controller;

  const RefresherView({
    Key? key,
    required this.child,
    required this.onRefresh,
    required this.onLoading,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: WaterDropHeader(),
        footer: CustomFooter(
          builder: (context, mode) {
            Widget body;
            if (mode == LoadStatus.idle) {
              body = Text("上拉加载");
            } else if (mode == LoadStatus.loading) {
              body = CupertinoActivityIndicator();
            } else if (mode == LoadStatus.failed) {
              body = Text("加载失败！点击重试！");
            } else if (mode == LoadStatus.canLoading) {
              body = Text("松手,加载更多!");
            } else {
              body = Text("没有更多数据了!");
            }
            return Container(
              height: 55.0,
              child: Center(child: body),
            );
          },
        ),
        controller: controller,
        onRefresh: onRefresh,
        onLoading: onLoading,
        child: child);
  }
}
