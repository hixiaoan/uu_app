

part of http_dao;

class RankingDao {

  static Future<RankingModel> reuestData(String type,{ int pageIndex =1,int pageSize = 10 }) async {

    RankingRequest request = RankingRequest();
    request.addRequestParams("sort", type);
    request.addRequestParams('pageIndex', pageIndex).addRequestParams('pageSize', pageSize);
    print("RankingHttp.header:${request.header}");
    var result = await HttpServices.instance.request(request);
    return RankingModel.fromJson(result['data']);
  }

}