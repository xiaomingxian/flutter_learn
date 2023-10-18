import 'package:flutter/material.dart';

main() {
  runApp(const MyCachePageView2());
}

class MyCachePageView2 extends StatefulWidget {
  const MyCachePageView2({Key? key}) : super(key: key);

  @override
  _MyCachePageView2State createState() => _MyCachePageView2State();
}

class _MyCachePageView2State extends State<MyCachePageView2> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("缓存元素Demo2"),
        ),
        body: PageView.builder(
          scrollDirection: Axis.vertical,
            onPageChanged: (index) {},
            itemBuilder: (BuildContext context, int index) {
              return MyCache2(
                child: MyCount(index: index,),
              );
            }),
      ),
    );
  }
}

class MyCount extends StatefulWidget {
  final int index;
  const MyCount({Key? key, required this.index}) : super(key: key);

  @override
  _MyCountState createState() => _MyCountState();
}

class _MyCountState extends State<MyCount> {
  @override
  Widget build(BuildContext context) {
    print("MyCount build :${widget.index}");
    return Center(
      child: Text(
        "${widget.index}",
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }
}

class MyCache2 extends StatefulWidget {
  final bool keepAlive;
  final Widget? child;

  const MyCache2({Key? key, this.keepAlive = true, this.child})
      : super(key: key);

  @override
  _MyCache2State createState() => _MyCache2State();
}

class _MyCache2State extends State<MyCache2>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return widget.child!;
  }

  @override
  bool get wantKeepAlive => widget.keepAlive;

  @override
  void didUpdateWidget(covariant MyCache2 oldWidget) {
    // TODO: implement didUpdateWidget
    if (oldWidget.keepAlive != widget.keepAlive) {
      updateKeepAlive();
    }
    super.didUpdateWidget(oldWidget);
  }
}
