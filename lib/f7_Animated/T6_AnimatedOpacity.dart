import 'package:flutter/material.dart';

///透明度
main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double opacity=1;
  //1减0加
  int operate=1;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              if(operate==1){
                opacity=opacity-0.3;
              }else{
                opacity=opacity+0.3;
              }
              if(opacity<=0){
                opacity=0;
                operate=0;
              }if(opacity>=1){
                opacity=1;
                operate=1;
              }
            });
          },
          child:const Icon(Icons.refresh),
        ),
        appBar: AppBar(
          title: const Text("AnimatedOpacity Demo"),
        ),
        body: Center(
          child: AnimatedOpacity(
            opacity: opacity,
            duration: const Duration(milliseconds: 500),
            child: Container(
              width: 100,
              height: 100,
              color: Colors.lightGreen,
            ),
          ),
        ),
      ),
    );
  }
}
