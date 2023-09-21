import 'package:flutter/material.dart';

main(){
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title:const Text("Scaffold 属性 抽屉"),),
      body: Container(),
      drawer: Drawer(
        child: Text("左侧抽屉"),
      ),
      endDrawer: Drawer(
        child: Text("右侧抽屉"),
      ),
    ),
  ));
}

