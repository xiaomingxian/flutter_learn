import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text("Card Test"),
      ),
      body: const MyCard(),
    ),
  ));
}

class MyCard extends StatelessWidget {
  const MyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),//形状 圆角
          elevation: 10,//阴影深度
          shadowColor: Colors.grey,
          margin: EdgeInsets.all(20.0),
          child: Column(
            children: [
              ListTile(
                title: Text(
                  "张三",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                subtitle: Text("性别:男 年龄:24"),
              ),
              ListTile(title: Text("毕业院校:国防科技大学")),
              ListTile(title: Text("高级Java工程师")),
              ListTile(title: Text("岗位:Google工程师")),
            ],
          ),
        ),
        Card(
          child: Text("卡片2"),
        ),
        Card(
          child: Text("卡片3"),
        ),
      ],
    );
  }
}
