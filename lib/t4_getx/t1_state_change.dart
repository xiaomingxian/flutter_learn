import 'package:flutter/material.dart';
import 'package:get/get.dart';


///短暂的状态管理
main() => runApp(MaterialApp(home: MyApp(),));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var count = 0.obs;
    return Scaffold(
      appBar: AppBar(
        title: Text("计数器（状态管理器）"),
      ),
      body: Center(
        child: Obx(()=>Text("$count",style: TextStyle(fontSize: 80),)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          count++;
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
