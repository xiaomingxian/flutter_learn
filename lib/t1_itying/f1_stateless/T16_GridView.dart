import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Icon(
          Icons.dashboard,
          color: Colors.white,
        ),
      ),
      body: const MyGridView2(),
    ),
  ));
}

class MyGridView2 extends StatelessWidget {
  const MyGridView2({Key? key}) : super(key: key);

  List<Widget> _initMyGridViewData() {
    List<Container> res = [];
    for (var i = 0; i < 20; i++) {
      res.add(Container(
        alignment: Alignment.center,
        color: Colors.green,
        child: Text(
          "第$i个元素",
          style: const TextStyle(color: Colors.white, fontSize: 30),
        ),
      ));
    }
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      padding: const EdgeInsets.all(10),
      crossAxisSpacing: 10,//
      mainAxisSpacing: 10,
      maxCrossAxisExtent: 450, //属性代表横轴子元素的最大长度,通过它可以快速的创建横轴子元素为固定最大长度的//数值越大 一行内的元素越少
      children: _initMyGridViewData(),
    );
  }

// @override
// Widget build(BuildContext context) {
//   return GridView.count(
//     padding: const EdgeInsets.all(10),
//     crossAxisCount: 2, //一行元素数量
//     mainAxisSpacing: 10, //垂直间距
//     crossAxisSpacing: 10, //水平间距
//     childAspectRatio: 1.5,//宽高比 宽/高
//     children: _initMyGridViewData(),
//   );
// }
}
