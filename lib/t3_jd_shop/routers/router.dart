import 'package:flutter/cupertino.dart';
import 'package:flutter_learn/t3_jd_shop/pages/search_page.dart';

import '../pages/tabs/tabs.dart';

///配置路由
final Map<String, Widget Function(BuildContext)> routers = {
  '/': (content) => const Tabs(),
  '/search': (content) => const SearchPage(),
};

///固定写法 路由跳转 (有参数和无参数的处理)
var onGenerateRoute = (RouteSettings settings) {
  final pathName = settings.name;
  final Function? pageContentBuilder = routers[pathName];
  //如果能对上配置的页面
  if (pageContentBuilder != null) {
    //判断有没有参数
    if (settings.arguments != null) {
      //有参数 跳转时带上参数
      return CupertinoPageRoute(
          builder: (context) => pageContentBuilder(context, arguments: settings.arguments));
    } else {
      //没参数跳转时不带参数
      return CupertinoPageRoute(
      builder: (context) => pageContentBuilder(context));
    }
  }
  return null;
};
