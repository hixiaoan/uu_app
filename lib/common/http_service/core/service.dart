part of http_services;

class HttpServices {
  HttpServices._();

  final Map<String, dynamic> _httpHeader = {};

  static HttpServices get instance => HttpServices._();

  HttpServices addHeaderParams(String k, Object v) {
    _httpHeader[k] = v;
    return this;
  }

  Future<dynamic> request(BaseRequest request) async {
    assert(!_httpHeader.isEmpty, "请配置请求heder");
    request.header = _httpHeader;
    HiResponse? response;
    Object? error;
    try {
      response = await send(request);
    } on NetError catch (e) {
      error = e;
      response?.data = e;
    } catch (e) {
      error = e;
    }
    if (response == null) {
      log(error);
    }
    var result = response?.data;

    switch (response?.statusCode) {
      case 200:
        return result;
      case 401:
        throw LoginError();
      case 403:
        throw AuthError(result.toString(), data: result);
      default:
        {
          throw NetError(
              code: response!.statusCode!,
              message: result.toString(),
              data: result);
        }
    }
  }

  Future<HiResponse<T>> send<T>(BaseRequest request) async {
    DioAdapter adapter = DioAdapter();

    return adapter.send(request);
  }

  void log(log) {
    print("uu_net:$log");
  }
}
