import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text("对齐方式 Align")),
      body: const MyAlign(),
    ),
  ));
}

class MyAlign extends StatelessWidget {
  const MyAlign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return const Align(
    //   alignment: Alignment.center,
    //   child: Text("居中内容测试"),
    // );
    return const Center(
      child: Text("居中内容测试2"),
    );
  }
}
