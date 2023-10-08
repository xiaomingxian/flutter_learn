import 'package:flutter/material.dart';

///步骤
/// 1.混入 SingleTickerProviderStateMixin
/// 2.定义TabController
main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyTabBar(),
  ));
}

// 1.混入 SingleTickerProviderStateMixin
//SingleTickerProviderStateMixin 是什么东西吗？
// 作用就是当前页的动画还在播放的时候，用户导航到另外一个页面，当前页的动画就没有必要再播放了，
// 反之在页面切换回来的时候动画有可能还要继续播放，它就是来实现这个控制的。

class MyTabBar extends StatefulWidget {
  const MyTabBar({Key? key}) : super(key: key);

  @override
  _MyTabBarState createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar>
    with SingleTickerProviderStateMixin {
  // 2.定义TabController
  late TabController _tabController;
  late List<Tab> _tabs;
  late List<TabBarView> _tabBarViews;

  ///生命周期函数 当组件初始化时触发
  ///可以在这里给 tabController 初始化值
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("初始化数据...");
    //第二个参数 TickerProvider
    _tabController = TabController(length: 6, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < 10; i++) {
      //todo 生成数据
      // _tabs.add();
    }
    print("build 组件 ...");
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
            "我的AppBar",
            textAlign: TextAlign.center,
          ),
          bottom: TabBar(
            isScrollable: true, //是否可以滚动
            controller: _tabController,
            tabs: const [
              Tab(
                child: Text("关注"),
              ),
              Tab(
                child: Text("热门"),
              ),
              Tab(
                child: Text("推荐"),
              ),
              Tab(
                child: Text("推荐1"),
              ),
              Tab(
                child: Text("推荐2"),
              ),
              Tab(
                child: Text("推荐3"),
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            ListView(
              children: const [
                ListTile(
                  title: Text("我是关注列表"),
                ),
              ],
            ),
            ListView(
              children: const [
                ListTile(
                  title: Text("我是热门列表"),
                ),
              ],
            ),
            ListView(
              children: const [
                ListTile(
                  title: Text("我是推荐列表"),
                ),
              ],
            ),
            ListView(
              children: const [
                ListTile(
                  title: Text("我是推荐列表1"),
                ),
              ],
            ),
            ListView(
              children: const [
                ListTile(
                  title: Text("我是推荐列表2"),
                ),
              ],
            ),
            ListView(
              children: const [
                ListTile(
                  title: Text("我是推荐列表3"),
                ),
              ],
            ),
          ],
        ));
  }
}
