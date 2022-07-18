part of http_services;

///登录异常
class LoginError extends NetError {
  LoginError({int code = 401, String message = "未登录"})
      : super(code: code, message: message);
}

///授权异常
class AuthError extends NetError {
  AuthError(String message, {int code = 403, dynamic data})
      : super(code: code, message: message, data: data);
}

/// 网络异常统一格式类
class NetError implements Exception {
  NetError({required this.code, required this.message, this.data});

  final int code;
  final String message;
  final dynamic data;
}
