import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Icon(
          Icons.baby_changing_station,
          color: Colors.white,
        ),
      ),
      body: const RowHome(),
    ),
  ));
}

class RowHome extends StatelessWidget {
  const RowHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      // mainAxisAlignment: MainAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        MyButton(Icons.dashboard,color:Colors.black,),
        MyButton(Icons.nature_people),
        MyButton(Icons.facebook,color:Colors.green,),
        MyButton(Icons.telegram,color:Colors.orange,),
        MyButton(Icons.tiktok,color:Colors.grey,),
      ],
    );
  }
}

class MyButton extends StatelessWidget {
  final IconData iconData;
  final Color color;

  const MyButton(this.iconData, {Key? key, this.color = Colors.yellow})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 150,
      alignment: Alignment.center,
      color: color,
      child: Icon(
      iconData,
      color: Colors.white,
    ),);
  }
}
