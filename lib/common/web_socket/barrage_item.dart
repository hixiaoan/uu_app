

part of web_socket;
class BarrageItem extends StatelessWidget {
  BarrageItem(
      {Key? key,
      required this.id,
      required this.top,
      required this.playCompleted,
      required this.useerModel,
      this.duration = const Duration(seconds: 9), required this.child})
      : super(key: key);

  final String id;
  final double top;
  final BarrageModel useerModel;
  ValueChanged<String> playCompleted;
  final Duration duration;
  final Widget child;

  ///动画错乱 就是为了防止element被复用
  var  _key = GlobalKey<BarrageTransionState>();

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      top: top,
      child: BarrageTransion(
        key: _key,
        duration: duration,
        onCompleted: (_){
          playCompleted(id);
        },
        child: child,
      ),
    );
  }

  _buildContentItem(BarrageModel model) {
    switch (model.type){
      case 1:
        return Text(model.content,style: TextStyle(color: Colors.yellowAccent,fontSize: 15),);
    }
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.white)
      ),
      child: Text(model.content,style: TextStyle(color: Colors.white,fontSize: 15)),
    );
  }
}
