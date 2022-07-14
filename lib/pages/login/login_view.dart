part of login;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = Get.find<LoginController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
                onTap: () {
                  Get.toNamed(RouterName.Reigster);
                },
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
          LoginAnimationWidget(),
          LoginTextFiled(
            titile: "用户名",
            hint: "请输入用户名",
            onChange: (value) {
              controller.userName.value = value;
               controller.update(['btn']);
            },
          ),
          LoginTextFiled(
            titile: "密码",
            hint: "请输入密码",
            onChange: (value) {
              controller.password.value = value;
              controller.update(['btn']);
            },
            focusChange: (resalut) {
              controller.passwordState.value = resalut;
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
                    color: vc.getLoginBtnStatue() ? primary : Colors.grey,
                    child: TextButton(
                      onPressed: vc.getLoginBtnStatue()
                          ? () {
                              cheackRegisterBtn();
                            }
                          : null,
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

  void cheackRegisterBtn() {
    if (controller.userName.value == null) {
      CustomToast.fail("请输入用户名字");

      return;
    }
    if (controller.userName.value == null) {
      CustomToast.fail("请输入密码");
      return;
    }
    LoginDao.login(
        controller.userName.value, controller.password.value, context);
  }
}
