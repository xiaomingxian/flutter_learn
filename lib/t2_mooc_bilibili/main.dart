import 'package:flutter/material.dart';
import 'package:flutter_learn/t2_mooc_bilibili/http/core/HiNet.dart';
import 'package:flutter_learn/t2_mooc_bilibili/http/request/TestRequest.dart';

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
    TestRequest request = TestRequest();
    request.addParams("k1", "v1").addHeader("k2", "v2");
    var res =await HiNet.getInstance().fire(request);
    print("---res:$res");
  }

  @override
  Widget build(BuildContext context) {
    getTestData();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Bilibili"),
        ),
        body: const Center(
          child: Text("哔哩哔哩"),
        ),
      ),
    );
  }
}
