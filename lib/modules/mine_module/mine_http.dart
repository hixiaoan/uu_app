

import 'package:uu_app/modules/mine_module/request/mine_request.dart';
import 'package:uu_app/uu_http_services/core/uu_http.dart';

import 'model/mine_mode.dart';

class MineHttpTool {

  static Future<PersonModel> requestData() async{

    MineRequest request = MineRequest();

    var result = await UUHttpServices.getInstance().request(request);
    return PersonModel.fromJson(result);
  }

}