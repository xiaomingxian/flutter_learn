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
    //让程序刷新频率个手机保持一致
    _controller = AnimationController(vsync: this,duration:const Duration(seconds: 1));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("测试"),
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              FadeTransition(
                opacity: _controller,
                child: const FlutterLogo(
                  size: 60,
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
                        _controller.repeat();
                      },
                      child: const Text("重复")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
