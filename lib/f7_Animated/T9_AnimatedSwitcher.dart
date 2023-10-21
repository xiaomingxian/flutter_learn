import 'package:flutter/material.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _flag = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _flag = !_flag;
            });
          },
          child: const Icon(Icons.refresh),
        ),
        appBar: AppBar(
          title: Text("切换动画"),
        ),
        body: Center(
          child: Container(
            width: 200,
            height: 200,
            color: Colors.lightGreen,
            alignment: Alignment.center,
            child: AnimatedSwitcher(
              transitionBuilder: ((child, animation) {
                //放大缩小动画
                return ScaleTransition(
                  scale: animation,
                  //淡入淡出动画
                  child: FadeTransition(
                    opacity: animation,
                    child: child,
                  ),
                );
              }),
              duration: const Duration(milliseconds: 1200),
              child: _flag
                  ? const CircularProgressIndicator()
                  : const Text(
                      "切换后的内容",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
