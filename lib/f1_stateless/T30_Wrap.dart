import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text("Wrap测试"),
      ),
      body: const MyLayOut(),
    ),
  ));
}

class MyLayOut extends StatelessWidget {
  const MyLayOut({Key? key}) : super(key: key);

  static List<MyButton> getList() {
    List<MyButton> res = [];
    for (int i = 0; i < 20; i++) {
      res.add(MyButton(("Flutter元素${i}"), func: null));
    }

    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Wrap(
        direction: Axis.horizontal,//默认横轴
        runSpacing: 10,
        spacing: 10,
        alignment: WrapAlignment.start,
        children: getList(),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  ///?是允许为空
  void Function()? func;

  String text;

  MyButton(this.text, {Key? key, required this.func}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: func,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.lightGreen),
          foregroundColor: MaterialStateProperty.all(Colors.white),
        ),
        child: Text(text));
  }
}
