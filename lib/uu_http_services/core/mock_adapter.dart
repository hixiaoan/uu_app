

import 'package:uu_app/uu_http_services/core/uu_net_adapter.dart';
import 'package:uu_app/uu_http_services/core/uu_response.dart';
import 'package:uu_app/uu_http_services/request/base_request.dart';

///测试适配器
///

// class MockAdapter extends UUNetAdapter{
//   @override
//   Future<UUResponse<T>> send<T>(BaseRequest request) {
//     // TODO: implement send
//     return Future<UUResponse<String>>.delayed(Duration(seconds: 2), (){
//        return UUResponse<String>(data: "dissed");
//     });
//   }
//
// }