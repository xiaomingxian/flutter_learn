import 'package:flutter/material.dart';

///获取推荐列表
Widget getRecommendList(BuildContext context) {
  return SizedBox(
    height: MediaQuery.of(context).size.height / 2,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        getTitle(),
        SizedBox(
          height: 130,
          child: getImgAndDesc(),
        )
      ],
    ),
  );
}

Widget getTitle() {
  return Padding(
    padding: EdgeInsets.only(left: 20, top: 5, bottom: 5),
    child: Text(
      "猜你喜欢",
      style: TextStyle(
          color: Colors.red, fontSize: 15, fontWeight: FontWeight.w800),
    ),
  );
}

Widget getImgAndDesc() {
  List<RecommendModel> data = getData();
  ListView widget = ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          child: Padding(
            padding: EdgeInsets.only(left: 20),
            child: Column(
              children: [
                //第一行头像
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(data[index].url),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(20.0)),
                ),
                //第二行描述
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(data[index].title),
                )
              ],
            ),
          ),
        );
      });
  return widget;
}

List<RecommendModel> getData() {
  List<RecommendModel> data = [];
  for (int i = 1; i <= 6; i++) {
    data.add(RecommendModel(
        "https://edianzu-oss-efamily.oss-cn-beijing.aliyuncs.com/test/banner/b$i.jpeg",
        "标题$i"));
  }
  return data;
}

class RecommendModel {
  String url;
  String title;

  RecommendModel(this.url, this.title);
}
