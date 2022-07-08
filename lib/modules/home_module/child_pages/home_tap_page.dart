
import 'package:flutter/material.dart';
import 'package:uu_app/modules/home_module/child_pages/video_item.dart';
import 'package:uu_app/util/color.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../widgets/loading_page.dart';
import '../../../util/toast_util.dart';
import '../../../uu_http_services/core/uu_net_error.dart';
import '../../../widgets/banner_widget/banner_page.dart';
import '../../../widgets/banner_widget/core/banner_model.dart';
import '../model/home_model.dart';
import '../uu_home_dao.dart';

class UUHomeTabPage extends StatefulWidget {

  final String categoryName;

  final List<BannerModel> bannerList;
  const UUHomeTabPage({Key? key, required this.categoryName, required this.bannerList }) : super(key: key);

  @override
  State<UUHomeTabPage> createState() => _UUHomeTabPageState();
}
///AutomaticKeepAliveClientMixin使列表常驻线程
class _UUHomeTabPageState extends State<UUHomeTabPage> with AutomaticKeepAliveClientMixin {

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
    return UUBannerPage(
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
      HomeModel model = await UUHomeDao.requestData(widget.categoryName,pageIndex: pageIndex,pageSize: 10);
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

    } on UULoginError catch (e){
      setState(() {
        showLoading = false;
      });
      isLoadin = false;
      pageIndex--;
      showWarnToast(e.message);
    } on UUAuthError catch(e){
      setState(() {
        showLoading = false;
      });
      isLoadin = false;
      pageIndex--;
      showWarnToast(e.message);
    } on UUNetError catch(e){
      setState(() {
        showLoading = false;
      });
      isLoadin = false;
      pageIndex--;
      showWarnToast(e.message);
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

