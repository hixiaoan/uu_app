part of app_controller;

class RegisterController extends LoginController {
  final _resetPassword = ''.obs;
  final _resetStated = false.obs;
  @override
  get passwordState => _passwordState.value || _resetStated.value;

  void resetPasswordEvent(String value) {
    _resetPassword.value = value;
    update(['btn']);
  }

  get reigsterEvent =>
      (registerBtnStatue() ? () => cheackReigsterData() : null);

  get reigsterBtnColor => (registerBtnStatue() ? primary : Colors.grey);

  bool registerBtnStatue() {
    bool result = _resetPassword.value.isNotEmpty &&
        _password.value.isNotEmpty &&
        _userName.value.isNotEmpty;
    return result;
  }

  cheackReigsterData() {
    if (_userName.value == null) {
      CustomToast.fail("请输入用户名");
      return;
    }

    if (_password.value == null) {
      CustomToast.fail("请输入密码");
      return;
    }

    if (_resetPassword.value == null) {
      CustomToast.fail("请输入确认密码");
      return;
    }
    if (_password.value != _resetPassword.value) {
      CustomToast.fail("密码输入不一致,请重新输入");
      return;
    }
    LoginDao.register(_userName.value, _password.value, "10545853", "1587");
  }
}
