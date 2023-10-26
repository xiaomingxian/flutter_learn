import 'package:flutter_learn/t2_mooc_bilibili/http/core/HiNet.dart';
import 'package:flutter_learn/t2_mooc_bilibili/http/core/HiNetRes.dart';

import '../request/BaseRequest.dart';

class MockAdapter extends HiNet {


  @override
  Future<HiNetRes> send<T>(BaseRequest request) {
    return Future<HiNetRes>.delayed(const Duration(milliseconds: 300),(){
      request.url();
      return HiNetRes(code: 200, msg: "查询成功",data: [1,2,3]);
    });
  }



}
