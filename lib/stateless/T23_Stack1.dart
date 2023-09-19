import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text("demo1浮动导航和下滑列表", style: TextStyle(
          backgroundColor: Colors.lightGreen, color: Colors.white),),),
      body:MyStackDemo1(),
    ),
  ));
}

class MyStackDemo1 extends StatelessWidget {
  const MyStackDemo1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final contentSize = MediaQuery
        .of(context)
        .size;
    return Stack(
      children: [
        Positioned(
          child:
            ListView(
              padding: EdgeInsets.fromLTRB(contentSize.width/2-30, 50, 0, 0),
              children: const [
                ListTile(title: Text("标题1"),),
                ListTile(title: Text("标题2"),),
                ListTile(title: Text("标题3"),),
                ListTile(title: Text("标题1"),),
                ListTile(title: Text("标题1"),),
                ListTile(title: Text("标题1"),),
                ListTile(title: Text("标题1"),),
                ListTile(title: Text("标题1"),),
                ListTile(title: Text("标题1"),),
                ListTile(title: Text("标题1"),),
                ListTile(title: Text("标题1"),),
                ListTile(title: Text("标题1"),),
                ListTile(title: Text("标题1"),),
                ListTile(title: Text("标题1"),),
                ListTile(title: Text("标题1"),),
                ListTile(title: Text("标题1"),),
                ListTile(title: Text("标题1"),),
                ListTile(title: Text("标题1"),),
                ListTile(title: Text("标题1"),),
                ListTile(title: Text("标题1"),),
            ],),
        ),
        Positioned(
            top: 0,
            width: contentSize.width,
            height: 50,
            child: Container(
              color: Colors.lightGreen,
              alignment: Alignment.center,
              child: const Text("顶部导航",style: TextStyle(fontSize: 20,color: Colors.white,backgroundColor: Colors.lightGreen),),
            )),
        Positioned(
            bottom: 0,
            width: contentSize.width,
            height: 50,
            child: Container(
              color: Colors.yellowAccent,
              alignment: Alignment.center,
              child: const Text("底部导航",style: TextStyle(fontSize: 20,color: Colors.green),),
            )),
      ],
    );
  }
}
