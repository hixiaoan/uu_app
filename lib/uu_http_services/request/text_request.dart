
import 'package:uu_app/uu_http_services/request/base_request.dart';

class TextRequest extends BaseRequest{
  @override
  HttpMethod httpMethod() {
    // TODO: implement httpMethod
    return HttpMethod.get;
  }

  @override
  bool needLogin() {
    // TODO: implement needLogin
    return false;
  }

  @override
  String path() {
    // TODO: implement path
    return 'uapi/test/test';
  }


}