import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/stateless/T18_Row.dart';

void main(){
  runApp(MaterialApp(home: Scaffold(
    appBar: AppBar(title: const Icon(Icons.one_k,color: Colors.white,),),
    body: const MyFlexHome(),
  ),));
}
/// flex 弹性布局
class MyFlexHome extends StatelessWidget {
  const MyFlexHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const Flex(
      direction: Axis.horizontal,
      // direction: Axis.vertical,
      children: [
      Expanded(
        flex: 1,
        child: MyButton(Icons.telegram,color:Colors.green,),),
      Expanded(
        flex: 2,
        child: MyButton(Icons.facebook,color:Colors.black,),)
    ],);
  }
  // @override
  // Widget build(BuildContext context) {
  //   return const Row(children: [
  //    Expanded(
  //      flex: 1,
  //      child: MyButton(Icons.telegram,color:Colors.green,),),
  //     Expanded(
  //       flex: 2,
  //       child: MyButton(Icons.facebook,color:Colors.black,),)
  //   ],);
  // }
}
