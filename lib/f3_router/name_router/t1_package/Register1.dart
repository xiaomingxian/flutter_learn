import 'package:flutter/material.dart';

class Register1 extends StatefulWidget {
  const Register1({Key? key}) : super(key: key);

  @override
  _Register1State createState() => _Register1State();
}

class _Register1State extends State<Register1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("注册页面1"),
      ),
      body: Center(
        child: ElevatedButton.icon(
            onPressed: () {
              //跳转到上个页面
              // Navigator.of(context).pop();
              //替换路由 eg:原本跳到此页面 现在让直接跳转到下个页面 那么下个页面返回时直接返回到上个页面
              //todo 使用场景是什么呢
              Navigator.of(context).pushReplacementNamed('/register2');
            },
            icon: Icon(Icons.app_registration),
            label: Text("注册第一步")),
      ),
    );
  }
}
