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
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
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

    _tabBarViews.add(Center(
      child: Text("这里是同城内容"),
    ));
    _tabBarViews.add(Center(
      child: Text("这里是关注内容"),
    ));
    _tabBarViews.add(Center(
      child: Text("这里是推荐内容"),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: TabBar(
          controller: _tabController,
          tabs: _tabs,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _tabBarViews,
      ),
    );
  }
}
