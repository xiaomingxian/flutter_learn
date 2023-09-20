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
