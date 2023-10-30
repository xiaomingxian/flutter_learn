import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/t2_mooc_bilibili/page/login_page.dart';
import 'package:flutter_learn/t2_mooc_bilibili/util/LogUtil.dart';

import 'constants/color.dart';

///全局异常的捕捉
class AppCatchError {
  run(Widget app) {
    ///Flutter 框架异常
    FlutterError.onError = (FlutterErrorDetails details) async {
      ///线上环境
      ///TODO
      if (kReleaseMode) {
        Zone.current.handleUncaughtError(details.exception, details.stack!);
      } else {
        //开发期间 print
        FlutterError.dumpErrorToConsole(details);
      }
    };

    runZonedGuarded(() {
      //受保护的代码块
      runApp(app);
    }, (error, stack) => catchError(error, stack));
  }

  ///对搜集的 异常进行处理  上报等等
  catchError(Object error, StackTrace stack) {
    printLog("是否是 Release版本: $kReleaseMode",StackTrace.current); //是否是 Release版本
    printLog('异常信息:$error,stack$stack',StackTrace.current);
  }
}


main() {
  AppCatchError().run(const BiliBiliHomePage());
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
      // home: RegisterPage(jumpToLogin: () {
      //   printLog("跳转登录页方法执行", StackTrace.current);
      //   },
      home: LoginPage(),
    );
  }
}
