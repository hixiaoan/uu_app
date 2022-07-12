
part of widgets;



class UUTabWidget extends StatefulWidget {
  const UUTabWidget(
      {Key? key,
      this.seletedLabeColor = Colors.red,
      required this.list,
      this.indicator = primary,
      // required this.tabs,
      this.insets = const EdgeInsets.only(left: 15, right: 15),
      this.unselectedLabelColor = Colors.black,
       this.width = 3,
        required this.tabs,
        required this.tabController,
        this.ontap})
      : super(key: key);

  final Color? seletedLabeColor;
  final Color? unselectedLabelColor;
  final Color indicator;
  final List list;
  final List<Widget> tabs;
  final EdgeInsets insets;
  final double width;
  final TabController tabController;
  final ValueChanged<int>? ontap;

  @override
  State<UUTabWidget> createState() => _UUTabWidgetState();
}

class _UUTabWidgetState extends State<UUTabWidget> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return TabBar(
        controller:widget.tabController ,
        isScrollable: true,
        labelColor:widget.seletedLabeColor,
        unselectedLabelColor: widget.unselectedLabelColor,
        indicator: UnderlineIndicator(
            strokeCap: StrokeCap.round,// Set your line endings.
            borderSide: BorderSide(
              color: widget.indicator,
              width: widget.width,
            ),
            insets:widget.insets),
        tabs:widget.tabs
    );
  }

}
