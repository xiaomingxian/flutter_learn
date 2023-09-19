import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text("AspectRatio 横纵比控制"),
      ),
      body: const MyAspectRatio(),
    ),
  ));
}

class MyAspectRatio extends StatelessWidget {
  const MyAspectRatio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 5 / 1,//高/宽
      child: Container(
        color: Colors.green,
      ),
    );
  }
}
