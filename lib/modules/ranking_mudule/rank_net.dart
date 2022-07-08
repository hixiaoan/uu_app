


import 'package:uu_app/modules/ranking_mudule/request/ranking_request.dart';
import 'package:uu_app/uu_http_services/core/uu_http.dart';
import 'package:uu_app/uu_http_services/request/base_request.dart';

import 'model/ranking_model.dart';

class RankingHttp {

  static Future<RankingModel> reuestData(String type,{ int pageIndex =1,int pageSize = 10 }) async {

    RankingRequest request = RankingRequest();
    request.addRequestParams("sort", type);
    request.addRequestParams('pageIndex', pageIndex).addRequestParams('pageSize', pageSize);
    print("RankingHttp.header:${request.header}");
    var result = await UUHttpServices.getInstance().request(request);
    return RankingModel.fromJson(result['data']);
  }

}