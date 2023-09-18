import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text("各种按钮测试"),
      ),
      body: const MyButtons(),
    ),
  ));
}

/// 各种自定义按钮 按钮外层套各种修饰容器 来实现
class MyButtons extends StatelessWidget {
  const MyButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () {}, child: const Text("普通按钮")),
            TextButton(onPressed: () {}, child: const Text("文本按钮")),
            OutlinedButton(onPressed: () {}, child: const Text("边框按钮")),
            IconButton(onPressed: () {}, icon: const Icon(Icons.face)),
          ],
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          //带图标的按钮
          ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.send),
              label: const Text("发送")),
          OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text("添加")),
          TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.more),
              label: const Text("更多")),
          SizedBox(
            //修改宽高
            height: 50,
            width: 200,
            child: ElevatedButton(
                onPressed: () {},
                //修改前景色与背景色
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.lightGreen),
                    foregroundColor: MaterialStateProperty.all(Colors.yellow)),
                child: const Text("修改按钮样式")),
          ),
        ]),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //todo 可以设置一个父类容器 让他适应父类容器的宽高
            Expanded(
                child: ElevatedButton(
              onPressed: () {},
              child: const Text("自适应按钮"),
            ))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.purple),
                    foregroundColor:
                        MaterialStateProperty.all(Colors.lightGreen),
                    elevation: MaterialStateProperty.all(20),
                    shape: MaterialStateProperty.all(
                        //圆角矩形边框
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100)))),
                child: const Text(
                  "圆角按钮",
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.lightGreen),
                      foregroundColor:
                          MaterialStateProperty.all(Colors.deepOrange),
                      shape: MaterialStateProperty.all(const CircleBorder(
                          side: BorderSide(color: Colors.greenAccent)))),
                  child: const Text("圆形按钮",style: TextStyle(color: Colors.white),)),
            )
          ],
        )
      ],
    );
  }
}
