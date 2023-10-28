import 'package:flutter_learn/t2_mooc_bilibili/constants/Interface.dart';
import 'package:flutter_learn/t2_mooc_bilibili/db/HiCache.dart';
import 'package:flutter_learn/t2_mooc_bilibili/http/core/HiNet.dart';
import 'package:flutter_learn/t2_mooc_bilibili/http/request/BaseRequest.dart';
import 'package:flutter_learn/t2_mooc_bilibili/http/request/LoginRequest.dart';
import 'package:flutter_learn/t2_mooc_bilibili/util/LogUtil.dart';

import '../core/HiNetRes.dart';

class UserAccountDao {
  static login(String userName, String pwd) async {
    BaseRequest request =
        LoginRequest().addParams("userName", userName).addParams("pwd", pwd);
    return await _send(request);
  }

  static loginByPhone(String phone, String pwd) async {
    BaseRequest request =
        LoginRequest().addParams("phone", phone).addParams("pwd", pwd);
    return await _send(request);
  }

  static Future<bool> _send(BaseRequest request) async {
    var res = await HiNet.getInstance().fire(request) as HiNetRes;
    if (res.success()) {
      LogUtil.printLog("发送请求成功，存储token:${res.data}", StackTrace.current);
      HiCache.cacheData(XXM.TOKEN, res.data);
    }
    return res.success();
  }

  ///获取token
  static String getToken(){
    return HiCache.get(XXM.TOKEN).toString();
  }

  static register(String userName, String pwd, String phone) async {
    BaseRequest request = LoginRequest()
        .addParams("userName", userName)
        .addParams("pwd", pwd)
        .addParams("phone", phone);
    return await _send(request);
  }
}
