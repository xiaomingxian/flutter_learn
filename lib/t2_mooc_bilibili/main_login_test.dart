import 'package:flutter/material.dart';
import 'package:flutter_learn/t2_mooc_bilibili/db/HiCache.dart';
import 'package:flutter_learn/t2_mooc_bilibili/http/dao/UserAccountDao.dart';
import 'package:flutter_learn/t2_mooc_bilibili/util/LogUtil.dart';


main() {
  runApp(const BiliBiliHomePage());
}

class BiliBiliHomePage extends StatefulWidget {
  const BiliBiliHomePage({Key? key}) : super(key: key);

  @override
  _BiliBiliHomePageState createState() => _BiliBiliHomePageState();
}

class _BiliBiliHomePageState extends State<BiliBiliHomePage> {
  void getTestData() async{
    // TestRequest request = TestRequest();
    // request.addParams("k1", "v1").addHeader("k2", "v2");
    // var res =await HiNet.getInstance().fire(request);
    // print("---res:$res");
    var res=await UserAccountDao.login("tom", "123456");
    LogUtil.printLog("是否登录成功:$res", StackTrace.current);
    var token= HiCache.get("token");
    LogUtil.printLog("获取到的缓存结果:$token",StackTrace.current);
  }

  @override
  Widget build(BuildContext context) {
    getTestData();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: (){
          getTestData();
        },child:const Text("刷新"),),
        appBar: AppBar(
          title: const Text("Bilibili"),
        ),
        body: const Center(
          child: Text("哔哩哔哩",style: TextStyle(fontSize: 40),),
        ),
      ),
    );
  }
}
