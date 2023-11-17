import 'package:flutter/material.dart';

main()=>runApp(const MaterialApp(
  debugShowCheckedModeBanner: false,
  home: MyApp()
));

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  //todo 步骤1
  final GlobalKey<ScaffoldState> _key=GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //todo 步骤2
      key: _key,
      endDrawer:const Drawer(
        child: Center(child: Text("模拟页面",style: TextStyle(fontSize: 50,fontWeight: FontWeight.w200),),),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          //todo 步骤3
          _key.currentState!.openEndDrawer();
        },
        child: Icon(Icons.arrow_back),
      ),
    );
  }
}
