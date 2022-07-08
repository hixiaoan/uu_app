

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uu_app/modules/mine_module/child_pages/mine_content_page.dart';
import 'package:uu_app/modules/mine_module/mine_http.dart';
import 'package:uu_app/modules/mine_module/model/mine_mode.dart';
import 'package:uu_app/util/string_util.dart';
import 'package:uu_app/uu_provider/theme_provider.dart';

import '../../util/cache_image_util.dart';
import '../../widgets/flexible_heder.dart';


class UUMinePage extends StatefulWidget {
  const UUMinePage({Key? key}) : super(key: key);

  @override
  State<UUMinePage> createState() => _UUMinePageState();
}

class _UUMinePageState extends State<UUMinePage> {

  UserModel? userModel;

  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder:(ctx,innerBoxIsScrolled){
          return _buildHeader();
        },
        body: _buildBody() ,
      ),
    );
  }

  _buildHeader() {
    return <Widget>[
      SliverAppBar(

        ///扩展高度
        expandedHeight: 160,
        ///是否会固定标题栏
        pinned: true,
        ///定义滚动的区间
        flexibleSpace: FlexibleSpaceBar(
          ///时差滚动效果
          collapseMode: CollapseMode.parallax,
          titlePadding: const EdgeInsets.only(left: 0),
          title:  _buildUserHeader(),
          background: Stack(
            children: [
              Positioned.fill(child:CacheNetImage(url: "https://o.devio.org/images/fa/woman-1064664__340.webp")),
              Positioned.fill(child: _buildDropFillter()),
              Positioned(
                bottom: 0,right: 0,left: 0,
                  child: _buildTapBtnView())
            ],
          ),
      )
      )];
  }

  _buildBody(){
    return MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: ListView(
          children: [
            Consumer<ThemeProvider>(builder: (ctx, provider, child) {
              return GestureDetector(
                onTap: (){
                  ThemeMode currentMode ;
                  if(context.read<ThemeProvider>().getThemeMode() != ThemeMode.dark){
                    currentMode = ThemeMode.dark;
                  }else{
                    currentMode = ThemeMode.light;
                  }
                  context.read<ThemeProvider>().setTheme(currentMode);
                },
                child: Text(
                  provider.getThemeMode() == ThemeMode.dark
                      ? "主题:Dark模式的切换"
                      : "主题:light模式的切换",
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              );
            })
          ],
        ));
  }

  //高斯模糊
  _buildDropFillter(){
    return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10,sigmaY: 10),
      child:Container(
        color: Colors.white10,
      )
    );
  }


  _buildUserHeader(){
    if (userModel == null){
      return Container(color:Colors.grey);
    }
    return FlexibleHeaderContainer(imageUrl: userModel!.face,ttile: userModel!.name,scrollController: _scrollController);
  }

  _buildTapBtnView(){
    if(userModel == null){
     return Container();
    }
      return Container(
        padding: const EdgeInsets.only(bottom: 10,top: 10),
        color: Colors.white10,
        child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildTapBtn("收藏", countFormat(userModel!.favorite)),
            _buildTapBtn("点赞",  countFormat(userModel!.like)),
            _buildTapBtn("浏览", countFormat(userModel!.browsing)),
            _buildTapBtn("金币", countFormat(userModel!.coin)),
            _buildTapBtn("粉丝", countFormat(userModel!.fans))
          ],
        ),
      );
    }

  _buildTapBtn( String tile,String num){
    return Column(
      children: [
        Text(num,style: const TextStyle(color: Colors.grey,fontSize: 13,fontWeight: FontWeight.bold),),
        const SizedBox(height: 8,),
        Text(tile,style: const TextStyle(color: Colors.grey,fontSize: 13,fontWeight: FontWeight.bold)),
      ]
    );
  }

  loadData(){
    MineHttpTool.requestData().then((value){
      setState(() {
        userModel = value.data;
      });
    }).whenComplete((){

    });
  }

}
