part of http_services;

class HttpServices {
  HttpServices._();

  static HttpServices get instance => HttpServices._();

  Future<dynamic> request(BaseRequest request) async {
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
