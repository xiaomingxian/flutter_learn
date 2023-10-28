import 'package:flutter/material.dart';
import 'package:flutter_learn/t2_mooc_bilibili/ui/AppBar.dart';
import 'package:flutter_learn/t2_mooc_bilibili/ui/LoginInput.dart';
import 'package:flutter_learn/t2_mooc_bilibili/util/LogUtil.dart';

import '../ui/login_effect.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool protect=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("注册", "登陆", (){
        LogUtil.printLog("点击appBar右侧", StackTrace.current);
      }),
      body: ListView(
        children: [
          LoginEffect(protect: protect,),
          LoginInput(
            title: "姓名",
            hint: "请输入用户名",
            onChanged: (text) {
              LogUtil.printLog('姓名：：$text', StackTrace.current);
            },
            focusChanged: (text) {
              LogUtil.printLog('焦点是否改变:$text', StackTrace.current);
            },
            keyBoardType: TextInputType.text,
          ),
          LoginInput(
            title: "密码",
            hint: "请输入密码",
            obscureText: true,
            lineStretch: true,
            onChanged: (text) {
              LogUtil.printLog('密码：：$text', StackTrace.current);
            },
            focusChanged: (focus) {
              setState(() {
                protect=focus;
              });
              LogUtil.printLog('密码焦点是否改变:$focus', StackTrace.current);
            },
            keyBoardType: TextInputType.text,
          ),
        ],
      ),
    );
  }

}
