import 'package:flutter/material.dart';
import 'package:get/get.dart';

main()=>runApp(const GetMaterialApp(home: HomePage(),));


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text("路由及传参demo"),),
      floatingActionButton: FloatingActionButton(onPressed: (){
        //todo 跳转页面1 并带参数过去
      },child:const Text("跳转页面1"),),
    );
  }
}
