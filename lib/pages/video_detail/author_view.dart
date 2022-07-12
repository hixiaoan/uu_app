

part of video_detail;

class AuthorHeaderPage extends StatefulWidget {

  final VideoInfo videoInfo;
  const AuthorHeaderPage({Key? key, required this.videoInfo,}) : super(key: key);

  @override
  State<AuthorHeaderPage> createState() => _AuthorHeaderPageState();
}

class _AuthorHeaderPageState extends State<AuthorHeaderPage> with SingleTickerProviderStateMixin {

  late AnimationController _animationController;
  late  Animation<double> _animation;
  String title = "注意： 在某些情况下，值(position，值动画的当前值)可能会超出AnimationController的0.0-1.0的范围。例如，fling()函数允许您提供速度(velocity)、力量(force)、position(通过Force对象)。位置(position)可以是任何东西，因此可以在0.0到1.0范围之外。 CurvedAnimation生成的值也可以超出0.0到1.0的范围。根据选择的曲线，CurvedAnimation的输出可以具有比输入更大的范围。例如，Curves.elasticIn等弹性曲线会生成大于或小于默认范围的值。";
  int lins = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =  AnimationController(vsync: this,duration: const Duration(milliseconds: 500));
    _animation = Tween<double>(begin: 0.0,end:0.5 ).animate(_animationController);

  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildAuthorInfo(),
        _buidlAuthorDescription(),
        _buildAuthorOtherInfo(),
        _buildTabBarItem()
      ],
    );
  }

  _buildAuthorInfo() {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: CustomImage.network(
                url: widget.videoInfo.owner!.face,
                width: 40,
                height: 40
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.videoInfo.owner!.name,
                  style: const TextStyle(
                      color: primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                const SizedBox(height: 2,),
                Text(
                  "${countFormat(widget.videoInfo.owner!.fans)}粉丝",
                  style: const TextStyle(color: Colors.grey,fontSize: 13),
                )
              ],
            ),
          ),
          const Expanded(child: SizedBox()),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: TextButton(
                onPressed: () {},
                child: Container(

                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: primary,
                  ),
                  child: const Text(
                    "+ 关注",
                    style: TextStyle(
                        color: Colors.white,fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                )),
          )
        ],
      ),
    );
  }

  _buidlAuthorDescription(){
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
                widget.videoInfo.desc!,
                maxLines: lins,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color:Colors.black,fontSize: 18)),
          ),

          Padding(
            padding: const EdgeInsets.only(right: 0),
            child: GestureDetector(
              onTap: (){

                if (_animationController.isAnimating) return;
                  if (_animationController.status == AnimationStatus.forward){
                    _animationController.forward();
                  }else if(_animationController.status == AnimationStatus.completed){
                    _animationController.reverse();
                  }else{
                    _animationController.forward();
                  }
                setState(() {
                  lins =  lins == 1? 1000000: 1;
                });
              },
                child: RotationTransition(
                  turns: _animation,
                    child: const Icon(Icons.arrow_drop_down_sharp ,size: 30,color: Colors.grey,))),
          )
        ],
      ),
    );
  }

  _buildAuthorOtherInfo(){
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildItems(Icons.live_tv, countFormat(widget.videoInfo.view)),
          const SizedBox(width: 8,),
          _buildItems(Icons.favorite, countFormat(widget.videoInfo.favorite)),
          const SizedBox(width: 16,),
          _buildItems(null, durationTransform(widget.videoInfo.duration))
        ],
      ),
    );
  }

  _buildItems(IconData? icon,String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (icon != null)Icon(icon,size: 20,color:Colors.grey),
        Padding(
          padding: const EdgeInsets.only(left: 2),
          child: Text(title,
            style: const TextStyle(color: Colors.grey,fontSize: 13),),)
      ],
    );
  }

  _buildTabBarItem() {
    return Padding(
        padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: _kudosAction,
            child:_buildTabBarItemInfo(Icons.thumb_up, countFormat(widget.videoInfo.like),color: widget.videoInfo.isLike == true ?  primary:Colors.grey),
          ),
          GestureDetector(
            onTap: (){
              CustomToast.text("接口未完成");
            },
            child: _buildTabBarItemInfo(Icons.thumb_down, "不喜欢",color:Colors.grey),
          ),

          GestureDetector(
            onTap: (){
              CustomToast.text("货币功能待开发");
            },
            child: _buildTabBarItemInfo(Icons.monetization_on, countFormat(widget.videoInfo.coin!)),
          ),

          ///收藏
          GestureDetector(
            onTap: _favoriteAction,
            child: _buildTabBarItemInfo(Icons.star, countFormat(widget.videoInfo.favorite),color: widget.videoInfo.isFavorite?primary:Colors.grey),
          ),

          GestureDetector(
            onTap: (){
              CustomToast.text("分享功能待开发");
            },
            child: _buildTabBarItemInfo(Icons.share, countFormat(widget.videoInfo.share!)),
          )

        ],
      )
    );

  }

  _buildTabBarItemInfo(IconData iconData,String num,{Color color = Colors.grey}){
    return Column(
      children: [
        Icon(iconData,size: 25,color: color),
        const SizedBox(height: 5,),
        Text(num,style: const TextStyle(color: Colors.grey),),
        const SizedBox(height: 10,)
      ],
    );
  }

  _kudosAction(){

    if (widget.videoInfo.isLike){
      VideoDetailDao.kudosRequest(widget.videoInfo.vid!,isCancel: true)
          .then((value){
            widget.videoInfo.like-=1;
            CustomToast.text(value.msg);
            setState(() {
              widget.videoInfo.isLike  = false;
            });
      } );
    }else{
      VideoDetailDao.kudosRequest(widget.videoInfo.vid!).then((value){
        widget.videoInfo.like+=1;
       CustomToast.text(value.msg);
        setState(() {
          widget.videoInfo.isLike  = true;
        });
      });
    }

  }

  _favoriteAction(){
    if (widget.videoInfo.isFavorite){
      VideoDetailDao.favoriteRequest(widget.videoInfo.vid!,isFavoriteRequest: false).then((model){
        widget.videoInfo.favorite-=1;
     CustomToast.text(model.msg);
        setState(() {
          widget.videoInfo.isFavorite  = !widget.videoInfo.isFavorite;
        });
      });
    }else{
      VideoDetailDao.favoriteRequest(widget.videoInfo.vid!).then((mode){
        widget.videoInfo.favorite+=1;
        CustomToast.text(mode.msg);
        setState(() {
          widget.videoInfo.isFavorite  = !widget.videoInfo.isFavorite;
        });
      });
    }

  }
}
