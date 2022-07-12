
part of widgets;

class ItmePage extends StatefulWidget {
  final VideoInfo videoInfo;
  const ItmePage({Key? key, required this.videoInfo}) : super(key: key);

  @override
  State<ItmePage> createState() => _ItmePageState();
}

class _ItmePageState extends State<ItmePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          _buildLeftImage(),
          _buildMindTextInfo(),
          const SizedBox(width: 10,)
        ],
      ),
    );
  }

  _buildLeftImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
        child: Stack(children:[
        
          CustomImage(url: widget.videoInfo.cover, type: CustomImageType.network,height: 100.h,width: 150.w,),
          Positioned(
            right: 5,
            bottom: 5,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                gradient: const LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.center,
                  colors: [ Colors.black38, Colors.black38, Colors.black38]
                )
              ),
              padding: const EdgeInsets.all(2),
              child: Text(durationTransform(widget.videoInfo.duration),textAlign: TextAlign.end,style: const TextStyle(color: Colors.white),),
            )
          )
        ])
    );
  }

  _buildMindTextInfo() {
    return Expanded(
      child: Container(
        height: 100,
        padding: const EdgeInsets.only(left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(height: 2),
            Text(widget.videoInfo.title,
              maxLines: 2,overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.black54,fontSize: 15,fontWeight: FontWeight.bold),),
            const Expanded(child: SizedBox()),
            _buildUpInfo(),
            const SizedBox(height: 5,),
            _buildAuthorOtherInfo(),
            const SizedBox(height: 5,)
          ],
        ),
      ),
    );
  }

  _buildUpInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Icon(Icons.person,size: 20,color: Colors.grey,),
        const SizedBox(width: 5,),
        Text(widget.videoInfo.owner!.name,style: const TextStyle(fontSize: 13,fontWeight: FontWeight.bold,color: Colors.grey),)
      ],
    );
  }

  _buildAuthorOtherInfo(){
    return Padding(
      padding: const EdgeInsets.only(left: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildItems(Icons.live_tv, countFormat(widget.videoInfo.view)),
          const SizedBox(width: 8,),
          _buildItems(Icons.favorite, countFormat(widget.videoInfo.favorite)),
        ],
      ),
    );
  }

  _buildItems(IconData? icon,String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (icon != null)Icon(icon,size: 15,color: Colors.grey),
        Padding(
          padding: const EdgeInsets.only(left: 2),
          child: Text(title,
            style: const TextStyle(color: Colors.grey,fontSize: 10),),)
      ],
    );
  }

}
