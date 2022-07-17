part of login;

class ReigsterPage extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "注册",
          style: TextStyle(
              fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: [
          LoginAnimationWidget<RegisterController>(controller: controller),
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
          LoginTextFiled(
            titile: "确认密码",
            hint: "请再次输入密码",
            isPasswordFiled: true,
            onChange: (value) {
              controller.resetPasswordEvent(value);
            },
            focusChange: (resalut) {
              controller.focusChangeEvent(resalut);
            },
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: GetBuilder<RegisterController>(
                  id: "btn",
                  init: controller,
                  builder: (vc) => Container(
                    color: vc.reigsterBtnColor,
                    child: TextButton(
                      onPressed: vc.reigsterEvent,
                      child: const Text(
                        "注册",
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
