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


///Navigator 2.0 提供了一些列全新的接口，可以实现将路由状态成为应用装状态的一部分
///并提供解析来自底层平台(如Web URL)的路由的新功能
///新增的Api如下
/// 1.Page:用来表示Navigator 路由栈中各个页面的不可变对象
///   > Page是个抽象类通常使用他的派生类:MaterialPage或CupertinoPage
/// 2.Router:用来配置要由Navigator展示的页面列表，通常该页面列表会根据系统或用用程序的状态改变而改变
///   > 除了可以直接食用Router本身外还可以使用MaterialApp.router()来创建Router
/// 3.RouterDelegate:定义用用程序中的路由行为，例如Router 如何知道应用程序状态的变化以及如何响应
///   > 主要的工作就是监听RouteInformationParser和应用状态,并使用当前列表来构建Pages
/// 4.RouteInformationParser可缺省,主要应用于web，持有RouteInformationProvider提供的RouteInformation,可以将其解析为我们定义的数据类型
/// 5.BackButtonDispatcher:响应后退按钮，并通知Router



///路由  RouteInformationParser 接受一个泛型 泛型为数据
class BiliBiliRouterInformationParser extends RouteInformationParser<BiliBiliRouterPath>{
    @override
    Future<BiliBiliRouterPath> parseRouteInformation(RouteInformation routeInformation) async{
     final uri= Uri.parse(routeInformation.location);
     // routeInformation.uri
     printLog("uri:$uri", StackTrace.current);
    if(uri.pathSegments.isEmpty){
      return BiliBiliRouterPath.home();
    }
     return BiliBiliRouterPath.detail();
    }
}

//定义数据路由 path
class BiliBiliRouterPath{
  final String location;
  // 表示创建一个 BiliBiliRouterPath 对象,通过执行 home() 命名构造方法。 等同于下面
  BiliBiliRouterPath.home():location="/";
  // BiliBiliRouterPath.home(){
  //   location="/";
  // }
  BiliBiliRouterPath.detail():location="/detail";
}

///ChangeNotifier 通过这个修改状态
class BiliBiliRouterDelegate extends RouterDelegate<BiliBiliRouterPath>
    with ChangeNotifier,PopNavigatorRouterDelegateMixin<BiliBiliRouterPath>{

  @override
  final GlobalKey<NavigatorState> navigatorKey;
  ///构造方法 与 BiliBiliRouterPath.home():location="/"; 的区别只是不是命名构造函数
  BiliBiliRouterDelegate():navigatorKey=GlobalKey<NavigatorState>();

  ///页面
  late List<MaterialPage> pages;

  @override
  Widget build(BuildContext context) {
    pages=[];
    return Navigator(
      key: navigatorKey,
      pages: pages,
      onPopPage: (route,result){
        // eg:didPop是否可以返回
        // return route.didPop(result);
        return true;
      },
    );
  }


  @override
  void addListener(VoidCallback listener) {
    // TODO: implement addListener
  }


  @override
  Future<bool> popRoute() {
    // TODO: implement popRoute
    throw UnimplementedError();
  }

  @override
  void removeListener(VoidCallback listener) {
    // TODO: implement removeListener
  }

  @override
  Future<void> setNewRoutePath(BiliBiliRouterPath configuration) {
    // TODO: implement setNewRoutePath
    throw UnimplementedError();
  }

}