import 'package:flutter/material.dart';

main() {
  runApp(const MaterialApp(
    home: MyDialog(),
  ));
}

class MyDialog extends StatefulWidget {
  const MyDialog({Key? key}) : super(key: key);

  @override
  _MyDialogState createState() => _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DiaLog Demo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton.icon(
                onPressed: () {
                  print('点击');
                  showAlertDialog(context);
                },
                icon: Icon(Icons.show_chart),
                label: Text("展示Dialog"))
          ],
        ),
      ),
    );
  }

  ///async 同步方法获取返回值  showDialog 是个异步方法
  showAlertDialog(BuildContext context) async {
    ///await 让异步代码可以以同步的方式编写,不需要过多的 callback
    /// await 会暂停 async 函数,等待 Future 完成后再继续执行
    /// await 关键字只能在 async 函数中使用
    var res = await showDialog(
        //点击空白处不关闭
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("提示框"),
            content: Text("确定购买吗?"),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    //我已确认 是返回值
                    Navigator.of(context).pop("我已确认");
                  },
                  child: Text("是")),
              ElevatedButton(
                  onPressed: () {
                    //我已取消 是返回值
                    Navigator.of(context).pop("我已取消");
                  },
                  child: Text("否"))
            ],
          );
        });
    print("获取返回值:${res}");
  }
}
