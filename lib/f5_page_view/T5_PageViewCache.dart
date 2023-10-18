import 'package:flutter/material.dart';

main() {
  runApp(const MyCachePageView());
}

class MyCachePageView extends StatefulWidget {
  const MyCachePageView({Key? key}) : super(key: key);

  @override
  _MyCachePageViewState createState() => _MyCachePageViewState();
}

class _MyCachePageViewState extends State<MyCachePageView> {
  //先初始化10个元素
  late List<MyCenter> _list;

  @override
  void initState() {
    _list = [];
    for (int i = 0; i < 10; i++) {
      _list.add(MyCenter(
        index: i,
      ));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("我的缓存页面Demo"),
        ),
        body: PageView.builder(
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              print("加载元素，索引:$index");
              if (index + 2 == _list.length) {
                loadMoreInfo();
              }
              return _list[index];
            }),
      ),
    );
  }

  void loadMoreInfo() {
    for (int i = _list.length; i < _list.length + 10; i++) {
      _list.add(MyCenter(
        index: i,
      ));
    }
  }
}

///要对谁进行缓存就加载谁上 (谁==最小缓存单位)
///eg:对页面元素进行缓存 AutomaticKeepAliveClientMixin 应该加在页面元素上 而不应该加在PageView.builder的 itemBuilder的返回值上
class MyCenter extends StatefulWidget {
  final int index;

  const MyCenter({Key? key, required this.index}) : super(key: key);

  @override
  _MyCenterState createState() => _MyCenterState();
}

class _MyCenterState extends State<MyCenter>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "${widget.index}",
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
