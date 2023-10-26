import 'package:flutter_learn/t2_mooc_bilibili/db/HiCache.dart';
import 'package:flutter_learn/t2_mooc_bilibili/http/core/HiNet.dart';
import 'package:flutter_learn/t2_mooc_bilibili/http/request/BaseRequest.dart';
import 'package:flutter_learn/t2_mooc_bilibili/http/request/LoginRequest.dart';

import '../http/core/HiNetRes.dart';

class UserAccountDao {
  static login(String userName,String pwd){
    BaseRequest request=LoginRequest()
        .addParams("userName", userName)
        .addParams("pwd", pwd);
    _send(request);
  }

  static loginByPhone(String phone,String pwd){
    BaseRequest request=LoginRequest()
        .addParams("phone", phone)
        .addParams("pwd", pwd);
    _send(request);
  }

  static void _send(BaseRequest request) {
    HiNetRes res= HiNet.getInstance().fire(request) as HiNetRes;
    if(res.success()){
      HiCache.cacheData("token",res.data);
    }
  }

  static register(String userName,String pwd,String phone){
    BaseRequest request=LoginRequest()
        .addParams("userName", userName)
        .addParams("pwd", pwd)
        .addParams("phone", phone);
    _send(request);
  }

}