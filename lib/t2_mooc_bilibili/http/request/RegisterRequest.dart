import 'package:flutter_learn/t2_mooc_bilibili/http/request/BaseRequest.dart';

class RegisterRequest extends BaseRequest{
  @override
  HttpMethod httpMethod()=>HttpMethod.POST;

  @override
  String path() =>"/xxm/register";

}