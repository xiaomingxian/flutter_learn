import 'package:flutter_learn/t2_mooc_bilibili/http/core/HiNetErr.dart';
import 'package:flutter_learn/t2_mooc_bilibili/http/core/HiNetRes.dart';
import 'package:flutter_learn/t2_mooc_bilibili/http/request/BaseRequest.dart';

import 'MockAdapter.dart';

///在这个代码中,async和await都是用于异步编程的关键字。
///
/// async用于标记一个函数是异步的,await用于等待一个异步函数的结果。
///
/// 具体到这个例子:
///
/// fire方法标记为async,表示它是一个异步方法
/// 在fire方法中,使用await等待send方法的结果
/// send方法也标记为async,表示它是异步方法
/// send方法使用Future.value同步返回了一个模拟结果
/// 由于send是异步方法,如果不用await等待,fire会在send执行完前返回
/// 通过await,fire会等待send执行完成,再返回send的结果
/// 总结:
///
/// async标记一个方法是异步的
/// await使得代码等待一个异步方法完成,再继续执行后面的代码
/// 这样可以同步代码的写法,却实现异步的效果,非常方便
/// 所以在这里,async和await让代码可以更清晰直观地表达异步调用的逻辑

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
      res=e.data;
      fail=true;
    }catch(e){
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

    return MockAdapter().send(request);
  }
}
