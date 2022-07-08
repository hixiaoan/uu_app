

import 'package:uu_app/web_socket/base_soket.dart';
import 'package:uu_app/web_socket/socket_mode.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../util/cache_util.dart';

class BrSocket extends BaseSoket{

  late IOWebSocketChannel  _channel;
  final socket_url = "wss://api.devio.org/uapi/fa/barrage/";
  @override
  BrSocket connect(String videoid) {
    // TODO: implement connect
    _channel = IOWebSocketChannel
        .connect(
        Uri.parse(socket_url+videoid),
        headers: _getHeaders(),
        pingInterval: const Duration(seconds: 50));
    return this;
  }

  @override
  BrSocket receive(Function(List<BarrageModel>) receiveCallBack) {
    // TODO: implement receive
    if (_channel != null){
      _channel.stream.handleError((error){
        print("soket error:$error");
      }).listen((msg) {
        print(msg);
        var result = BarrageModel.fromJsonString(msg);
        receiveCallBack(result);
      });
    }else{
      print("channel 接受消息失败,channel is null");
    }
    return this;
  }

  @override
  BrSocket send(String msg) {
    // TODO: implement send
    if (_channel != null){
      _channel.sink.add(msg);
    }else{
      print("channel 发送消息失败,channel is null");
    }
    return this;
  }

  @override
  void close() {
    // TODO: implement close
    if (_channel != null){
      _channel.sink.close();
    }else{
      print("channel 关闭失败,channel is null");
    }
  }

  _getHeaders(){
    return {
      'course-flag': 'fa',
      'auth-token': 'ZmEtMjAyMS0wNC0xMiAyMToyMjoyMC1mYQ==fa',
      "boarding-pass":UUCache.instance.get<String>("boarding-pass")
    };
  }
  
  
}