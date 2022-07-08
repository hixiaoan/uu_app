

import 'package:flutter/material.dart';
import 'package:uu_app/modules/login_module/pages/reigster_page.dart';
import 'package:uu_app/util/color.dart';
import 'package:uu_app/util/router_util.dart';
import 'package:uu_app/util/toast_util.dart';
import 'package:uu_app/widgets/login_input_textfield.dart';
import '../../../widgets/login_animation_widget.dart';
import '../dao/uu_login_dao.dart';


class LoginPage extends StatefulWidget {
  static const routerName = "/loginPage";
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool openEyes = true;
  bool logEnable = false;
  String? userName;
  String? password;

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
        actions:  [
          InkWell(
            child: Container(
              padding: const EdgeInsets.only(left: 15,right: 15),
              alignment: Alignment.center,
              child: GestureDetector(
                onTap:() {
                  UURouter.pushNamed(ReigsterPage.routerName);
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

      LoginAnimationWidget(isOpen: openEyes,),
          LoginTextFiled(
              titile: "用户名",
              hint: "请输入用户名",
              onChange: (value){
                userName = value;
              },
              ),
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

          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                color: primary,
                child: TextButton(
                  onPressed: (){
                    cheackRegisterBtn();

                    },
                  child: const Text("登录",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300),),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void cheackRegisterBtn() {

    if(userName == null){
      showWarnToast("请输入用户名");
      return;
    }
    if( password == null){
      showWarnToast("请输入密码");
      return ;
    }
    UULoginDao.login(userName!, password!, context);
  }
}
