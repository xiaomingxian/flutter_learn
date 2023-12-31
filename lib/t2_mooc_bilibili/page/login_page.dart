import 'package:flutter/material.dart';
import 'package:flutter_learn/t2_mooc_bilibili/http/dao/UserAccountDao.dart';
import 'package:flutter_learn/t2_mooc_bilibili/util/LogUtil.dart';
import 'package:flutter_learn/t2_mooc_bilibili/util/toast.dart';
import 'package:flutter_learn/t2_mooc_bilibili/widget/AppBar.dart';
import 'package:flutter_learn/t2_mooc_bilibili/widget/LoginInput.dart';
import 'package:flutter_learn/t2_mooc_bilibili/widget/login_button.dart';

import '../widget/login_effect.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool protect = false;
  String userName = '';
  String pwd = '';
  bool loginEnable = false;

  @override
  Widget build(BuildContext context) {
    print('重新加载111');
    return Scaffold(
      appBar: appBar("登陆", "注册", () {
        LogUtil.printLog("点击了登录右侧按钮", StackTrace.current);
      }),
      body: Container(
        child: ListView(
          children: [
            LoginEffect(
              protect: protect,
            ),
            LoginInput(
                title: "用户名",
                hint: "请输入用户名",
                onChanged: (text) {
                  setState(() {
                    userName = text;
                    loginEnable = userName.isNotEmpty && pwd.isNotEmpty;
                  });
                },
                focusChanged: (focus) {},
                keyBoardType: TextInputType.text),
            LoginInput(
                title: "密码",
                hint: "请输入密码",
                obscureText: true,
                onChanged: (text) {
                  setState(() {
                    pwd = text;
                    loginEnable = userName.isNotEmpty && pwd.isNotEmpty;
                  });
                },
                focusChanged: (focus) {
                  setState(() {
                    protect = focus;
                  });
                },
                keyBoardType: TextInputType.text),
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
              ),
              child: LoginButton(
                "登陆",
                enable: loginEnable,
                onPressed:send,
              ),
            )
          ],
        ),
      ),
    );
  }

  send() {

    if (loginEnable) {
      UserAccountDao.login(userName!, pwd!).then((res) {
        LogUtil.printLog("登陆结果:$res", StackTrace.current);
        showSuccessToast("登陆成功");
      });
    }
  }
}
