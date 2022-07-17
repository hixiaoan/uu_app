part of http_dao;

class HomeDao {
  static requestData(String categoryName,
      {int pageIndex = 1, int pageSize = 10}) async {
    HomeRequest request = HomeRequest();
    request
        .addRequestParams("pageIndex", pageIndex)
        .addRequestParams("pageSize", pageSize);
    request.pathParams = categoryName;
    var result = await HttpServices.instance.request(request);
    return HomeModel.fromJson(result["data"]);
  }

  static requestTabList({int pageIndex = 1, int pageSize = 10}) async {
    HomeRequest request = HomeRequest();
    request
        .addRequestParams("pageIndex", pageIndex)
        .addRequestParams("pageSize", pageSize);
    request.pathParams = "推荐";
    var result = await HttpServices.instance.request(request);
    return HomeTabModel.fromJson(result["data"]);
  }
}
