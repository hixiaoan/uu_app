
part of widgets;

class CustomEmpty extends StatelessWidget {
  final Widget? icon;
  final Widget? title;
  final Widget? label;
  final Color? color;

  const CustomEmpty({
    Key? key,
    this.icon,
    this.title,
    this.label, this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = this.color ?? Theme.of(context).colorScheme.primary;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (icon != null)
          IconTheme(
            data: IconThemeData(color: Colors.white, size: 50.w),
            child: Container(
              height: 180.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                image: DecorationImage(
                  colorFilter: ColorFilter.mode(color, BlendMode.srcATop),
                  image: const AssetImage('assets/images/empty.png'),
                  fit: BoxFit.contain,
                ),
              ),
              child: Container(
                width: 80.w,
                height: 80.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(28.w)),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.alphaBlend(color.withOpacity(0.6), Colors.white),
                      color,
                    ],
                  ),
                ),
                child: icon,
              ),
            ),
          ),
        if (title != null)
          Padding(
            padding: EdgeInsets.only(top: 20.w),
            child: DefaultTextStyle.merge(
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32.w,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.primary,
              ),
              child: title!,
            ),
          ),
        if (label != null)
          Padding(
            padding: EdgeInsets.only(top: 20.w),
            child: DefaultTextStyle.merge(
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18.w),
              child: label!,
            ),
          ),
      ],
    );
  }
}
