import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'dialog_package/MyDiaLog.dart';

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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ElevatedButton.icon(
                onPressed: () {
                  print('点击');
                  showAlertDialog(context);
                },
                icon: Icon(Icons.show_chart),
                label: Text("展示Dialog")),
            ElevatedButton.icon(
                onPressed: () {
                  print('点击选项');
                  showSimpleDialog(context);
                },
                icon: const Icon(Icons.show_chart),
                label: const Text("展示select弹框")),
            ElevatedButton.icon(
                onPressed: () {
                  showBottomContent(context);
                },
                icon: Icon(Icons.show_chart),
                label: Text("底部展示")),
            ElevatedButton.icon(
                onPressed: () {
                  showToast(context);
                },
                icon: Icon(Icons.show_chart),
                label: Text("展示Tostal")),
            ElevatedButton.icon(
                onPressed: _myDiaLog,
                icon: Icon(Icons.message),
                label: Text("自定义Dialog")),
          ],
        ),
      ),
    );
  }

  _myDiaLog() {
    print("自定义Dialog");
    return showDialog(context: context, builder:(context){
      return const MyDiaLog();
    });
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

  showSimpleDialog(BuildContext context) async {
    var res = await showDialog(
        context: context,
        builder: (content) {
          return SimpleDialog(
            title: Text("选项"),
            children: [
              SimpleDialogOption(
                child: Text("Java"),
                onPressed: () {
                  Navigator.of(context).pop("选择了Java");
                },
              ),
              SimpleDialogOption(
                child: Text("Python"),
                onPressed: () {
                  Navigator.of(context).pop("选择了Python");
                },
              ),
              SimpleDialogOption(
                child: Text("Golang"),
                onPressed: () {
                  Navigator.of(context).pop("选择了Golang");
                },
              ),
              SimpleDialogOption(
                child: Text("Flutter"),
                onPressed: () {
                  Navigator.of(context).pop("选择了Flutter");
                },
              ),
            ],
          );
        });
    print("获取到的结果:${res}");
  }

  showBottomContent(BuildContext context) async {
    var res = await showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
              height: 200,
              child: Center(
                child: ListView(
                  children: [
                    ListTile(
                      title: Text(
                        "英语",
                      ),
                      onTap: () {
                        Navigator.of(context).pop("选择了英语");
                      },
                    ),
                    ListTile(
                      title: Text("俄语"),
                      onTap: () {
                        Navigator.of(context).pop("选择了俄语");
                      },
                    ),
                    ListTile(
                      title: Text("中文"),
                      onTap: () {
                        Navigator.of(context).pop("选择了中文");
                      },
                    ),
                  ],
                ),
              ));
        });
    print("选择的结果:${res}");
  }

  void showToast(BuildContext context) {
    Fluttertoast.showToast(
        msg: "恭喜你胜利了",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 15.0);
  }
}
