part of http_dao;

class LoginDao {
  static login(String userName, String password, BuildContext context) {
    return _sendRequest(userName, password, context);
  }

  static register(String userName, String password, String imoocId,
      String orderId, BuildContext context,
      {String courseFlag = "fa"}) {
    return _sendRequest(userName, password, context,
        imoocId: imoocId, orderId: orderId, courseFlag: courseFlag);
  }

  static _sendRequest(String userName, String password, BuildContext context,
      {imoocId, orderId, courseFlag}) async {
    BaseRequest request;

    if (imoocId != null && orderId != null) {
      request = RegisterRequest();
      request
          .addRequestParams('imoocId', imoocId)
          .addRequestParams("orderId", orderId)
          .addRequestParams("courseFlag", courseFlag);
    } else {
      request = LoginRequest();
    }
    request
        .addRequestParams("userName", userName)
        .addRequestParams('password', password);

    try {
      var result = await HttpServices.instance.request(request);

      ///设置登录临牌
      if (request is LoginRequest) {
        if ( result['code'] == 200) {
          StorageService.to
              .writeString(StorageKey.boardingPass, result["data"]);
        }else {
        CustomToast.fail(result['msg']);
        return;
      } 
    }
      print("登录令牌:${getBoardingPass()}");
      FocusScope.of(context).unfocus();
      print("请求成功:$result");
      Get.back();
    } on NetError catch (e) {
      print("${LoginDao().toString()} error :${e.message}");
    }
  }

  static getBoardingPass() {
    return StorageService.to.readString(StorageKey.boardingPass);
  }
}
