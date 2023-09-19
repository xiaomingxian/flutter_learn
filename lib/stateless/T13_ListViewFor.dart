import 'package:flutter/material.dart';

void main() {
  runApp(const MyForApp());
}

class MyForApp extends StatelessWidget {
  const MyForApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: const Text(
              "Twiter",
              style:
                  TextStyle(color: Colors.white, backgroundColor: Colors.black),
            ),
          ),
          body: const MyForHomePage()),
    );
  }
}

class MyForHomePage extends StatelessWidget {
  const MyForHomePage({Key? key}) : super(key: key);

  List<Widget> _myForListView() {
    List<Widget> res = [];
    for (var i = 0; i < 20; i++) {
      res.add(ListTile(
        title: Text('我的标题----$i'),
      ));
    }
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: _myForListView(),
    );
  }
}
