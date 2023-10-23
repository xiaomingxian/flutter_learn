import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        title: Text("仿头条"),
      ),
      body: LikeTouTiao(),
    ),
  ));
}

class LikeTouTiao extends StatefulWidget {
  const LikeTouTiao({Key? key}) : super(key: key);

  @override
  _LikeTouTiaoState createState() => _LikeTouTiaoState();
}

class _LikeTouTiaoState extends State<LikeTouTiao>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<Tab> _tabs = [];
  final List<Widget> _tabBarViews = [];

  @override
  void dispose() {
    // TODO: implement dispose
    //销毁事件
    _tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    //监听tabController改变事件
    _tabController.addListener(() {
      //打印2次一次点击 一次离开
      //滑动的时候是一次
      // print('监听到索引:${_tabController.index}');
      if (_tabController.animation!.value == _tabController.index) {
        //_tabController.animation!.value   _tabController.animation 如果不为空 获取其value
        print('监听到索引:${_tabController.index}');
      }
    });
    _tabs.add(const Tab(
      child: Text(
        "同城",
        style: TextStyle(color: Colors.black),
      ),
    ));
    _tabs.add(const Tab(
      child: Text("关注", style: TextStyle(color: Colors.black)),
    ));
    _tabs.add(const Tab(
      child: Text("推荐", style: TextStyle(color: Colors.black)),
    ));

    _tabBarViews.add(KeepVisibleRecord(
        child: ListView(children: const [
      ListTile(
        title: Text(
          "同城内容1",
          style: TextStyle(fontSize: 50),
        ),
      ),
      ListTile(
        title: Text(
          "同城内容2",
          style: TextStyle(fontSize: 50),
        ),
      ),
      ListTile(
        title: Text(
          "同城内容3",
          style: TextStyle(fontSize: 50),
        ),
      ),
      ListTile(
        title: Text(
          "同城内容4",
          style: TextStyle(fontSize: 50),
        ),
      ),
      ListTile(
        title: Text(
          "同城内容5",
          style: TextStyle(fontSize: 50),
        ),
      ),
      ListTile(
        title: Text(
          "同城内容6",
          style: TextStyle(fontSize: 50),
        ),
      ),
      ListTile(
        title: Text(
          "同城内容7",
          style: TextStyle(fontSize: 50),
        ),
      ),
      ListTile(
        title: Text(
          "同城内容8",
          style: TextStyle(fontSize: 50),
        ),
      ),
      ListTile(
        title: Text(
          "同城内容9",
          style: TextStyle(fontSize: 50),
        ),
      ),
      ListTile(
        title: Text(
          "同城内容10",
          style: TextStyle(fontSize: 50),
        ),
      ),
      ListTile(
        title: Text(
          "同城内容11",
          style: TextStyle(fontSize: 50),
        ),
      ),
    ])));
    _tabBarViews.add(KeepVisibleRecord(
      child: ListView(
        children: const [
          ListTile(
            title: Text(
              "这里是关注内容1",
              style: TextStyle(fontSize: 50),
            ),
          ),
          ListTile(
            title: Text(
              "这里是关注内容2",
              style: TextStyle(fontSize: 50),
            ),
          ),
          ListTile(
            title: Text(
              "这里是关注内容3",
              style: TextStyle(fontSize: 50),
            ),
          ),
          ListTile(
            title: Text(
              "这里是关注内容4",
              style: TextStyle(fontSize: 50),
            ),
          ),
          ListTile(
            title: Text(
              "这里是关注内容5",
              style: TextStyle(fontSize: 50),
            ),
          ),
          ListTile(
            title: Text(
              "这里是关注内容6",
              style: TextStyle(fontSize: 50),
            ),
          ),
          ListTile(
            title: Text(
              "这里是关注内容7",
              style: TextStyle(fontSize: 50),
            ),
          ),
          ListTile(
            title: Text(
              "这里是关注内容8",
              style: TextStyle(fontSize: 50),
            ),
          ),
          ListTile(
            title: Text(
              "这里是关注内容9",
              style: TextStyle(fontSize: 50),
            ),
          ),
          ListTile(
            title: Text(
              "这里是关注内容10",
              style: TextStyle(fontSize: 50),
            ),
          ),
        ],
      ),
    ));
    _tabBarViews.add(KeepVisibleRecord(
      child: ListView(
        children: const [
          ListTile(
            title: Text(
              "这里是推荐内容1",
              style: TextStyle(fontSize: 50),
            ),
          ),
          ListTile(
            title: Text(
              "这里是推荐内容2",
              style: TextStyle(fontSize: 50),
            ),
          ),
          ListTile(
            title: Text(
              "这里是推荐内容3",
              style: TextStyle(fontSize: 50),
            ),
          ),
          ListTile(
            title: Text(
              "这里是推荐内容4",
              style: TextStyle(fontSize: 50),
            ),
          ),
          ListTile(
            title: Text(
              "这里是推荐内容5",
              style: TextStyle(fontSize: 50),
            ),
          ),
          ListTile(
            title: Text(
              "这里是推荐内容6",
              style: TextStyle(fontSize: 50),
            ),
          ),
          ListTile(
            title: Text(
              "这里是推荐内容7",
              style: TextStyle(fontSize: 50),
            ),
          ),
          ListTile(
            title: Text(
              "这里是推荐内容8",
              style: TextStyle(fontSize: 50),
            ),
          ),
          ListTile(
            title: Text(
              "这里是推荐内容9",
              style: TextStyle(fontSize: 50),
            ),
          ),
          ListTile(
            title: Text(
              "这里是推荐内容10",
              style: TextStyle(fontSize: 50),
            ),
          ),
        ],
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBar(
            backgroundColor: const Color.fromARGB(255, 253, 247, 247),
            elevation: 1,
            title: TabBar(
              onTap: (index){
                //只会监听点击事件 监听不到滑动事件
                print("tabBar监听点击事件获取到的索引${index}");
              },
              //控制器  TabBar and  TabBarView 都得有
              controller: _tabController,
              //选中的颜色
              indicatorColor: Colors.red,
              //没选中的颜色
              unselectedLabelColor: Colors.lightGreen,
              //indicatorSize:TabBar指示器大小.label
              indicatorSize: TabBarIndicatorSize.label,
              tabs: _tabs,
            ),
          )),
      body: TabBarView(
        controller: _tabController,
        children: _tabBarViews,
      ),
    );
  }
}

///定义缓存组件 缓存浏览位置
///widget 是 StatefulWidget 的一个属性 表示 当前widget
///State可以通过widget属性访问对应的Widget实例。所以这里的widget就是KeepVisibleRecord widget,通过它可以获取到KeepVisibleRecord的child和keepAlive等属性。
class KeepVisibleRecord extends StatefulWidget {
  const KeepVisibleRecord(
      {Key? key, @required this.child, this.keepAlive = true})
      : super(key: key);

  final Widget? child;
  final bool keepAlive;

  @override
  _KeepVisibleRecordState createState() => _KeepVisibleRecordState();
}

class _KeepVisibleRecordState extends State<KeepVisibleRecord>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    //后面加！表示断言 不为空 如果为空则抛出异常
    return widget.child!;
  }

  @override
  // TODO: implement wantKeepAlive
  // bool get wantKeepAlive => throw UnimplementedError();
  bool get wantKeepAlive => widget.keepAlive;

  @override
  void didUpdateWidget(covariant KeepVisibleRecord oldWidget) {
    //这段代码的作用是在widget的keepAlive属性改变时,手动通知框架更新State的缓存状态,从而使KeepAlive生效。
    // 它利用了didUpdateWidget钩子,比较老旧widget值判断keepAlive是否变化,如果变化就调用updateKeepAlive来更新状态。
    //我的理解 如果老的widget的状态与新的不同 说明数据发生变化了 需要通知框架去刷新数据
    if (oldWidget.keepAlive != widget.keepAlive) {
      // keepAlive 状态需要更新，实现在 AutomaticKeepAliveClientMixin 中
      updateKeepAlive();
    }
    super.didUpdateWidget(oldWidget);
  }
}
