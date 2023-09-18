import 'package:flutter/material.dart';
import 'package:flutter_learn/T30_Wrap.dart';

main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text("Wrap 关键字搜索页面"),
      ),
      body: const MySearch(),
    ),
  ));
}

class MySearch extends StatelessWidget {
  const MySearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: [
          const Text(
            "热搜",
            style: TextStyle(color: Colors.lightBlue, fontSize: 30,),
          ),
          const Divider(),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              MyButton("HuaWei Mate 60 Pro",func: null,),
              MyButton("MacBook Pro M1",func: null,),
              MyButton("MacBook Pro M2",func: null,),
              MyButton("MacBook Pro M1 pro",func: null,),
              MyButton("MacBook Pro M2 pro",func: null,),
              MyButton("iPhone 4",func: null,),
              MyButton("iPhone 4s",func: null,),
              MyButton("iPhone 5",func: null,),
              MyButton("iPhone 5s",func: null,),
              MyButton("iPhone 6",func: null,),
              MyButton("iPhone 6s",func: null,),
              MyButton("iPhone 7",func: null,),
              MyButton("iPhone 7s",func: null,),
              MyButton("iPhone 8",func: null,),
              MyButton("iPhone 8 plus",func: null,),
              MyButton("iPhone x",func: null,),
              MyButton("iPhone 11",func: null,),
              MyButton("iPhone 12",func: null,),
              MyButton("iPhone 12 plus",func: null,),
              MyButton("iPhone 12 pro",func: null,),
              MyButton("iPhone 12 Pro Max",func: null,),
            ],
          ),
          const Text("历史记录",style: TextStyle(color: Colors.grey),),
          SizedBox(
            height: 500,
            child:  ListView(
              children: const[
                Divider(),
                ListTile(title: Text("华为Mate60Pro"),),
                Divider(),
                ListTile(title: Text("遥遥领先"),),
                Divider(),
                ListTile(title: Text("白宫精选"),),
                Divider(),
                ListTile(title: Text("我们继续领先"),),
                Divider(),
                ListTile(title: Text("领先同行"),),
                Divider(),
                ListTile(title: Text("东风快递"),),
                Divider(),
                ListTile(title: Text("使命必达"),),
              ],
            ),
          ),
          OutlinedButton.icon(onPressed: (){}, icon:const Icon(Icons.delete), label:const Text("删除"))
        ],
      ),
    );
  }
}
