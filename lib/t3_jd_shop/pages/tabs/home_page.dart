import 'package:flutter/material.dart';

import '../../widget/banner.dart';

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
          BannerWidget()
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
