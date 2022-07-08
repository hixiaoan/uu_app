


import 'package:flutter/material.dart';


///页面setState在已经销毁的时候被调用的处理
///

abstract class UUState <T extends StatefulWidget> extends State<T>{

  bool requestSuccess = false;

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    if (mounted){
      super.setState(fn);
    }else{
        print("UUState:页面已销毁没本次setState不执行:${toString()}");
    }
  }
}