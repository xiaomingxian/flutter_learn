import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    home:MyBottomButtonFul(),
  ));
}

class MyBottomButtonFul extends StatefulWidget {
  const MyBottomButtonFul({Key? key}) : super(key: key);

  @override
  _MyBottomButtonFulState createState() => _MyBottomButtonFulState();
}

class _MyBottomButtonFulState extends State<MyBottomButtonFul> {

  int _currentIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("底部导航样动态加样式"),),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.lightBlueAccent,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index){
          setState(() {
            _currentIndex=index;
          });
        },
        items: const[
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "搜索"),
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
        BottomNavigationBarItem(icon: Icon(Icons.add), label: "发表"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "设置"),
      ],),
    );
  }
}
