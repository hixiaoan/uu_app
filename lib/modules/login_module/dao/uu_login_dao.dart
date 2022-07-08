import 'package:flutter/material.dart';
import 'package:uu_app/util/router_util.dart';
import 'package:uu_app/uu_http_services/core/uu_http.dart';
import 'package:uu_app/uu_http_services/core/uu_net_error.dart';
import 'package:uu_app/uu_http_services/request/base_request.dart';
import 'package:uu_app/modules/login_module/request/uu_login_request.dart';
import 'package:uu_app/modules/login_module/request/uu_register_request.dart';

import '../../../util/cache_util.dart';

class UULoginDao {

  static login(
      String userName,
      String password,
      BuildContext context) {
    return _sendRequest(
        userName,
        password,context);
  }

  static register(
      String userName,
      String password,
      String imoocId,
      String orderId,
      BuildContext context,
      {String courseFlag = "fa"}) {
    return _sendRequest(
        userName,
        password,
        context,
        imoocId: imoocId,
        orderId: orderId,
        courseFlag: courseFlag);
  }

  static _sendRequest(
      String userName,
      String password,
      BuildContext context,
      {imoocId, orderId, courseFlag}
      ) async {
    BaseRequest request;

    if (imoocId != null && orderId != null) {
      request = UURegisterRequest();
      request
          .addRequestParams('imoocId', imoocId)
          .addRequestParams("orderId", orderId)
          .addRequestParams("courseFlag", courseFlag);
    } else {
      request = UULoginRequest();
    }
    request
        .addRequestParams("userName", userName)
        .addRequestParams('password', password);

    try {
      var result = await UUHttpServices.getInstance().request(request);
      ///设置登录临牌
       if (request is UULoginRequest){

      if (result != null && result["data"] != null ) {
        UUCache.instance.setString('boarding-pass', result["data"]);
      }
       }
      print("登录令牌:${getBoardingPass()}");
      FocusScope.of(context).unfocus();
      print("请求成功:${result}");
      UURouter.pop();
    } on UUNetError catch (e) {
      print("${UULoginDao().toString()} error :${e.message}");
    }
  }

  static getBoardingPass() {
     return UUCache.instance.get<String>("boarding-pass") ?? "";
    }


  }
