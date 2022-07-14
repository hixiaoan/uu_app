

part of launch;


class LaunchPage extends StatefulWidget {
const LaunchPage({ Key? key }) : super(key: key);

  @override
  State<LaunchPage> createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     Future.wait([
      Future.delayed(const Duration(seconds: 2)),
    ]).whenComplete(() {
      Get.offAllNamed(RouterName.Main);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Expanded(
            flex: 5,
            child: Center(
              child: CustomEmpty(
                icon: CustomImage.asset(
                  url: 'assets/images/logo.png',
                  fit: BoxFit.contain,
                ),
                title: Text('welcome to uu'),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(child: CustomLoadingIndicator()),
          ),
        ],
      ),
    );
  }
}