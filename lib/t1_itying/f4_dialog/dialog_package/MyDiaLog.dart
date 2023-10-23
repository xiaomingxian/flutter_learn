import 'dart:async';

import 'package:flutter/material.dart';

class MyDiaLog extends Dialog {
  const MyDiaLog({super.key});

  @override
  Widget build(BuildContext context) {
    _timeClose(context);
    return Material(
        //设置背景透明
        type: MaterialType.transparency,
        child: Center(
          child: Container(
            height: 100,
            width: 200,
            child: Center(child: Text("我是自定义DiaLog")),
            color: Colors.white,
          ),
        ));
  }

  _timeClose(BuildContext context) {
    //定时关闭Dialog
    Timer(Duration(seconds: 3),( ){
      print('3s已到 关闭Dialog');
      Navigator.of(context).pop();
    });
  }
}
