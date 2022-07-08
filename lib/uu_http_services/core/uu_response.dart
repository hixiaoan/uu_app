

import 'dart:convert';

import 'package:uu_app/uu_http_services/request/base_request.dart';



class UUResponse<T>{

  UUResponse(
      {
        required this.data,
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
    if (data is Map){
      return json.encode(data);
    }
    return data.toString();
  }
}