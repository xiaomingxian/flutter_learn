import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text(
          "X&M",
          style: TextStyle(color: Colors.white, fontSize: 50),
        ),
      ),
      body: const MyDemoHomePage(),
    ),
  ));
}

class MyDemoHomePage extends StatelessWidget {
  const MyDemoHomePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
            width: 100000,
            color: Colors.amberAccent,
            margin: const EdgeInsets.all(10),
            child: const Center(
                child: Text(
              "Home Page ",
              style: TextStyle(color: Colors.green, fontSize: 50),
            ))),
        Row(
          children: [
            Expanded(
                flex: 3,
                child: Container(margin: const EdgeInsets.all(10),height: 100,color: Colors.orange,child: const Center(child: Text('第一层',style: TextStyle(fontSize: 30,color: Colors.white),),))),
             Expanded(
                flex: 1,
                //RenderFlex children have non-zero flex but incoming height constraints are unbounded.
                // 这个警告通常出现在Flutter中，意思是您在一个拥有不确定高度的容器中使用了具有非零flex值的子组件。这可能会导致布局问题，这可能会导致布局问题。要解决这个问题，您可以考虑以下几种方法：
               //设置高度约束： 尝试给父容器设置一个高度约束，这样子组件的高度就可以根据flex值进行适当的分配。
               // 使用适当的布局组件： 确保您在适当的上下文中使用了Column、Row、Flex等布局组件，这些组件会自动处理flex布局。
               // 使用Expanded或Flexible： 如果您想要使用flex来分配空间，确保您将子组件包装在Expanded（如果在Column或Row中）或Flexible（如果在Flex中）组件中。
               //----------------------
               //我犯的错： 当没有SizedBox时 Expanded flex 属性问题，因为父组件没有固定高度
                child: SizedBox(
                  height: 100,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(margin: const EdgeInsets.fromLTRB(5,0,10,5),color: Colors.orange,child: const Center(child: Text('第一层',style: TextStyle(fontSize: 30,color: Colors.white),),)),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(margin: const EdgeInsets.fromLTRB(5,5,10,0),color: Colors.orange,child: const Center(child: Text('第一层',style: TextStyle(fontSize: 30,color: Colors.white),),)),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ],
    );
  }
}


