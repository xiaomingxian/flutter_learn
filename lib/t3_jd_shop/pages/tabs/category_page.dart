import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  int currentIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Row(
          children: [
            Expanded(child: ListView(children:
            getLeftMenu(),
            ),flex: 2,),
            Expanded(child: Text("占位符"),flex: 3,)
          ],
        ),
      ),
    );
  }

  getLeftMenu() {
    List<Widget> list=[];
    for(int i=0;i<50;i++){
      InkWell inkWell= InkWell(child: Text("分类$i",style: TextStyle(fontWeight: FontWeight.w400,color:currentIndex==i?Colors.orange:Colors.black ),),onTap: (){
        setState(() {
          currentIndex=i;
        });
      },);
      Container container= Container(
        height: 40,
        padding: EdgeInsets.only(left: 10,top:10,bottom: 10),
        child: inkWell,decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20)
      ),);
      list.add(container);
    }
    return list;
  }
}
