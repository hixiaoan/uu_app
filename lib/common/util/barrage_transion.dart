


part of util;

class BarrageTransion extends StatefulWidget {


  const BarrageTransion(
      {Key? key,
      required this.duration,
      required this.child,
      required this.onCompleted})
      : super(key: key);

  final Duration duration;
  final Widget child;
  final ValueChanged onCompleted;

  @override
  State<BarrageTransion> createState() => BarrageTransionState();
}

class BarrageTransionState extends State<BarrageTransion>  with SingleTickerProviderStateMixin{

  late AnimationController _animationController;
  late Animation<Offset> _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(vsync: this,duration: widget.duration)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed){
          widget.onCompleted("");
        }
      });

    _animation = Tween(begin:Offset(1.0,0),end: Offset(-1.0,0)).animate(_animationController);

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: widget.child,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }
}
