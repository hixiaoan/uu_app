part of login;

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "登录",
          style: TextStyle(
              fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          InkWell(
            child: Container(
              padding: const EdgeInsets.only(left: 15, right: 15),
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: controller.registerEvent,
                child: Text(
                  "注册",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[500],
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          LoginAnimationWidget<LoginController>(controller: controller,),
          LoginTextFiled(
              titile: "用户名",
              hint: "请输入用户名",
              onChange: (value) {
                controller.userNameChangeEvent(value);
              }),
          LoginTextFiled(
            titile: "密码",
            hint: "请输入密码",
            onChange: (value) {
              controller.passwordChangeEvent(value);
            },
            focusChange: (resalut) {
              controller.focusChangeEvent(resalut);
            },
            isPasswordFiled: true,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: GetBuilder<LoginController>(
                  id: "btn",
                  init: controller,
                  builder: (vc) => Container(
                    color: vc.loginBtnColor,
                    child: TextButton(
                      onPressed: vc.loginEvent,
                      child: const Text(
                        "登录",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                )),
          )
        ],
      ),
    );
  }
}
