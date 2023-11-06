import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

///height: 轮播图的高度
/// aspectRatio: 轮播图项的宽高比
/// viewportFraction: 每个轮播图项占据的视口fraction,1意味着充满viewport
/// initialPage: 初始化时显示的轮播图项索引
/// enableInfiniteScroll: 是否启用无限循环滚动
/// reverse: 轮播顺序是否反向
/// autoPlay: 是否自动轮播
/// autoPlayInterval: 自动轮播的时间间隔
/// autoPlayAnimationDuration: 轮播切换动画时长
/// autoPlayCurve: 轮播切换动画的曲线效果
/// enlargeCenterPage: 是否放大当前中心项
/// enlargeFactor: 中心项的放大倍数
/// scrollDirection: 滑动方向,Axis.horizontal或Axis.vertical
class BannerWidget extends StatefulWidget {
  const BannerWidget({Key? key}) : super(key: key);

  @override
  _BannerWidgetState createState() => _BannerWidgetState();
}


class _BannerWidgetState extends State<BannerWidget> {
  List<String> imgs=[
    "https://edianzu-oss-efamily.oss-cn-beijing.aliyuncs.com/test/banner/b1.jpeg",
    "https://edianzu-oss-efamily.oss-cn-beijing.aliyuncs.com/test/banner/b2.jpeg",
    "https://edianzu-oss-efamily.oss-cn-beijing.aliyuncs.com/test/banner/b3.jpeg",
    "https://edianzu-oss-efamily.oss-cn-beijing.aliyuncs.com/test/banner/b4.jpeg",
    "https://edianzu-oss-efamily.oss-cn-beijing.aliyuncs.com/test/banner/b5.jpeg",
    "https://edianzu-oss-efamily.oss-cn-beijing.aliyuncs.com/test/banner/b6.jpeg",
  ];


  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        aspectRatio: 16 / 9,
        viewportFraction: 0.8,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
        scrollDirection: Axis.horizontal,
      ),
      items: [0,1, 2, 3, 4,5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0,vertical: 20.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(imgs[i]),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: const [
                  BoxShadow(color: Colors.grey,
                    blurRadius: 5,
                    offset: Offset(1, 1),
                    spreadRadius: 2,)
                ]
              ),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    height: MediaQuery.of(context).size.width/10,
                    width: MediaQuery.of(context).size.width/1.5,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("元素$i简介300字\n啊实践活动卡仕达酱阿是啊实打实",style: TextStyle(color: Colors.white),)
                    ],)
                  ),
                ],
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
