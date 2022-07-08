


import 'package:uu_app/uu_http_services/core/uu_net_adapter.dart';
import 'package:uu_app/uu_http_services/core/uu_net_error.dart';
import 'package:uu_app/uu_http_services/core/uu_response.dart';
import 'package:uu_app/uu_http_services/request/base_request.dart';
import 'package:dio/dio.dart';

class DioAdapter extends UUNetAdapter{
  @override
  Future<UUResponse<T>> send<T>(BaseRequest request) async {

    Response respones;
    var options = Options(headers: request.header);
    var error;
    try {
      switch (request.httpMethod()){
        case HttpMethod.get:
          respones = await Dio().get(request.url(),options: options);
          break;
        case HttpMethod.post:
          respones = await Dio().post(request.url(),data: request.requestParams,options: options);
          break;
        case HttpMethod.delete:
          respones = await Dio().delete(request.url(),data: request.requestParams,options: options);
          break;
      }
    } on DioError catch(e){
      error = e;
      respones = e.response!;
    }
    print("DioAdapter respones:$respones");
    return _buildResponse(respones, request);
  }

  UUResponse<T> _buildResponse<T>(Response response,BaseRequest request ){
    return UUResponse<T>(
        data: response.data,
        request: request,
        statusCode: response.statusCode,
        statuMessage: response.statusMessage,
        other: response
    );
  }

}