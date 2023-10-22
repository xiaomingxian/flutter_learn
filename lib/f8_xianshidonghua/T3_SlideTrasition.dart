import 'package:flutter/material.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("ScaleTransition Demo"),
        ),
        body: Center(
            child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            SlideTransition(
              position: _controller
                  //参数是相对于child的宽高  Offset(super.dx, super.dy):dx 和 dy 表示子组件相对于原位置的水平和垂直位移量
                  .drive(
                  Tween(begin: Offset(0, 0), end: Offset(1, 1))
                  //运动效果 线性或者其他...
                      .chain(CurveTween(curve: Curves.bounceIn))
                  //连续动画
                      .chain(CurveTween(curve: Curves.easeInCirc))
              ),
              child: Container(
                height: 100,
                width: 100,
                color: Colors.lightGreen,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {
                      _controller.stop();
                    },
                    child: const Text("停止")),
                ElevatedButton(
                    onPressed: () {
                      _controller.reverse();
                    },
                    child: const Text("反转")),
                ElevatedButton(
                    onPressed: () {
                      _controller.forward();
                    },
                    child: const Text("开始")),
                ElevatedButton(
                    onPressed: () {
                      _controller.repeat(reverse: true);
                    },
                    child: const Text("重复")),
              ],
            )
          ],
        )),
      ),
    );
  }
}
