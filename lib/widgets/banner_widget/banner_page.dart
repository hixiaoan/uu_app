

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:uu_app/modules/home_module/child_pages/banner_detail.dart';
import 'package:uu_app/util/router_util.dart';

import 'core/banner_model.dart';
// class UUBannerPage<T extends BannerModel>{
//
// }

class UUBannerPage extends StatefulWidget {
  final List<BannerModel> bannerList;
  final double height;
  const UUBannerPage({
    Key? key,
    required this.bannerList,
    this.height = 160,
  }) : super(key: key);

  @override
  State<UUBannerPage> createState() => _UUBannerPageState();
}

class _UUBannerPageState extends State<UUBannerPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      child: Swiper(
        autoplay: true,
        itemCount: widget.bannerList.length,
        pagination: const SwiperPagination(
          alignment: Alignment.bottomRight,
              margin: EdgeInsets.only(right:20,bottom: 10),
        builder: DotSwiperPaginationBuilder(
          color: Colors.white60,size: 6,activeSize: 6
        )
        ),
        itemBuilder: (ctx,index){
          return GestureDetector(
            onTap: (){
              final title = widget.bannerList[index].subTitle();
              UURouter.pushNamed(UUBannerDetail.routerName,arguments: title);
            },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                  child: Image.network(widget.bannerList[index].bannerimageUrl(),fit: BoxFit.cover)));
        },
      ),
    );
  }
}
