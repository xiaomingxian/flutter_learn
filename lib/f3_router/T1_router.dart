import 'package:flutter/material.dart';
import 'package:flutter_learn/f3_router/T1_searchPage.dart';

main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text("路由demo")),
      body: const Center(
        child: MyAppBarRouter(),
      ),
    ),
  ));
}

class MyAppBarRouter extends StatelessWidget {
  const MyAppBarRouter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return SearchPage();
        }));
      },
      icon: Icon(Icons.search),
      label: const Text("搜索"),
    );
  }
}
