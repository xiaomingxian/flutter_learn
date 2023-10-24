///登陆异常
class LoginErr extends HiNetErr {
  LoginErr({int code = 401,String msg="需要登录"}): super(code, msg);
}

///授权异常
class AuthErr extends HiNetErr {
  AuthErr(String msg,{int code = 403, dynamic data}): super(code, msg, data: data);
}

///网络异常统一格式
class HiNetErr {
  final int code;
  final String msg;
  final dynamic data;

  HiNetErr(
    this.code,
    this.msg, {
    this.data,
  });
}
