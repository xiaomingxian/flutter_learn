import 'package:flutter_learn/t2_mooc_bilibili/http/core/HiNetErr.dart';
import 'package:flutter_learn/t2_mooc_bilibili/http/core/HiNetRes.dart';
import 'package:flutter_learn/t2_mooc_bilibili/http/dao/UserAccountDao.dart';
import 'package:flutter_learn/t2_mooc_bilibili/http/request/BaseRequest.dart';

import '../../constants/Interface.dart';
import 'MockAdapter.dart';

class HiNet {
  // HiNet._();

  ///私有构造方法
  static final HiNet _instance=HiNet();

  static HiNet getInstance() {
    return _instance;
  }


  Future fire(BaseRequest request) async {
    //返回统一响应
    HiNetRes res;
    bool fail=false;
    try{
       res = await send(request);
    }on HiNetErr catch(e){
      print("发生异常:::$e");
      res=e.data;
      fail=true;
    }catch(e){
      print("发生异常222:::$e");
      res=HiNetRes(code: -1,msg: "未知错误");
      fail=true;
    }
   int resCode= res.code;
    if(fail){
      switch(resCode){
        case 200:
          return res.data;
        case 401:
          throw LoginErr();
        case 403:
          throw AuthErr(res.msg);
        default:
          throw HiNetErr(-1, "未知错误");
      }
    }
    return res;
  }

  ///dynamic 可以是各种类型 也可以是没有返回值
  Future<dynamic> send<T>(BaseRequest request) async {
    //添加token
    request.addHeader(XXM.TOKEN, UserAccountDao.getToken());
    return MockAdapter().send(request);
  }
}
