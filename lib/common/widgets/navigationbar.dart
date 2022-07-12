


part of widgets;


enum StausStyle{LIGHT_CONTENT,DARK_CONTENT}

class UUNavigationBar extends StatefulWidget {

  final StausStyle style;
  final double height;
  final Color color;
  final Widget child;

  const UUNavigationBar(
      {Key? key,
      this.style = StausStyle.DARK_CONTENT,
      this.color = Colors.white,
      this.height = 46,
      required this.child})
      : super(key: key);

  @override
  State<UUNavigationBar> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<UUNavigationBar> {

  @override
  Widget build(BuildContext context) {
    setNavigationBarStyle();
    var top = MediaQuery.of(context).padding.top;
      return Container(
        color: widget.color,
        padding: EdgeInsets.only(top: top),
        width: MediaQuery.of(context).size.width,
        height: widget.height + top,
        child: widget.child,
        // decoration: BoxDecoration(color: ),
      );
  }

  void setNavigationBarStyle() {
    switch (widget.style){
      case  StausStyle.LIGHT_CONTENT:
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
        break;
      case StausStyle.DARK_CONTENT:
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
        break;
    }
  }
}


///白色状态栏
 const SystemUiOverlayStyle light = SystemUiOverlayStyle(
  systemNavigationBarColor: Color(0xFF000000),
  systemNavigationBarDividerColor: null,
  statusBarColor: null,
  systemNavigationBarIconBrightness: Brightness.light,
  statusBarIconBrightness: Brightness.light,
  statusBarBrightness: Brightness.dark,
);

///黑色状态栏
 const SystemUiOverlayStyle dark = SystemUiOverlayStyle(
  systemNavigationBarColor: Color(0xFF000000),
  systemNavigationBarDividerColor: null,
  statusBarColor: null,
  systemNavigationBarIconBrightness: Brightness.light,
  statusBarIconBrightness: Brightness.dark,
  statusBarBrightness: Brightness.light,
);
