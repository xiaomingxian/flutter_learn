import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserSettingPage extends StatefulWidget {
  const UserSettingPage({Key? key}) : super(key: key);

  @override
  _UserSettingPageState createState() => _UserSettingPageState();
}

class _UserSettingPageState extends State<UserSettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("我是用户中心",),),
    );
  }
}
