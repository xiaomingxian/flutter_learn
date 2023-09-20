import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    home: MyHomePage2(),
  ));
}

class MyHomePage2 extends StatefulWidget {
  const MyHomePage2({Key? key}) : super(key: key);

  @override
  _MyHomePage2State createState() => _MyHomePage2State();
}

class _MyHomePage2State extends State<MyHomePage2> {
  int _index = 0;
  List<ListTile> _data = [];

  @override
  Widget build(BuildContext context) {
    print('加载元素：：$_index,${_data.length}');
    final size =MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("StateFul Demo2 动态列表"),
      ),
      body: Column(
        children: [
          Container(
            height: size.height-150,
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: _data,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _index++;
            //修改后界面不显示问题解释:
            //这个代码中,_data 列表是在 build 方法外定义的,每次 setState 后会重新构建页面,但不会重新创建 _data 列表。
            // 所以即使在 setState 内添加了新的 ListTile 到 _data 中,但这个变化没有通知到 ListView,它仍然显示旧的 _data 内容。
            // 要解决这个问题,需要在 setState 内创建一个新的 _data 列表,而不是直接修改旧列表:

            // List.from(_data) 会创建一个新的列表,复制 _data 中的元素。
            // 然后 ..add(ListTile()) 在这个新列表上添加一个元素
            _data=List.from(_data)..add(ListTile(
              title: Text("新增数据$_index"),
            ));
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
