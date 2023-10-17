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
        title: Text("轮播图Demo"),
      ),
      body: ListView(children: [Swipe()]),
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
  late PageController _pageController;
  late Timer _timer;

  @override
  void initState() {
    images = [1, 2, 3]
        .map((e) => SizedBox(
              child: Image.network(
                  "https://www.itying.com/images/flutter/$e.png",
                  fit: BoxFit.cover),
            ))
        .toList();
    _pageController = PageController(initialPage: _currentIndex);

    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      _pageController.animateToPage((_currentIndex + 1) % images.length,
          //动画持续时间
          duration: const Duration(microseconds: 3000),
          //现行变化
          curve: Curves.linear);
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
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
                  //加入缓存功能
                  return KeepAliveBanner(
                    child: images[index],
                  );
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

///缓存组件 定义方式改为：缓存组件(需要缓存的组件)
class KeepAliveBanner extends StatefulWidget {
  final Widget child;
  final bool keepAlive;

  const KeepAliveBanner({Key? key, required this.child, this.keepAlive = true})
      : super(key: key);

  @override
  _KeepAliveBannerState createState() => _KeepAliveBannerState();
}

class _KeepAliveBannerState extends State<KeepAliveBanner>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return widget.child!;
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  void didUpdateWidget(covariant KeepAliveBanner oldWidget) {
    // TODO: implement didUpdateWidget
    if (oldWidget.keepAlive != widget.keepAlive) {
      updateKeepAlive();
    }
    super.didUpdateWidget(oldWidget);
  }
}
