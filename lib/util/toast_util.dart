
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

///主要在使用showWarnToast之前必须要初始化 FToast().init(context)
showWarnToast(
    String text, {
     ToastGravity gravity = ToastGravity.CENTER,
     Color textColor = Colors.amberAccent,
     int duration = 2
    }) {
  if (FToast().context == null){
   throw ("请初始化 FToast().init(context)");
  }
  FToast().showToast(
       child:ClipRRect(
        borderRadius: BorderRadius.circular(8),
         child: Opacity(
          opacity: 0.8,
           child: Container(
            padding: const EdgeInsets.all(10),
            color: Colors.black,
             child: Text(text,style: TextStyle(color: textColor,fontSize: 18,),),
           ),
         ),
       ),
      gravity: gravity,
       toastDuration: Duration(seconds: duration)
   );


}

showToast(String text) {
  showWarnToast(text,textColor:Colors.white);
}