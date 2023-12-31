import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/t1_itying/f3_router/name_router/t1_package/HomePage.dart';
import 'package:flutter_learn/t1_itying/f3_router/name_router/t1_package/Register1.dart';
import 'package:flutter_learn/t1_itying/f3_router/name_router/t1_package/Register2.dart';
import 'package:flutter_learn/t1_itying/f3_router/name_router/t1_package/SearchPage.dart';

import '../../f5_page_view/T4_PageViewAutoChange.dart';

main() {
  runApp(const RouterHomePage());
}

class RouterHomePage extends StatefulWidget {
  const RouterHomePage({Key? key}) : super(key: key);

  @override
  _RouterHomePageState createState() => _RouterHomePageState();
}

class _RouterHomePageState extends State<RouterHomePage> {
  Map<String, Widget Function(BuildContext)> routes = {
    "/": (context) => const HomePage(),
    "/register1": (context) => const Register1(),
    "/register2": (context) => const Register2(),
    //因为是命名参数 所以得加括号 {arguments}
    "/search": (context, {arguments}) => SearchPage(
          arguments: arguments,
        ),
    "/banner": (context) =>const AutoChange(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //初始路由 todo  当使用 initialRoute 时，需 要确保你没有同时定义 home 属性。
      initialRoute: '/',
      //用这种方式不能传递参数？
      // routes: routes,
      //配置 onGenerateRoute
      onGenerateRoute: (RouteSettings settings) {
        print('--->routeSettings.name:::${settings.name}');
        final String? name = settings.name;
        //pageContentBuilder 是routes: routes, 中的方法
        final Function? pageContentBuilder = routes[name];
        if (pageContentBuilder != null) {
          //有没有参数
          if (settings.arguments != null) {
            //安卓风格跳转
            // final Route route = MaterialPageRoute(
            //苹果风格跳转
            final Route route = CupertinoPageRoute(
                builder: (context) =>
                    //传递参数
                    pageContentBuilder(context, arguments: settings.arguments));
            return route;
          } else {
            final Route route = CupertinoPageRoute(
                builder: (context) => pageContentBuilder(context));
            return route;
          }
        }
        return null;
      },
    );
  }
}
