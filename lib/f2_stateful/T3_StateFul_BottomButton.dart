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
  int _state=1;

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
      floatingActionButton: Container(
        height: 60,
        width: 60,
        padding:const EdgeInsets.all(10),
        margin:const EdgeInsets.only(top: 1),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.0),//透明度
          borderRadius: BorderRadius.circular(3)
        ),
        //按按钮改变颜色
        child: FloatingActionButton(
          backgroundColor: _state==2?Colors.lightBlueAccent:Colors.lightGreen,
          onPressed: () {
            setState(() {
              _state=_state==2?0:2;
            });
          },
          child: const Icon(Icons.add),//添加按钮
        ),
      ),
      //放在dock栏中间
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
