


import 'package:uu_app/uu_http_services/core/uu_response.dart';
import 'package:uu_app/uu_http_services/request/base_request.dart';

///适配器
///

abstract class UUNetAdapter{
  Future<UUResponse<T>> send<T>(BaseRequest request);
}