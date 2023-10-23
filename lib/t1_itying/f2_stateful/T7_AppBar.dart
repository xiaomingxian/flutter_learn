import 'package:flutter/material.dart';

main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home:MyAppBar(),
  ));
}

class MyAppBar extends StatefulWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  _MyAppBarState createState() => _MyAppBarState();
}


class _MyAppBarState extends State<MyAppBar>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //在标题前面显示的一个控件，在首页通常显示应用的 logo；在其他界面通 常显示为返回按钮
        //左侧按钮
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            print('点击按钮leading');
          },
        ),
        //通常使用 IconButton 来表示，可以放按钮组
        //右侧按钮
        actions: <Widget>[
          IconButton(
              onPressed: () {
                print("搜索东西...");
              },
              icon: Icon(Icons.search)),
          IconButton(
              onPressed: () {
                print("展开更多...");
              },
              icon: Icon(Icons.more_horiz)),
        ],
        title: const Text(
          "我的AppBar",textAlign: TextAlign.center,
        ),
      ),
      body:const Center(child:  Text("测试AppBar",style: TextStyle(fontSize: 60,color: Colors.lightGreen),),)
    );
  }
}
