import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Center(
          child: Icon(
            Icons.apps,
            color: Colors.white,
          ),
        ),
      ),
      body: const MyHomePage(),
    ),
  ));
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children:  <Widget>[
          const ListTile(title: Text("视频",style: TextStyle(color:Colors.lightBlue ),),leading: Icon(Icons.video_call,color: Colors.green,),subtitle: Text("二级标题"),),
          const Divider(),
          const ListTile(title: Text("收藏",style: TextStyle(color:Colors.lightBlue ),),leading: Icon(Icons.favorite,color: Colors.red,),trailing: Icon(Icons.chevron_right,color: Colors.grey,),),
          const Divider(),
          ListTile(title: Text("我是列表",style: TextStyle(color:Colors.lightBlue ),),leading: Image.network("https://edianzu-oss-work-order.oss-cn-beijing.aliyuncs.com/icon/writeForm.png"),),
          const Divider(),
          const ListTile(title: Text("我是列表",style: TextStyle(color:Colors.lightBlue ),),),
          const Divider(),
          const ListTile(title: Text("我是列表",style: TextStyle(color:Colors.lightBlue ),),),
          const Divider(),
          const ListTile(title: Text("我是列表",style: TextStyle(color:Colors.lightBlue ),),),
          const Divider(),
          const   ListTile(title: Text("我是列表",style: TextStyle(color:Colors.lightBlue ),),),
          const Divider(),
          const   ListTile(title: Text("我是列表",style: TextStyle(color:Colors.lightBlue ),),),
          const Divider(),
          const   ListTile(title: Text("我是列表",style: TextStyle(color:Colors.lightBlue ),),),
          const Divider(),
          const   ListTile(title: Text("我是列表",style: TextStyle(color:Colors.lightBlue ),),),
          const Divider(),
          const   ListTile(title: Text("我是列表",style: TextStyle(color:Colors.lightBlue ),),),
          const Divider(),
          const   ListTile(title: Text("我是列表",style: TextStyle(color:Colors.lightBlue ),),),
          const Divider(),
          const   ListTile(title: Text("我是列表",style: TextStyle(color:Colors.lightBlue ),),),
          const Divider(),
          const   ListTile(title: Text("我是列表",style: TextStyle(color:Colors.lightBlue ),),),
          const Divider(),
          const   ListTile(title: Text("我是列表",style: TextStyle(color:Colors.lightBlue ),),),
          const Divider(),

      ],
    );
  }
}
