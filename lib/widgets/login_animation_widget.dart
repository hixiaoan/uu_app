

import 'package:flutter/material.dart';

class LoginAnimationWidget extends StatefulWidget {
  
  final bool isOpen;
  const LoginAnimationWidget({Key? key, required this.isOpen,}) : super(key: key);

  @override
  State<LoginAnimationWidget> createState() => _LoginAnimationWidgetState();
}

class _LoginAnimationWidgetState extends State<LoginAnimationWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        border: const Border(bottom: BorderSide(color: Colors.grey))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Image.asset( widget.isOpen ? "assets/images/head_left.png":"assets/images/head_left_protect.png",width: 100,fit: BoxFit.cover,),
          Image.asset("assets/images/logo.png",width: 100,fit: BoxFit.cover,),
          Image.asset(widget.isOpen ? "assets/images/head_right.png":"assets/images/head_right_protect.png",width: 100,fit: BoxFit.cover,)
        ],
      ),
    );
  }
}
