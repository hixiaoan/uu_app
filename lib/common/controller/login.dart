part of app_controller;

class LoginController extends GetxController {
  ///密码
  final passwordState = false.obs;
  //用户名
  final userName = ''.obs;
  //密码
  final password = ''.obs;
  //登录按钮状态

  bool getLoginBtnStatue() {
    return userName.value.isNotEmpty && password.value.isNotEmpty;
  }

  
}
