import 'package:flutter_learn/t2_mooc_bilibili/http/request/BaseRequest.dart';

class LoginRequest extends BaseRequest{
  @override
  HttpMethod httpMethod() {
    return HttpMethod.POST;
  }

  @override
  String path() {
    return "/xxm/login";
  }

}