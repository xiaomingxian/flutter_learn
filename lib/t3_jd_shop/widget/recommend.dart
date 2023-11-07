import 'dart:math';

import 'package:flutter/cupertino.dart';

///padding：子元素与 GridView 的边距。
/// crossAxisSpacing：子元素之间的横轴间距。
/// mainAxisSpacing：子元素之间的纵轴间距。
/// maxCrossAxisExtent：子元素在横轴上的最大长度。
/// children：子元素列表。
Widget getRecommend(BuildContext context) {
  return SizedBox(
    height: 600,
    width: MediaQuery.of(context).size.width,
    child: GridView.extent(
      padding: const EdgeInsets.all(10),
      crossAxisSpacing: 10,//
      mainAxisSpacing: 10,
      maxCrossAxisExtent: 200,
      children: getRecommendData(context),
    ),
  );
}

List<Container> getRecommendData(BuildContext context) {
  List<Container> data=[];
  for(int i=1;i<50;i++){
    int index=i%6+1;
    Container c= Container(
      height: 250,
      width: MediaQuery.of(context).size.width/2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            // width: 70,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage("https://edianzu-oss-efamily.oss-cn-beijing.aliyuncs.com/test/banner/b$index.jpeg"),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(20.0)),
          ),
          getTitle(i),
          getDetail(i),
        ],
      ),
    );
    data.add(c);
  }
  return data;
}


Widget getTitle(int i ) {
  return Padding(
    padding:const EdgeInsets.only(left: 20, top: 5, bottom: 5),
    child: Text(
      "元素$i",
      style: const TextStyle( fontSize: 10, fontWeight: FontWeight.w400),
    ),
  );
}
Widget getDetail(int i ) {
  return Padding(
    padding:const EdgeInsets.only(left: 20, top: 5, bottom: 5),
    child: Text(
      "详情$i:hi my ",
      style: const TextStyle( fontSize: 10, fontWeight: FontWeight.w400),
    ),
  );
}
