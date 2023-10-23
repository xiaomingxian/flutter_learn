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
          child: const Icon(Icons.change_circle),
          onPressed: () {
            setState(() {
              _flag = !_flag;
              print("flag:$_flag");
            });
          },
        ),
        appBar: AppBar(
          title: const Text("AnimatedDefaultTextStyle"),
        ),
        body: Center(
          child: Container(
            width: 100,
            height: 100,
            color: Colors.lightGreen,
            alignment: Alignment.center,
            child: AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 800),
              style: TextStyle(fontSize: _flag ? 20 : 50),
              child: const Text("我是Demo"),
            ),
          ),
        ),
      ),
    );
  }
}
