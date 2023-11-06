import 'package:flutter/material.dart';

import '../../widget/banner.dart';
import '../../widget/recommand.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          BannerWidget(),
          getRecommendList(context)
        ],
      ),
    );
  }
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
