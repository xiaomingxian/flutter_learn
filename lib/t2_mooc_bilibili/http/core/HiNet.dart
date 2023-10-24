import 'package:flutter_learn/t2_mooc_bilibili/http/request/BaseRequest.dart';

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

class HiNet{
  ///私有构造方法
  HiNet._();
  static late HiNet _instance;
  static HiNet getInstance(){
    //在 Dart 中,??= 是一个运算符,表示 null 合并赋值(null-aware assignment)
    _instance ??= HiNet._();
    return _instance;
  }

  Future fire(BaseRequest request) async {
    var res = await send(request);
    return res['data'];
  }

  ///dynamic 可以是各种类型 也可以是没有返回值
  Future<dynamic> send<T> (BaseRequest request) async{
    return Future.value({"code":0,"message":"success","data":[1,2,3]});
  }

}