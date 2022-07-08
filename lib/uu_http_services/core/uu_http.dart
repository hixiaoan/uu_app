

import 'dart:math';

import 'package:uu_app/uu_http_services/core/dio_net.dart';
import 'package:uu_app/uu_http_services/core/uu_net_error.dart';
import 'package:uu_app/uu_http_services/core/uu_response.dart';
import 'package:uu_app/uu_http_services/request/base_request.dart';

import '../../modules/login_module/dao/uu_login_dao.dart';

class UUHttpServices{

  UUHttpServices._();

  static UUHttpServices? _instance ;

   static UUHttpServices getInstance(){
     _instance ??= UUHttpServices._();
     return _instance!;
   }

   Future<dynamic> request(BaseRequest request) async{

     UUResponse? response;
     var error;
     try{
       response = await send(request);
     } on UUNetError catch(e){
       error = e;
       response?.data = e;
     } catch(e){
       error = e;
     }
     if (response == null){
        log(error);
     }
     var result = response?.data;

     switch (response?.statusCode){
       case 200:
         return result;
       case 401:
         throw UULoginError();
       case 403:
         throw UUAuthError(result.toString(),data: result);
       default:{
         throw UUNetError(code: response!.statusCode!, message: result.toString(),data: result);
       }
     }
   }

   Future<UUResponse<T>> send<T>(BaseRequest request) async {
     DioAdapter adapter = DioAdapter();
     
     return adapter.send(request);
   }

   void log(log){
     print("uu_net:${log}");
   }
}