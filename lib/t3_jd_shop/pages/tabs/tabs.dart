import 'package:flutter/material.dart';
import 'package:flutter_learn/t3_jd_shop/pages/tabs/category_page.dart';
import 'package:flutter_learn/t3_jd_shop/pages/tabs/home_page.dart';
import 'package:flutter_learn/t3_jd_shop/pages/tabs/shop_page.dart';
import 'package:flutter_learn/t3_jd_shop/pages/tabs/user_setting_page.dart';

class Tabs extends StatefulWidget {
  const Tabs({Key? key}) : super(key: key);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _index = 0;
  late List<BottomNavigationBarItem> bars;
  late List<Widget> pages;

  ///带缓存的控制器
  late PageController _pageController;

  @override
  void initState() {
    //初始化bar和页面
    _initBarPages();
    super.initState();

    _pageController = PageController(initialPage: _index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //自动适配刘海灵动岛
        body: SafeArea(
          child: PageView(
            controller: _pageController,
            children: pages,
            onPageChanged: (index) {
              _index = index;
            },
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          fixedColor: Colors.orange,
          onTap: (index) {
            setState(() {
              _index = index;
              _pageController.jumpToPage(_index);
            });
          },
          type: BottomNavigationBarType.fixed,
          items: bars,
        ));
  }

  ///初始化bar和页面
  void _initBarPages() {
    bars = const [
      BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
          ),
          label: "首页"),
      BottomNavigationBarItem(
          icon: Icon(
            Icons.category_outlined,
          ),
          label: "分类"),
      BottomNavigationBarItem(
          icon: Icon(
            Icons.shop,
          ),
          label: "购物车"),
      BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
          ),
          label: "我的"),
    ];
    pages = const [HomePage(), CategoryPage(), ShopPage(), UserSettingPage()];
  }
}
