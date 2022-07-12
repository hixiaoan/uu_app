

part of widgets;


class BannerView extends StatefulWidget {
  final List<BannerModel> bannerList;
  final double height;
  const BannerView({
    Key? key,
    required this.bannerList,
    this.height = 160,
  }) : super(key: key);

  @override
  State<BannerView> createState() => _BannerViewState();
}

class _BannerViewState extends State<BannerView> {
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
              Get.toNamed<String>(RouterName.Banner,arguments: title);
            },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                  child: Image.network(widget.bannerList[index].bannerimageUrl(),fit: BoxFit.cover)));
        },
      ),
    );
  }
}
