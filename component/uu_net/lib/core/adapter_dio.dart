

part of http_services;

class DioAdapter extends NetAdapter{
  @override
  Future<HiResponse<T>> send<T>(BaseRequest request) async {

    Response respones;
    var options = Options(headers: request.header);
    DioError error;
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

  HiResponse<T> _buildResponse<T>(Response response,BaseRequest request ){
    return HiResponse<T>(
        data: response.data,
        request: request,
        statusCode: response.statusCode,
        statuMessage: response.statusMessage,
        other: response
    );
  }

}