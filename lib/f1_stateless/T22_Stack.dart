import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text("栈测试"),
      ),
      body: const MyStackHomePage(),
    ),
  ));
}

class MyStackHomePage extends StatelessWidget {
  const MyStackHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlue,
      height: 800,
      width: 300,
      child:  Stack(//相对与外部容器进行定位，如果没有外部容器就是相对于整个屏幕定位
        children: [
          Positioned(
              left: 0,
              bottom: 0,
              child: Container(
                height: 100,
                width: 100,
                color: Colors.white,
              )
          ),
          const Positioned(
            right: 0,
            top: 0,
            child:  Text(
              "右上角",
              style: TextStyle(color: Colors.lightGreen),
            ),
          ),
        ],
      ),
    );
  }
}
