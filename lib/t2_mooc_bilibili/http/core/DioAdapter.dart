import 'package:dio/dio.dart';
import 'package:flutter_learn/t2_mooc_bilibili/http/core/HiNet.dart';
import 'package:flutter_learn/t2_mooc_bilibili/http/core/HiNetErr.dart';

import '../request/BaseRequest.dart';

class DioAdapter extends HiNet {
  @override
  Future send<T>(BaseRequest request) async {
    var res,
        options =
        Options(headers: request.header);
    try {
      var httpMethod = request.httpMethod();
      if (httpMethod == HttpMethod.GET) {
        res = await Dio().get(
            request.url(), queryParameters: request.params, options: options);
      } else if (httpMethod == HttpMethod.POST) {
        res = await Dio().post(
            request.url(), queryParameters: request.params, options: options);
      }
    } on DioException catch (e) {
      res = e.response;
      throw HiNetErr(-1, e.response.toString());
    }
    return res;
  }

}