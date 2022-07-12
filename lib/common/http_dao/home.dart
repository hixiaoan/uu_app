

part of http_dao;


class HomeDao{

  static requestData( String categoryName,{int pageIndex = 1,int pageSize = 10,Function()? avtion}) async{
      HomeRequest request = HomeRequest();
      request
        .addRequestParams("pageIndex", pageIndex)
        .addRequestParams("pageSize", pageSize);
      request.pathParams = categoryName;
      print("header:${request.header}");
      var result = await HttpServices.instance.request(request);
      return HomeModel.fromJson(result["data"]);
  }
}