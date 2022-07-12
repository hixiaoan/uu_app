
part of banner_detail;

class BannerPage extends StatefulWidget {

  const BannerPage({Key? key}) : super(key: key);

  @override
  State<BannerPage> createState() => _BannerPageState();
}

class _BannerPageState extends State<BannerPage> {
  @override
  Widget build(BuildContext context) {

    final title =  ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: const Text("banner详情"),
      ),
      body: Center(
        child: Text(title),
      ),
    );
  }
}
