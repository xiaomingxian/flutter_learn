import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

main()=>runApp(MyApp());


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
   String value='';

  late SharedPreferences sharedPreferences;

  @override
  void initState() {
    SharedPreferences.getInstance().then((value)  {
      //初始化实例
      sharedPreferences=value;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(child: Text(value),),
        floatingActionButton: FloatingActionButton(onPressed: (){
          sharedPreferences.setString("k1", "设置的数据");
          setState(() {
           value= sharedPreferences.getString("k1")!;
          });
        },child:const Icon(Icons.save),),
      ),
    );
  }
}
