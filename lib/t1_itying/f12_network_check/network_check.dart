import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String status = '';
  int index=0;

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  @override
  void initState() {
    super.initState();
    checkStaus();
  }

  void checkStaus() {
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((ConnectivityResult result){
          setState(() {
            index++;
            print('-------->>>>> ${result.toString()}');
            status='${result.toString()} $index';
          });
        });
  }
  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("网络检测"),
        ),
        body: Center(
          child: Text("网络状态:$status"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
          },
          child: const Text("刷新"),
        ),
      ),
    );
  }
}
