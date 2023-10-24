enum HttpMethod { GET, POST, DELETE }

/// dynamic关键字顾名思义，动态类型，相比var关键字更加灵活多变，赋值不限制类型，
/// 且在后续赋值中可以改变类型。 要小心使用这个关键字，如果调用了不存在的方法或者变量，
/// 则无法在编译期报错，而会在运行期报错

abstract class BaseRequest {
  ///路径参数
  var pathParams;

  /// 是否用https
  var useHttps = true;

  ///
  Map<String, String> params = {};
  Map<String, dynamic> header = {};

  ///待子类实现 请求方式
  HttpMethod httpMethod();

  ///请求路径 待子类实现
  String path();

  ///请求url
  String url() {
    Uri uri;
    String pathStr = path();
    if (pathParams != null) {
      pathStr =
          pathStr.endsWith("/") ? "$path()$pathParams" : "$path()/$pathParams";
    }
    uri = useHttps
        ? Uri.https(authority(), pathStr, params)
        : Uri.http(authority(), pathStr, params);
    return uri.toString();
  }

  String authority() {
    return "";
  }

  ///添加参数
  BaseRequest addParams(String k, Object v) {
    pathParams[k] = v.toString();
    return this;
  }

  BaseRequest addHeader(String k, String v) {
    header[k]=v;
    return this;
  }
}
