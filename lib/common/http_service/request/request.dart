part of http_services;

enum HttpMethod { get, post, delete }

abstract class BaseRequest {
  ///是否需要登录
  bool needLogin();

  ///路径参数
  var pathParams;

  ///是否https
  var useHttps = true;

  ///域名
  String baseUrl() {
    return "api.devio.org";
  }

  ///请求方式
  HttpMethod httpMethod();

  ///请求path
  String path();

  ///拼接url
  String url() {
    Uri uri;
    var pathStr = path();
    if (pathParams != null) {
      if (pathStr.endsWith("/")) {
        pathStr = "$pathStr$pathParams";
      } else {
        pathStr = "$pathStr/$pathParams";
      }
    }
    if (useHttps) {
      uri = Uri.https(baseUrl(), pathStr, requestParams);
    } else {
      uri = Uri.http(baseUrl(), pathStr, requestParams);
    }

    if (needLogin()) {
      // if (UUCache.instance.containsKey("boarding-pass")){
      //   addHeaderParams("boarding-pass", UUCache.instance.get<String>("boarding-pass") ?? "");
      // }
      print(header);
    }
    print("请求url:${uri.toString()}");
    return uri.toString();
  }

  ///设置请求参数
  Map<String, dynamic> requestParams = {};
  BaseRequest addRequestParams(String k, Object v) {
    requestParams[k] = v.toString();
    return this;
  }

  ///设置header参数
  Map<String, dynamic> header = {
    'course-flag': 'fa',
    'auth-token': 'ZmEtMjAyMS0wNC0xMiAyMToyMjoyMC1mYQ==fa',
  };
  BaseRequest addHeaderParams(String k, Object v) {
    header[k] = v;
    return this;
  }
}
