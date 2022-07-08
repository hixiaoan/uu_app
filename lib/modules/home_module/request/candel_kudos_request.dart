

import 'package:uu_app/modules/home_module/request/kudos_request.dart';

import '../../../uu_http_services/request/base_request.dart';

class CancelKudosRequest extends KudosRequest{

  @override
  HttpMethod httpMethod() {
    // TODO: implement httpMethod
    return HttpMethod.delete;
  }
}