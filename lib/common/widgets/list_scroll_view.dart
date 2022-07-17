part of widgets;

class CustomListScrollView extends StatelessWidget {
  final bool enableSafeArea;
  final bool safeAreaLeft;
  final bool safeAreaRight;
  final bool safeAreaTop;
  final bool safeAreaBottom;
  final EdgeInsets minimum;
  final List<Widget> slivers;
  final NullableIndexedWidgetBuilder builder;
  final int? childCount;
  final RefreshController? refreshController;
  final void Function()? onRefresh;
  final void Function()? onLoading;

  const CustomListScrollView({
    Key? key,
    required this.builder,
    this.refreshController,
    this.enableSafeArea = true,
    this.safeAreaLeft = true,
    this.safeAreaRight = true,
    this.safeAreaTop = true,
    this.safeAreaBottom = true,
    this.minimum = EdgeInsets.zero,
    this.childCount,
    this.onRefresh,
    this.onLoading,
    this.slivers = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget sliverList = SliverList(
      delegate: SliverChildBuilderDelegate(
        builder,
        childCount: childCount,
      ),
    );

    if (enableSafeArea) {
      sliverList = SliverSafeArea(
        left: safeAreaLeft,
        right: safeAreaRight,
        top: safeAreaTop,
        bottom: safeAreaBottom,
        minimum: minimum,
        sliver: sliverList,
      );
    }

    Widget scrollView = CustomScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      slivers: [...slivers, sliverList],
    );

    if (refreshController != null) {
      scrollView = SmartRefresher(
        enablePullDown: onRefresh != null,
        enablePullUp: onLoading != null,
        onRefresh: () {
          if (refreshController!.isLoading) {
            refreshController!.refreshToIdle();
            return;
          }
          onRefresh?.call();
        },
        onLoading: () {
          if (refreshController!.isRefresh) {
            refreshController!.loadComplete();
            return;
          }
          onLoading?.call();
        },
        controller: refreshController!,
        child: scrollView,
      );
    }

    return scrollView;
  }
}
