import 'package:flutter/material.dart';

main() {
  runApp(const AutoChange());
}

class AutoChange extends StatefulWidget {
  const AutoChange({Key? key}) : super(key: key);

  @override
  _AutoChangeState createState() => _AutoChangeState();
}

class _AutoChangeState extends State<AutoChange> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("轮播图Demo"),
        ),
        body: ListView(children: [Swipe()]),
      ),
    );
  }
}

///滑动元素生成
class Swipe extends StatefulWidget {
  final List<Widget> data = [];

  Swipe({Key? key}) : super(key: key);

  @override
  _SwipeState createState() => _SwipeState();
}

class _SwipeState extends State<Swipe> {
  int _currentIndex = 0;

  late final List images;

  @override
  void initState() {
    images = [1, 2, 3]
        .map((e) => SizedBox(
              child: Image.network(
                  "https://www.itying.com/images/flutter/$e.png",
                  fit: BoxFit.cover),
            ))
        .toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
            width: double.infinity,
            height: 200,
            child: PageView.builder(itemBuilder: (context, index) {
              _currentIndex = index;
              print("当前索引:$_currentIndex");
              return images[index];
            })),
        Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                return Container(
                  margin: EdgeInsets.fromLTRB(2, 0, 2, 0),
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          _currentIndex == index ? Colors.white : Colors.blue),
                );
              }).toList(),
            ))
      ],
    );
  }
}

class PicPage extends StatefulWidget {
  const PicPage({Key? key}) : super(key: key);

  @override
  _PicPageState createState() => _PicPageState();
}

class _PicPageState extends State<PicPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
