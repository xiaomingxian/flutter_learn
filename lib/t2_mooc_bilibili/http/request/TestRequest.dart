import 'package:flutter_learn/t2_mooc_bilibili/http/request/BaseRequest.dart';

class TestRequest extends BaseRequest {
  @override
  HttpMethod httpMethod() {
    throw HttpMethod.GET;
  }

  @override
  String path() {
    return "/api/site/checkLoginByToken";
  }
}
