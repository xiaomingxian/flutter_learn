import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Row(
          children: [
            Expanded(
              child: getLeftMenu(),
              flex: 1,
            ),
            Expanded(
             child: Text(""),
             flex: 3,
            )
          ],
        ),
      ),
    );
  }

  Widget getLeftMenu() {
    List<String> type = ["电脑", "手机", "穿戴设备", "家电", "日用百货", "出行", "手机配件"];
    return ListView.builder(
        itemCount: 30,
        itemBuilder: (context, i) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                child: Container(
                  height: 70,
                  child: Text(
                    "${type[i % type.length]}$i",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color:
                            currentIndex == i ? Colors.orange : Colors.black),
                  ),
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                ),
                onTap: () {
                  setState(() {
                    currentIndex = i;
                  });
                },
              )
            ],
          );
        });
  }
}
