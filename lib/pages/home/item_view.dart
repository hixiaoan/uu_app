part of home;

class VideoItem extends StatefulWidget {
  final VideoModel model;
  const VideoItem({Key? key, required this.model}) : super(key: key);

  @override
  State<VideoItem> createState() => _VideoItemState();
}

class _VideoItemState extends State<VideoItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(RouterName.VideoDetail, arguments: widget.model.vid)
            ?.then((value) {
          SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
        });
      },
      child: SizedBox(
        height: 220,
        child: Card(
          shadowColor: Colors.white60,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _imageConfig(context),
                  _buildTitle(),
                  const Expanded(child: SizedBox()),
                  _buildUserInfo()
                ],
              )),
        ),
      ),
    );
  }

  _imageConfig(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(children: [
      CustomImage(
        type: CustomImageType.network,
        url: widget.model.cover,
        width: ((size.width - 20 - 8) / 2).h,
        height: 120.h,
      ),
      Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            padding:
                const EdgeInsets.only(left: 8, right: 8, bottom: 3, top: 5),
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.white54, Colors.transparent])),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildItems(Icons.live_tv, countFormat(widget.model.view)),
                _buildItems(
                    Icons.favorite_border, countFormat(widget.model.favorite)),
                // _buildItems(null, durationTransform(widget.model.duration))
              ],
            ),
          ))
    ]);
  }

  _buildItems(IconData? icon, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (icon != null) Icon(icon, size: 13, color: Colors.white),
        Padding(
          padding: const EdgeInsets.only(left: 4, top: 2),
          child: Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 13),
          ),
        )
      ],
    );
  }

  _buildTitle() {
    return Padding(
        padding: const EdgeInsets.only(top: 8, left: 5, right: 5),
        child: Text(
          widget.model.title,
          textAlign: TextAlign.left,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: Colors.black38, fontSize: 12),
        ));
  }

  _buildUserInfo() {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CustomImage(
              url: widget.model.owner.face,
              width: 24,
              height: 24,
              type: CustomImageType.network,
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                widget.model.owner.name,
                style: const TextStyle(fontSize: 12, color: Colors.black38),
              )),
          const Expanded(child: SizedBox()),
          const Icon(
            Icons.more_vert_rounded,
            size: 15,
            color: Colors.black38,
          )
        ],
      ),
    );
  }
}
