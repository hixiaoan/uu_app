
part of widgets;

enum BarrageStatus{
  play,pause
}

class BarrageWidget extends StatefulWidget {

  const BarrageWidget(
      {Key? key,
      this.lineCount = 4,
      required this.vid,
      this.top = 0,
      this.autoPlay = false,
      this.speed = 800})
      : super(key: key);

  final int lineCount;
  final String vid;
  final double top;
  final bool autoPlay;
  final int speed;

  @override
  State<BarrageWidget> createState() => BarrageWidgetState();
}

class BarrageWidgetState extends State<BarrageWidget> implements IBarrage {

  late BrSocket _brSocket;
  late double _height;
  late double _width;
  List<BarrageItem> _barrageItemList = [];
  List<BarrageModel> _barrageModels = [];
  int _barrageIndex = 0;
  Random _random = Random();
  BarrageStatus _barrageStatus = BarrageStatus.play;
  Timer? _timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _brSocket = BrSocket().connect(widget.vid).receive((value) {
      _handleMessage(value);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    if (_brSocket != null) {
      _brSocket.close();
    }
    if (_timer != null) {
      _timer?.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _height = _width / 16 * 9;
    return SizedBox(
      width: _width,
      height: _height,
      child: Stack(
        children: [Container()]..addAll(_barrageItemList),
      ),
    );
  }

  void _handleMessage(List<BarrageModel> modelList, {bool send = false}) {
    if (send) {
      _barrageModels.insertAll(0, modelList);
    } else {
      _barrageModels.addAll(modelList);
    }

    if (_barrageStatus == BarrageStatus.play) {
      play();
      return;
    }

    if (widget.autoPlay && _barrageStatus != BarrageStatus.pause) {
      play();
    }
  }

  void addbarrageItem(BarrageModel model) {
    double itemRowHeight = 30;
    var line = _barrageIndex%widget.lineCount;
    _barrageIndex+=1;
    var top = line * itemRowHeight + widget.top ;
    String id = "${_random.nextInt(10000)}:${model.content}";
    BarrageItem item = BarrageItem(
      useerModel: model,
      id: id,
      top: top,
      playCompleted: _handlPlayCompled,
      child:BarrageViewUtil.barrageView(model) ,
    );
    _barrageItemList.add(item);
    setState(() {});
  }

  @override
  void pause() {
    // TODO: implement pause
    _barrageStatus = BarrageStatus.pause;
    _barrageItemList.clear();
    setState(() {});
    print("弹幕停止");
    if (_timer != null) {
      _timer?.cancel();
    }
  }

  @override
  void play() {
    // TODO: implement play
    _barrageStatus = BarrageStatus.play;
    print("开始播放弹幕");
    if (_timer != null && _timer!.isActive) return;
    _timer = Timer.periodic(Duration(milliseconds: widget.speed), (timer) {
      if (_barrageModels.isNotEmpty) {
        var model = _barrageModels.removeAt(0);
        addbarrageItem(model);
        print("star:${model.content}");
      } else {
        _timer?.cancel();
        print("弹幕播放完成");
      }
    });
  }

  @override
  void send(String msg) {
    // TODO: implement send
    if (msg == null) return;
    _brSocket.send(msg);
    _handleMessage(
        [BarrageModel(content: msg, vid: "-2", priority: 1, type: 1)]);
  }



  void _handlPlayCompled(String value) {
    print("被移除的弹幕ID:$value");
    _barrageItemList.where((element) => element.id == value);
  }
}
