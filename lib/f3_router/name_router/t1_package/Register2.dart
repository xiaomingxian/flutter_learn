import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/f3_router/name_router/t1_package/HomePage.dart';

class Register2 extends StatefulWidget {
  const Register2({Key? key}) : super(key: key);

  @override
  _Register2State createState() => _Register2State();
}

class _Register2State extends State<Register2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("注册页面2"),
      ),
      body: Center(
        child: ElevatedButton.icon(
            onPressed: () {
              //返回跟路由
              Navigator.of(context).pushAndRemoveUntil(
                  CupertinoPageRoute(builder: (BuildContext buildContext) {
                    return HomePage();
                  }), (route) => false);
            },
            icon: Icon(Icons.login),
            label: Text("注册成功")),
      ),
    );
  }
}
