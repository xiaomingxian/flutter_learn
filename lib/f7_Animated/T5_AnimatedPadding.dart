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

  bool _flag=true;
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
          child: const Icon(Icons.refresh),
        ),
        appBar: AppBar(
          title: const Text("Padding Demo"),
        ),
        body: AnimatedPadding(
          curve: Curves.easeInCirc,
          padding: EdgeInsets.fromLTRB(_flag?10:300,_flag? 10:400, 0, 0),
          duration: const Duration(milliseconds: 500),
          child: Container(
            width: 100,
            height: 100,
            color: Colors.lightGreen,
          ),
        ),
      ),
    );
  }
}
