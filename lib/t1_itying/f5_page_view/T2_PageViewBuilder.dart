import 'package:flutter/material.dart';

main() {
  runApp(PageViewBuilder());
}

class PageViewBuilder extends StatefulWidget {
  const PageViewBuilder({Key? key}) : super(key: key);

  @override
  _PageViewBuilderState createState() => _PageViewBuilderState();
}

class _PageViewBuilderState extends State<PageViewBuilder> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("PageViewBuilder Demo"),
        ),
        body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            print("索引:${index}");
            return MyPageContent(index: "${index}",);
          },
          itemCount: 10,
        ),
      ),
    );
  }
}

class MyPageContent extends StatefulWidget {
  final String index;

  const MyPageContent({Key? key, required this.index}) : super(key: key);

  @override
  _MyPageContentState createState() => _MyPageContentState();
}

class _MyPageContentState extends State<MyPageContent> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(widget.index,style: Theme.of(context).textTheme.headline1,),
    );
  }
}
