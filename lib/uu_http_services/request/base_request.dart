

import 'package:uu_app/util/cache_util.dart';

import '../../modules/login_module/dao/uu_login_dao.dart';

enum HttpMethod{
  get,post,delete
}

abstract class BaseRequest{

  ///是否需要登录
  bool needLogin();
  ///路径参数
  var pathParams;
  ///是否https
  var useHttps = true;
  ///域名
  String authority(){
    return "api.devio.org";
  }

  ///请求方式
  HttpMethod httpMethod();

  ///请求path
  String path();

  ///拼接url
 String url(){
    Uri uri;
    var pathStr = path();
    if (pathParams != null){
      if (pathStr.endsWith("/")){
        pathStr = "$pathStr$pathParams";
      }else{
        pathStr = "$pathStr/$pathParams";
      }
    }
    if (useHttps){
      uri = Uri.https(authority(), pathStr,requestParams);
    } else{
      uri = Uri.http(authority(), pathStr,requestParams);
    }

    if (needLogin()){
      if (UUCache.instance.containsKey("boarding-pass")){
        addHeaderParams("boarding-pass", UUCache.instance.get<String>("boarding-pass") ?? "");
      }
      print(header);
    }
    print("请求url:${uri.toString()}");
    return uri.toString();
 }

 ///设置请求参数
 Map <String,dynamic> requestParams = Map();
 BaseRequest addRequestParams(String k,Object v){
   requestParams[k] = v.toString();
   return this;
 }

 ///设置header参数
  Map <String,dynamic> header = {
  'course-flag': 'fa',
    'auth-token': 'ZmEtMjAyMS0wNC0xMiAyMToyMjoyMC1mYQ==fa',
};
 BaseRequest addHeaderParams (String k,Object v){
   header[k] = v;
   return this;
 }

}