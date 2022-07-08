import 'package:uu_app/web_socket/socket_mode.dart';
import 'package:flutter/material.dart';



class BarrageViewUtil {
  //如果想定义弹幕样式，可以在这里根据弹幕的类型来定义
  static barrageView(BarrageModel model) {
    switch (model.type) {
      case 1:
        return _barrageType1(model);
    }
    return Text(model.content, style: TextStyle(color: Colors.white,fontSize: 15));
  }

  static _barrageType1(BarrageModel model) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
        child: Text(
          model.content,
          style: TextStyle(color: Colors.white),
        ),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
