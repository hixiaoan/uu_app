

import 'package:flutter/material.dart';
import 'package:uu_app/util/color.dart';

class LoginTextFiled extends StatefulWidget {

    final String titile;
    String? hint;
    final ValueChanged<String> onChange;
    final ValueChanged<bool>? focusChange;
    bool allLine;
    final bool isPasswordFiled;
    TextInputType?   textInputType;

    LoginTextFiled(
      {Key? key,
      required this.titile,
      this.hint,
      required this.onChange,
      this.focusChange,
      this.allLine = false,
      this.isPasswordFiled = false,
      this.textInputType = TextInputType.text})
      : super(key: key);

  @override
  State<LoginTextFiled> createState() => _LoginTextFiledState();
}

class _LoginTextFiledState extends State<LoginTextFiled> {

  final _focusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _focusNode.addListener(() {
      if (widget.focusChange != null){
          widget.focusChange!(_focusNode.hasFocus);
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 15),
              width: 100,
              child: Text(
                widget.titile,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            _buildConstonTextFiled()
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
              left: !widget.allLine ? 15 : 0, right: !widget.allLine ? 15 : 0),
          child: const Divider(
            height: 1,
            ///粗细
            thickness: 0.5,
          ),
        )
      ],
    );
  }

  _buildConstonTextFiled() {
    return Expanded(
      child: TextField(
        focusNode: _focusNode,
        onChanged: widget.onChange,
        ///是否是密码
        obscureText: widget.isPasswordFiled,
        ///键盘类型
        keyboardType: widget.textInputType,
        ///是否自动获取光标
        autofocus: !widget.isPasswordFiled,
        ///光标颜色
        cursorColor: primary[50],
        style: const TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w300),
        /// 输入框的样式
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 20,right: 30),
          border: InputBorder.none,
          hintText: widget.hint ?? "",
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 15
          )
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _focusNode.dispose();
    super.dispose();
  }


}
