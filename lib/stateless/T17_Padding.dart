import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Icon(
          Icons.dashboard,
          color: Colors.white,
        ),
      ),
      body: const MyPadding(),
    ),
  ));
}

class MyPadding extends StatelessWidget {
  const MyPadding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(50),
      child: Text("仅做padding设置 使用Padding组件占用内存更小"),
    );
  }
}
