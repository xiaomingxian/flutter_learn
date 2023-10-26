import 'package:flutter/material.dart';
import 'package:flutter_learn/t2_mooc_bilibili/db/HiCache.dart';

main(){
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String barTitle="SharedPreferences缓存测试";
  String showText="缓存前的数据";
  int count=0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            setState(() {
              count++;
              HiCache.cacheData("k1", "缓存后的结果$count");
              showText=HiCache.get("k1") as String;
            });
          },
          child:const Text("刷新"),
        ),
        appBar: AppBar(title: Text(barTitle),),
        body: Center(child: Text(showText,key: GlobalKey(),style:const TextStyle(fontSize: 40),),),
      ),
    );
  }

}
