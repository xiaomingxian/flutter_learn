import 'package:flutter/material.dart';

/// 在Flutter中，Key是不能重复使用的，所以Key一般用来做唯一标识。组件在更新的时候，其状态的保
/// 存主要是通过判断【组件的类型或者key值是否一致】。
/// 因此，当各组件的类型不同的时候，类型已经足够用来区分不同的组件了，此时我们可以不必使用key。
/// 但是如果同时存在多个同一类型的控件的时候，此时类型已经无法作为区分的条件了，我们就需要使用到key。
///
/// 使用LocalKey切换屏幕方向 值没有保存 因为组件类型变了 Column <--> Row
main() {
  runApp(const MyErrDemo());
}

class MyErrDemo extends StatefulWidget {
  const MyErrDemo({Key? key}) : super(key: key);

  @override
  _MyErrDemoState createState() => _MyErrDemoState();
}

class _MyErrDemoState extends State<MyErrDemo> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false, home: MyBody());
  }
}

class MyBody extends StatefulWidget {
  const MyBody({Key? key}) : super(key: key);

  @override
  _MyBodyState createState() => _MyBodyState();
}

class _MyBodyState extends State<MyBody> {
  final GlobalKey _gk1 = GlobalKey();
  final GlobalKey _gk2 = GlobalKey();
  final GlobalKey _gk3 = GlobalKey();
  late List<Widget> _list;

  @override
  void initState() {
    _list = [
      MyBox(key: _gk1, color: Colors.lightGreen),
      MyBox(key: _gk2, color: Colors.blue),
      MyBox(key: _gk3, color: Colors.red),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("屏幕方向:${MediaQuery.of(context).orientation}");
    return Scaffold(
      appBar: AppBar(
        title: const Text("全局Key"),
      ),
      body: Center(
          //横竖屏切换 三元表达式
          child: MediaQuery.of(context).orientation == Orientation.portrait
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _list,
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _list,
                )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            //颜色换了数字没换
            _list.shuffle();
          });
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

class MyBox extends StatefulWidget {
  final Color color;

  const MyBox({Key? key, required this.color}) : super(key: key);

  @override
  _MyBoxState createState() => _MyBoxState();
}

class _MyBoxState extends State<MyBox> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 100,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(widget.color)),
        onPressed: () {
          setState(() {
            count++;
          });
        },
        child: Center(
          child: Text(
            "$count",
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
