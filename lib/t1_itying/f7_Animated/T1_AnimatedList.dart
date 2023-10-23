import 'dart:async';

import 'package:flutter/material.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<String> _list = ["数据一", "数据二"];
  final globalKey = GlobalKey<AnimatedListState>();
  bool canDel=true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("AnimatedList Demo"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: addLine,
          child: Icon(Icons.add),
        ),
        body: AnimatedList(
          key: globalKey,
          initialItemCount: _list.length,
          itemBuilder:
              //添加元素 animation 由0变成1
              (BuildContext context, int index, Animation<double> animation) {
            print("触发AnimatedList itemBuilder方法 ：$index");
            return _buildItem(context,index);
          },
        ),
      ),
    );
  }

  Widget _buildItem(BuildContext context,int index){
   return ListTile(
      title: Text(_list[index]),
      trailing: IconButton(
        icon: const Icon(Icons.cancel),
        onPressed: () {
          //删除行元素
          delLine(index);
        },
      ),
    );
  }

  void delLine(int index) {
    //删除过快 RangeError (index): Invalid value: Not in inclusive range 0..1: 2
    if(canDel){
      canDel=false;
      //删除行元素
      setState(() {
        //删除元素 animation 由 1变成0
        globalKey.currentState!.removeItem(index, (context, animation){
          //先构建元素 删除特效需要
          Widget lineItem=  _buildItem(context,index);
          //删除 _list 元素
          _list.removeAt(index);
          return FadeTransition(opacity: animation,child: lineItem,);
        },duration: const Duration(microseconds: 500));
        //删除完后状态恢复
      });
      Timer.periodic(Duration(microseconds: 600), (timer) {
        canDel=true;
        timer.cancel();
      });
    }

  }

  ///添加行元素
  void addLine() {
    //添加元素
    _list.add("这是一条数据");
    //下面这个方法会触发  AnimatedList 的  itemBuilder
    globalKey.currentState!.insertItem(_list.length - 1);
  }
}
