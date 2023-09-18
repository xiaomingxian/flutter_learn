import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main(){
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text("Stack and Align"),),
      body: const MyStackAndAlign(),
    ),
  ));
}

class MyStackAndAlign extends StatelessWidget {
  const MyStackAndAlign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Align(alignment: Alignment.topLeft, child: Text("左边"),),
        Align(alignment: Alignment.topRight, child: Text("右边"),),
      ],
    );
  }
}
