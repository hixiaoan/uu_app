part of http_services;

abstract class NetAdapter {
  Future<HiResponse<T>> send<T>(BaseRequest request);
}
