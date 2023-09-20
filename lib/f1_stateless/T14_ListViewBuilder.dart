import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'X&M',
          style: TextStyle(color: Colors.white),
        ),
        leading: Icon(
          Icons.motorcycle_sharp,
          color: Colors.white,
        ),
      ),
      body: const MyListViewBuilder(),
    ),
  ));
}

class MyListViewBuilder extends StatelessWidget {
  const MyListViewBuilder({Key? key}) : super(key: key);

  List<String> _data(){
    List<String> res=[];
    for(var i=0;i<20;i++){
      res.add('我是第$i条数据');
    }
    return res;
  }

  @override
  Widget build(BuildContext context) {
   List<String> data= _data();
    return Scaffold(body: ListView.builder(itemCount: _data().length, itemBuilder: (BuildContext context, int index) {
      return ListTile( title: Text(data[index]),);
    },),);
  }
}
