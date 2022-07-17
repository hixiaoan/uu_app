part of app_controller;

class LoginController extends GetxController {
  //登录状态
  get _loginBtnStatue =>
      _userName.value.isNotEmpty && _password.value.isNotEmpty;

  // 登录事件
  get loginEvent => (_loginBtnStatue
      ? () {
          if (_userName.value == null) {
            CustomToast.fail("请输入用户名字");
            return;
          }
          if (_userName.value == null) {
            CustomToast.fail("请输入密码");
            return;
          }
          LoginDao.login(_userName.value, _password.value);
        }
      : null);
  // 注册事件
  get registerEvent => (() => Get.toNamed(RouterName.Reigster));

  //用户名修改事件
  void userNameChangeEvent(String value) {
    _userName.value = value;
    update(["btn"]);
  }

  //密码修改事件
  void passwordChangeEvent(String value) {
    _password.value = value;
    update(['btn']);
  }

  //变焦事件
  void focusChangeEvent(bool result) {
    _passwordState.value = result;
    update();
  }

  get loginBtnColor => (_loginBtnStatue ? primary : Colors.grey);

  //用户名
  final _userName = ''.obs;
  //密码
  final _password = ''.obs;

  ///密码
  final _passwordState = false.obs;

  ///获取按钮状态
  get passwordState => _passwordState.value;
}
