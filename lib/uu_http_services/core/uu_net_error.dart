

///登录异常
class UULoginError extends UUNetError{

  UULoginError({int code:401,String message:"未登录"}):super(code: code,message: message);
}

///授权异常
class UUAuthError extends UUNetError {
  UUAuthError(String message, {int code: 403, dynamic data})
      : super(code: code, message: message, data: data);
}

/// 网络异常统一格式类
class UUNetError implements Exception{

  UUNetError({required this.code, required this.message, this.data});

  final int code;
  final String message;
  final dynamic data;

}