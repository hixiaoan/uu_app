part of http_services;

class HiResponse<T> {
  HiResponse(
      {required this.data,
      this.request,
      this.statuMessage,
      this.statusCode,
      this.other});

  T data;
  BaseRequest? request;
  int? statusCode;
  String? statuMessage;
  dynamic? other;

  @override
  String toString() {
    // TODO: implement toString
    if (data is Map) {
      return json.encode(data);
    }
    return data.toString();
  }
}
