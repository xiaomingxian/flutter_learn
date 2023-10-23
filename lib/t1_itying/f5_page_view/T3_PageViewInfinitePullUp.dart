import 'package:flutter/material.dart';

///无限下拉
main() {
  runApp(const PullUpInfinite());
}

class PullUpInfinite extends StatefulWidget {
  const PullUpInfinite({Key? key}) : super(key: key);

  @override
  _PullUpInfiniteState createState() => _PullUpInfiniteState();
}

class _PullUpInfiniteState extends State<PullUpInfinite> {
  final List<Widget> _data = [];

  @override
  void initState() {
    for (int i = 0; i < 10; i++) {
      _data.add(
        Center(
          child: Text(
            "$i",
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("无限下拉Demo"),
        ),
        body: PageView(
          scrollDirection: Axis.vertical,
          children: _data,
          onPageChanged: (index) {
            loadData(index, context);
          },
        ),
      ),
    );
  }

  ///再次加载数据
  void loadData(int index, BuildContext context) {
    int length = _data.length;

    if (index + 2 == length) {
      for (int i = length; i < length + 10; i++) {
        _data.add(Center(
          child: Text(
            "$i",
            style: Theme.of(context).textTheme.headline1,
          ),
        ));
      }
    }
    print("重新加载数据,当前索引:$index,数据长度:$length");
  }
}
