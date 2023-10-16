import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

main() {
  runApp(MyPageView());
}

class MyPageView extends StatefulWidget {
  const MyPageView({Key? key}) : super(key: key);

  @override
  _MyPageViewState createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {
  List<Widget> data = [];

  @override
  void initState() {
    // TODO: implement initState
    for (int i = 0; i < 10; i++) {
      data.add(
        Center(
          child: Text(
            "${i}",
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("${data}");
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("PageView Demo"),
        ),
        body: PageView(
          scrollDirection: Axis.vertical,
          children: data,
        ),
      ),
    );
  }
}
