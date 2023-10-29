import 'package:flutter/material.dart';
import 'package:flutter_learn/t2_mooc_bilibili/page/RegisterPage.dart';
import 'package:flutter_learn/t2_mooc_bilibili/util/LogUtil.dart';

import 'constants/color.dart';

main() {
  runApp(const BiliBiliHomePage());
}

class BiliBiliHomePage extends StatefulWidget {
  const BiliBiliHomePage({Key? key}) : super(key: key);

  @override
  _BiliBiliHomePageState createState() => _BiliBiliHomePageState();
}

class _BiliBiliHomePageState extends State<BiliBiliHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: white),
      home: RegisterPage(
        jumpToLogin: () {
          printLog("跳转登录页方法执行", StackTrace.current);
        },
      ),
    );
  }
}
