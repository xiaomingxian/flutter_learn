import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

//有状态组件
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("有状态组件测试"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 80,
            alignment: Alignment.center,
            child: Text(
              "$_count",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          Container(
            // alignment: Alignment.bottomRight,
            child: ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    _count++;
                    print("点击：$_count");
                  });
                },
                icon: Icon(Icons.add),
                label: Text("增加")),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            _count++;
            print("底部浮动按钮:$_count");
          });
        },
        child:const Icon(Icons.add),
      ),
    );


  }
}
