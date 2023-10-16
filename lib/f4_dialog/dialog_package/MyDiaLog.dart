import 'package:flutter/material.dart';

class MyDiaLog extends Dialog {
  const MyDiaLog

  ({super.key});

  Widget build(BuildContext context) {
    return Material(
      //设置背景透明
        type: MaterialType.transparency,
        child: Center(child: Container(
          height: 100,
          width: 200,
          child: Center(child: Text("我是自定义DiaLog")),
          color: Colors.white,
        ) ,)
    );
  }
}
