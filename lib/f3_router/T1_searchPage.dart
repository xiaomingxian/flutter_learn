import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  final String keyWord;
  final int intVal;
  const SearchPage({Key? key,this.keyWord="",required this.intVal}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('上个页面传递过来的参数:${widget.intVal},${widget.keyWord}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        //返回上一页
        ///具体Navigator.pop()的用法:
        /// 简单返回上一页
        /// Navigator.pop(context);
        /// 返回上一页时传递数据
        /// Navigator.pop(context, data);
        /// 返回指定页面,弹出中间页面
        /// Navigator.popUntil(context, ModalRoute.withName('/HomePage'));
        Navigator.pop(context);
      },child: Icon(Icons.back_hand),),
      appBar: AppBar(title: Text("搜索页"),),
      body: Center(child: ListView(children: [
        ListTile(title: Text("测试内容"),),
        ListTile(title: Text(widget.keyWord),)
      ],),),
    );
  }
}
