

import 'package:uu_app/uu_http_services/request/base_request.dart';

class FavoriteRequest extends BaseRequest{
  @override
  HttpMethod httpMethod() {
    // TODO: implement httpMethod
    return HttpMethod.post;
  }

  @override
  bool needLogin() {
    // TODO: implement needLogin
    return true;
  }

  @override
  String path() {
    // TODO: implement path
    return "uapi/fa/favorite/";
  }




}