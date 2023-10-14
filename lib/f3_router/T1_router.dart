import 'package:flutter/material.dart';
import 'package:flutter_learn/f3_router/T1_searchPage.dart';

main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text("路由demo"),),
      body: const Center(
        child: MyAppBarRouter(),
      ),
    ),
  ));
}

class MyAppBarRouter extends StatelessWidget {
  const MyAppBarRouter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        ///1.Navigator.of(context) 获得当前页面的导航器Navigator对象
        ///2.MaterialPageRoute() 创建一个新路由,这里是Material风格的页面切换动画。
        ///3.builder 参数是一个匿名方法,返回新的页面组件。这里返回一个SearchPage页面。
        /// 4.push方法将新路由推入导航栈中,切换到SearchPage页面。
        /// 5.const SearchPage() 构造并返回SearchPage组件,const表示这个组件是不变的。
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return const SearchPage(keyWord: "传递的参数",intVal: 1,);
        }));
      },
      icon: Icon(Icons.search),
      label: const Text("搜索"),
    );
  }
}
