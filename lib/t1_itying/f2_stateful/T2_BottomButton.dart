import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    home: const MyBottomButton(),
  ));
}

class MyBottomButton extends StatelessWidget {
  const MyBottomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("底部导航"),
      ),
      body: const Center(
        child: Text("底部导航demo"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.lightGreen,
        currentIndex: 1,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "微信"),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: "消息"),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "添加"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "设置"),
        ],
      ),
    );
  }
}
