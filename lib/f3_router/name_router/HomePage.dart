import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Center(
        child: ElevatedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, '/search',arguments: {
                "key":"测试参数"
              });
            },
            icon: Icon(Icons.search),
            label: Text("跳转到搜索页面")),
      ),
    );
  }
}
