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
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("自定义AnimatedIcon"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _controller.repeat(reverse: true);
          },
          child: const Text("执行"),
        ),
        body: Center(
          child: Stack(children: [
            //前半秒展示
            ScaleTransition(
              scale: _controller.drive(Tween(begin: 0.0, end: 1.0)
                  .chain(CurveTween(curve: const Interval(0.5, 1.0)))),
              child: const Icon(Icons.star,size: 40,),
            ),
            //后半秒展示
            ScaleTransition(
              scale: _controller.drive(Tween(begin: 1.0, end: 0.0)
                  .chain(CurveTween(curve: const Interval(0.0, 0.5)))),
              child: const Icon(Icons.opacity,size: 40,),
            ),
          ],),
        ),
      ),
    );
  }
}
