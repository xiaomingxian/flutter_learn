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
        // lowerBound: 0.5,
        // upperBound: 2.5
    );
    // ..repeat();
    // ..repeat(reverse: true);
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
            ScaleTransition(
              scale: _controller.drive(Tween(begin: 0.5,end: 1.5)),
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
