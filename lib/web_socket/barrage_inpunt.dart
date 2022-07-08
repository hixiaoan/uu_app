

import 'package:flutter/material.dart';

import '../util/color.dart';


///弹幕输入界面

class BarrageInput extends StatefulWidget {
  final VoidCallback onTabClose;
  final VoidCallback editingCallBack;

  const BarrageInput({Key? key, required this.onTabClose, required this.editingCallBack}) : super(key: key);

  @override
  State<BarrageInput> createState() => _BarrageInputState();
}

class _BarrageInputState extends State<BarrageInput> {

  TextEditingController editingController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    editingController.addListener(() {
            widget.editingCallBack();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    editingController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          //空白区域点击关闭弹框
          Expanded(
              child: GestureDetector(
                onTap: () {
                  if (widget.onTabClose != null) widget.onTabClose();
                  Navigator.of(context).pop();
                },
                child: Container(
                  color: Colors.transparent,
                ),
              )),
          SafeArea(
              child: Container(
                color: Colors.white,
                child: Row(
                  children: [
                    SizedBox(width: 15,),
                    _buildInput(editingController, context),
                    _buildSendBtn(editingController, context)
                  ],
                ),
              ))
        ],
      ),
    );
  }

  _buildInput(TextEditingController editingController, BuildContext context) {
    return Expanded(
        child: Container(
          margin: EdgeInsets.only(top: 10, bottom: 10),
          decoration: BoxDecoration(
              color: Colors.grey[200], borderRadius: BorderRadius.circular(20)),
          child: TextField(
            autofocus: true,
            controller: editingController,
            onSubmitted: (value) {
              _send(value, context);
            },
            cursorColor: primary,
            decoration: InputDecoration(
                isDense: true,
                contentPadding:
                EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                border: InputBorder.none,
                hintStyle: TextStyle(fontSize: 13, color: Colors.grey),
                hintText: "发个友善的弹幕见证当下"),
          ),
        ));
  }

  ///发送消息
  void _send(String text, BuildContext context) {
    if (text.isNotEmpty) {
      if (widget.onTabClose != null) widget.onTabClose();
      Navigator.pop(context, text);
    }
  }

  _buildSendBtn(TextEditingController editingController, BuildContext context) {
    return InkWell(
      onTap: () {
        var text = editingController.text.trim();
        _send(text, context);
      },
      child: Container(
        padding: EdgeInsets.all(10),
        child: Icon(Icons.send_rounded, color: Colors.grey),
      ),
    );
  }
}
