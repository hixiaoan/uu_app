


import 'package:flutter/material.dart';


class UUBannerDetail extends StatefulWidget {

  static const routerName = "/bannerDetail";
  const UUBannerDetail({Key? key}) : super(key: key);

  @override
  State<UUBannerDetail> createState() => _UUBannerDetailState();
}

class _UUBannerDetailState extends State<UUBannerDetail> {
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
