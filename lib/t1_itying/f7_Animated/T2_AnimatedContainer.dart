import 'package:flutter/material.dart';

main() {
  runApp(MyApp());
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
              _flag=!_flag;
            });
          },
          child: const Icon(Icons.change_circle),
        ),
        appBar: AppBar(
          title: const Text("AnimatedContainer Demo"),
        ),
        body: Center(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 1000),
            height: _flag ? 100 : 200,
            width: _flag ? 100 : 200,
            color: Colors.lightGreen,
          ),
        ),
      ),
    );
  }
}
