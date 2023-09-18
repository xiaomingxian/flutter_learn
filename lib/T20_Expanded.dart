import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Expand Test'),
      ),
      body: const MyExpandHomePage(),
    ),
  ));
}

class MyExpandHomePage extends StatelessWidget {
  const MyExpandHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        //flex: 1 用了这个属性 再设置长度无用
        Expanded(flex: 1, child:Container(height: 100,width: 100,color: Colors.deepOrangeAccent,child: const Center(child: Icon(Icons.telegram,color: Colors.white,),),)),
        Container(height: 100,width: 100,color: Colors.green,child: const Center(child: Icon(Icons.facebook,color: Colors.white,),),)
      ],
    );
  }
}
