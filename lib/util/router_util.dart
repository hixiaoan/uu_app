


import 'package:flutter/material.dart';




class UURouter{

  BuildContext? context;

  static UURouter? _instance ;

  static UURouter get instance => _getRouterInstance();

  static UURouter _getRouterInstance(){
    _instance ??= UURouter._();
    return _instance!;
  }

  UURouter._();

  /// Take users Context and saves to avariable
  UURouter init(BuildContext context) {
    _instance!.context = context;
    return _instance!;
  }

  static Future<T?> pushNamed<T> (String routeName,{
    Object? arguments,
  })
  {
    if (instance.context == null){
      throw ("UURouter没有被初始化,在initState中调用init(BuildContext context)");
    }
    return Navigator.of(instance.context!).pushNamed<T>(routeName, arguments: arguments);
  }

  static void pop<T extends Object?>([ T? result ]) {
    if (instance.context == null){
      throw ("UURouter没有被初始化,在initState中调用init(BuildContext context)");
    }
    Navigator.of(instance.context!).pop<T>(result);
  }

  // static T? getRouterArguments<T extends Object?>(){
  //   if (instance.context == null){
  //     throw ("UURouter没有被初始化,在initState中调用init(BuildContext context)");
  //   }
  //   return ModalRoute.of(instance.context!)?.settings.arguments as T;
  // }

}