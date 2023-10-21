import 'package:flutter/material.dart';

///左侧右拉
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
            child: const Icon(Icons.change_circle),
          ),
          appBar: AppBar(
            title: const Text("AnimatedContainer Demo"),
          ),
          body: Stack(
            children: [
              Positioned(
                left: 0,
                bottom: 0,
                top: 0,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 1000),
                  height: double.infinity,
                  width: 200,
                  color: Colors.lightGreen,
                  transform: _flag
                      ? Matrix4.translationValues(-200, 0, 0)
                      : Matrix4.translationValues(0, 0, 0),
                ),
              )
            ],
          )),
    );
  }
}
