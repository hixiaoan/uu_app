

import 'package:uu_app/uu_http_services/request/base_request.dart';

class UUHomeRequest extends BaseRequest{
  @override
  HttpMethod httpMethod() {
    // TODO: implement httpMethod
    return HttpMethod.get;
  }

  @override
  bool needLogin() {
    // TODO: implement needLogin
    return true;
  }

  @override
  String path() {
    // TODO: implement path
    return "uapi/fa/home/";
  }


}