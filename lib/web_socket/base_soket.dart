

 import 'package:flutter/material.dart';
import 'package:uu_app/web_socket/socket_mode.dart';


abstract class BaseSoket{
  //建立连接
   BaseSoket connect(String videoid);
   //发送消息
    BaseSoket send(String msg);
   //接受消息
    BaseSoket receive(ValueChanged<List<BarrageModel>> receiveCallBack);
   //关闭
    void close();

 }