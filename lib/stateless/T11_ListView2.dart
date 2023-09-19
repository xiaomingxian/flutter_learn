import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const MyListViewApp());
}
class MyListViewApp extends StatelessWidget {
  const MyListViewApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('bar'),),
        body: const MyListViewHome(),
      ),
    );
  }
}

class MyListViewHome extends StatelessWidget {
  const MyListViewHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection:Axis.vertical,
      children: [
        Container(height: 100,decoration: const BoxDecoration(color: Colors.green,),),
        Container(height: 100,decoration: const BoxDecoration(color: Colors.red,),),
        Container(height: 100,decoration: const BoxDecoration(color: Colors.lightBlue,),),
        Container(height: 100,decoration: const BoxDecoration(color: Colors.amberAccent,),),
        Container(height: 100,decoration: const BoxDecoration(color: Colors.cyanAccent,),),
        Container(height: 100,decoration: const BoxDecoration(color: Colors.greenAccent,),),
        Container(height: 100,decoration: const BoxDecoration(color: Colors.green,),),
        Container(height: 100,decoration: const BoxDecoration(color: Colors.red,),),
        Container(height: 100,decoration: const BoxDecoration(color: Colors.lightBlue,),),
        Container(height: 100,decoration: const BoxDecoration(color: Colors.amberAccent,),),
        Container(height: 100,decoration: const BoxDecoration(color: Colors.cyanAccent,),),
        Container(height: 100,decoration: const BoxDecoration(color: Colors.greenAccent,),),
        Container(height: 100,decoration: const BoxDecoration(color: Colors.green,),),
        Container(height: 100,decoration: const BoxDecoration(color: Colors.red,),),
        Container(height: 100,decoration: const BoxDecoration(color: Colors.lightBlue,),),
        Container(height: 100,decoration: const BoxDecoration(color: Colors.amberAccent,),),
        Container(height: 100,decoration: const BoxDecoration(color: Colors.cyanAccent,),),
        Container(height: 100,decoration: const BoxDecoration(color: Colors.greenAccent,),),
        Container(height: 100,decoration: const BoxDecoration(color: Colors.green,),),
        Container(height: 100,decoration: const BoxDecoration(color: Colors.red,),),
        Container(height: 100,decoration: const BoxDecoration(color: Colors.lightBlue,),),
        Container(height: 100,decoration: const BoxDecoration(color: Colors.amberAccent,),),
        Container(height: 100,decoration: const BoxDecoration(color: Colors.cyanAccent,),),
        Container(height: 100,decoration: const BoxDecoration(color: Colors.greenAccent,),),
      ],
    );
  }
}
