import 'package:flutter/material.dart';

main(){
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title:const Text("Card Demo 1"),),
      body:const CardDemo1(),
    ),
  ));
}
class CardDemo1 extends StatelessWidget {
  const CardDemo1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Card(
          elevation: 10,//阴影深度
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
          margin: const EdgeInsets.all(10),
          child: Column(//用Cloumn可以放多行
            children: [
              const Text("图片上的文字",style: TextStyle(fontSize: 50,color: Colors.lightGreen),),
              AspectRatio(aspectRatio: 16/9,child: Image.network("https://www.itying.com/images/flutter/2.png"),),
              const Text("图片下的文字",style: TextStyle(fontSize: 50,color: Colors.lightGreen),),
              const ListTile(
                title: Text("标题1"),
                subtitle:Text("子标题1"),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage("https://www.itying.com/images/flutter/2.png"),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
