import 'package:flutter/material.dart';

import '../../widget/banner.dart';
import '../../widget/hot_list.dart';
import '../../widget/recommend.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    print("屏幕高度:${MediaQuery.of(context).size.height}");
    print("banner高度:${MediaQuery.of(context).size.width/10}");
    print("猜你喜欢高度:130");
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height-10,
        child: ListView(
          children: [
            BannerWidget(),
            getHotList(context),
            getRecommend(context)
          ],
        ),
      )
    );
  }

  ///保持状态
  @override
  bool get wantKeepAlive => true;
}


/**
 * 一个搜索框demo
 *  TextField(
    decoration:
    InputDecoration(suffixIcon: IconButton(icon:Icon(Icons.search,), onPressed: () {
    Navigator.pushNamed(context, "/search");
    },), hintText: "搜索"),
    )
 */
