

import 'package:uu_app/modules/home_module/request/favorite_request.dart';

import '../../../uu_http_services/request/base_request.dart';

class CancelFavoriteRequest extends FavoriteRequest{

  @override
  HttpMethod httpMethod() {
    // TODO: implement httpMethod
    return HttpMethod.delete;
  }
}