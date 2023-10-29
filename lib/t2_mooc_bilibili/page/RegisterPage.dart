import 'package:flutter/material.dart';
import 'package:flutter_learn/t2_mooc_bilibili/http/dao/UserAccountDao.dart';
import 'package:flutter_learn/t2_mooc_bilibili/ui/AppBar.dart';
import 'package:flutter_learn/t2_mooc_bilibili/ui/LoginInput.dart';
import 'package:flutter_learn/t2_mooc_bilibili/util/LogUtil.dart';

import '../common/common_err.dart';
import '../ui/login_effect.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback jumpToLogin;

  const RegisterPage({Key? key, required this.jumpToLogin}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool protect = false;
  late String userName;
  late String pwd;
  late String pwdRe;
  late String phone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("注册", "登陆", () {
        LogUtil.printLog("点击appBar右侧", StackTrace.current);
      }),
      body: ListView(
        children: [
          LoginEffect(
            protect: protect,
          ),
          LoginInput(
            title: "姓名",
            hint: "请输入用户名",
            onChanged: (text) {
              userName = text;
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
              pwd = text;
              LogUtil.printLog('密码：：$text', StackTrace.current);
            },
            focusChanged: (focus) {
              setState(() {
                protect = focus;
              });
              LogUtil.printLog('密码焦点是否改变:$focus', StackTrace.current);
            },
            keyBoardType: TextInputType.text,
          ),
          LoginInput(
            title: "确认密码",
            hint: "请输入密码",
            obscureText: true,
            lineStretch: true,
            onChanged: (text) {
              pwdRe = text;
              LogUtil.printLog('确认密码：：$text', StackTrace.current);
            },
            focusChanged: (focus) {
              setState(() {
                protect = focus;
              });
              LogUtil.printLog('确认密码焦点是否改变:$focus', StackTrace.current);
            },
            keyBoardType: TextInputType.text,
          ),
          LoginInput(
            title: "手机号",
            hint: "手机号",
            obscureText: false,
            onChanged: (text) {
              phone = text;
              LogUtil.printLog('手机号：：$text', StackTrace.current);
            },
            focusChanged: (focus) {
              setState(() {});
              LogUtil.printLog('手机号焦点是否改变:$focus', StackTrace.current);
            },
            keyBoardType: TextInputType.phone,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, top: 20, right: 20),
            child: _loginButton(),
          )
        ],
      ),
    );
  }

  _loginButton() {
    return InkWell(
      child: const Text("注册"),
      onTap: () {
        //校验参数有没有填写
        checkParams();
        //发送请求
        LogUtil.printLog("点击了注册按钮", StackTrace.current);
      },
    );
  }

  void checkParams() async {
    if (userName.isEmpty) {
      throw CommonException(-1, "用户名不得为空");
    }
    if (pwd.isEmpty || pwdRe.isEmpty) {
      throw CommonException(-1, "密码不得为空");
    }
    if (pwdRe != pwd) {
      throw CommonException(-1, "密码输入不一致");
    }
    if (phone.isEmpty) {
      throw CommonException(-1, "手机号不得为空");
    }
    var res = await UserAccountDao.register(userName, pwd, phone);
    printLog("注册结果:$res", StackTrace.current);
  }
}
