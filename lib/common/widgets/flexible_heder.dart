
part of widgets;


class FlexibleHeaderContainer extends StatefulWidget {


  const FlexibleHeaderContainer({Key? key, required this.ttile, required this.imageUrl, required this.scrollController}) : super(key: key);
  final String ttile;
  final String imageUrl;
  final ScrollController scrollController;
  @override
  State<FlexibleHeaderContainer> createState() => _FlexibleHeaderContainerState();
}

class _FlexibleHeaderContainerState extends State<FlexibleHeaderContainer> {

  final double max_bottom = 50;
  final double min_bottom = 10;
  final double max_scrollOffSet = 80;
  ///开始的bottom
  double currentBottom = 50;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.scrollController.addListener(() {
      var offset = widget.scrollController.offset;
      var ratio = (max_scrollOffSet - offset)/max_scrollOffSet;
      ///bottom差值
      var df = ratio * (max_bottom  - min_bottom);
      if(df > (max_bottom  - min_bottom)){
        df = (max_bottom  - min_bottom);
      }else if (df < 0){
            df = 0;
      }

      setState(() {
        currentBottom = df + min_bottom;
        print("bootom:$currentBottom");
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20,bottom: currentBottom),
      child: Row(
        children:[
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: CustomImage.network(
                url: widget.imageUrl,
                height: 50,
                width: 50
            ),
          ),
          const SizedBox(width: 10,),
          Text(widget.ttile,style: const TextStyle(color: Colors.black ,fontSize: 14,fontWeight: FontWeight.bold),)
        ],
      ),
    );;
  }
}
