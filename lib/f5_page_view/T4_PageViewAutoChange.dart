import 'dart:async';

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
    return Scaffold(
      appBar: AppBar(
        title:const Text("轮播图Demo"),
      ),
      body: ListView(children: [Swipe()]),
    );
  }
}

///滑动元素生成
class Swipe extends StatefulWidget {

  Swipe({Key? key}) : super(key: key);

  @override
  _SwipeState createState() => _SwipeState();
}

class _SwipeState extends State<Swipe> {
  int _currentIndex = 0;
  late final List images;
  late PageController _pageController;
  late Timer _timer;

  @override
  void initState() {
    images = [1, 2, 3].map((e) => {MyBanner(index: e)}).toList();
    _pageController = PageController(initialPage: _currentIndex);

    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      int idx = (_currentIndex+1) % images.length;
      _pageController.animateToPage(idx,
          //动画持续时间
          duration: const Duration(microseconds: 3000),
          //现行变化
          curve: Curves.linear);
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
            width: double.infinity,
            height: 200,
            child: PageView.builder(
                controller: _pageController,
                onPageChanged: (int index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return MyBanner(index: index+1);
                })),
        Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(images.length, (index) {
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

class MyBanner extends StatefulWidget {
  final int index;

  const MyBanner({Key? key, required this.index}) : super(key: key);

  @override
  _MyBannerState createState() => _MyBannerState();
}

class _MyBannerState extends State<MyBanner> {
  @override
  Widget build(BuildContext context) {
    print("初始化元素:${widget.index}");
    return SizedBox(
      child: Image.network(
          "https://www.itying.com/images/flutter/${widget.index}.png",
          fit: BoxFit.cover),
    );
  }
}
