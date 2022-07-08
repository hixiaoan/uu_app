

import 'package:flutter/material.dart';
import 'package:uu_app/modules/mine_module/model/mine_mode.dart';

import '../../../widgets/banner_widget/banner_page.dart';
class MineContentPage extends StatefulWidget {

  UserModel? model;
  MineContentPage({Key? key,this.model}) : super(key: key);

  @override
  State<MineContentPage> createState() => _MineContentPageState();
}

class _MineContentPageState extends State<MineContentPage> {
  @override
  Widget build(BuildContext context) {
    if(widget.model == null){
      return Container();
    }
    return ListView(
      children: [
        _bulidBannerView(),
      ],
    );
  }

  _bulidBannerView() {
    return Container(
      padding: EdgeInsets.only(left: 10,right: 10,top: 10),
      child: UUBannerPage(
        bannerList: widget.model!.bannerList!,
        height: 140,
      ),
    );
  }
}
