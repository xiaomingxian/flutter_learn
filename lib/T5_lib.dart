import 'dart:convert';
import 'dart:io';
import 'dart:math';

///dart:xxx 自带库
///
///
///async 异步  await 只能用在 async 修饰的方法里 不用await默认为异步
///await 等待异步完成
main() async {
  var minRes = min(10, 3);
  print(minRes);
  //io库请求
  var httpClient = new HttpClient();
  //
  var uri = new Uri.http('cip.cc');

  var request = await httpClient.getUrl(uri);

  var response = await request.close();
  
  var join =await response.transform(utf8.decoder).join();

  print(join);
}
