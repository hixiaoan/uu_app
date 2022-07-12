

part of login;

class ReigsterPage extends StatefulWidget {

  const ReigsterPage({Key? key}) : super(key: key);

  @override
  State<ReigsterPage> createState() => _ReigsterPageState();
}


class _ReigsterPageState extends State<ReigsterPage> {



  bool openEyes = true;
  bool logEnable = false;
  String? userName;
  String? password;
  String? rePassword;
  String? imoocId;
  String? orderId;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("登录", style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),),
      ),
      body: ListView(
        children: [
          LoginAnimationWidget(isOpen: openEyes,),
          LoginTextFiled(
              titile: "用户名",
              hint: "请输入用户名",
              onChange: (value){
                userName = value;
              }),
          LoginTextFiled(
            titile: "密码",
            hint: "请输入密码",
            onChange: (value){
              password = value;

            },
            focusChange: (resalut){
              setState(() {
                openEyes = !resalut;
              });
            },
            isPasswordFiled: true,
          ),
          LoginTextFiled(
            titile: "确认密码",
            hint: "请再次输入密码",
            isPasswordFiled: true,
            onChange: (value) {
              rePassword = value;

            },
            focusChange: (resalut) {
              setState(() {
                openEyes = !resalut;
              });
            },
          ),
          LoginTextFiled(
            textInputType:TextInputType.number,
              titile: "慕课网ID",
              hint: "请输入你的慕课网ID",
              onChange: (value){
                imoocId = value;

              }),
          LoginTextFiled(
              textInputType:TextInputType.number,
              titile: "课程订单号",
              hint: "请输入你的订单号的后四位",
              onChange: (value){
                orderId = value;
              }),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                color: primary,
                child: TextButton(
                  onPressed: ()  {
                      cheackReigsterData();
                      LoginDao.register(
                          userName!,
                          password!,
                          imoocId!,
                          orderId!,
                          context);
                  },
                  child: const Text("注册",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300),),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }


   cheackReigsterData() {

    if (userName == null){
      CustomToast.fail("请输入用户名");
      return ;
    }

    if (password == null){
      CustomToast.fail("请输入密码");
      return;
    }

    if (rePassword == null){
      CustomToast.fail("请输入确认密码");
      return;
    }

    if (rePassword!.length > 6 || password!.length > 6){
      CustomToast.fail("请输入正确的密码");
      return;
    }

    if (imoocId == null){

      CustomToast.fail("请输入慕课网ID");
      return;
    }

    if (orderId == null){
      CustomToast.fail("请输入订单后四位");
      return;
    }

    if (orderId == null){
      CustomToast.fail("请输入订单号");
      return;
    }

    if (orderId!.length != 4){
      CustomToast.fail("请输入订单号的后四位");
      return;
    }


    if (password != null && rePassword != null && password != rePassword){
      CustomToast.fail("密码输入不一致,请重新输入");
      return;
    }
  }
}

