import 'package:flutter/material.dart';

///获取子组件相关
///globalKey.currentState 可以获取子组件的状态,执行子组件的方法，
///globalKey.currentWidget 可以获取子组件的属性
///_globalKey.currentContext!.findRenderObject() 可以获取渲染的属性
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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("子组件相关"),
      ),
      body: Center(
          //横竖屏切换 三元表达式
          child: MyBox(key: _gk1, color: Colors.lightGreen)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            //1.获取子组件状态，调用其属性,方法
            var state = _gk1.currentState as _MyBoxState;
            setState(() {
              state.count++;
              print("获取属性:${state.count}");
            });
            //调用方法
            state.fun();
            //2.获取子组件属性
            var widget=_gk1.currentWidget as MyBox;
            print(widget.color);
            //3.获取子组件渲染的属性
            var renderBox=_gk1.currentContext!.findRenderObject() as RenderBox;
            print(renderBox.size);
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

  void fun() {
    print("我是子类State中的方法...");
  }

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
