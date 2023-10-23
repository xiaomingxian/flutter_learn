import 'package:flutter/material.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool addShop = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final withOfContent = size.width;
    final heightOfContent = size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              addShop = !addShop;
              print("$withOfContent,$heightOfContent");
            });
          },
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          title: const Text("AnimatedPositioned Demo"),
        ),
        body: Stack(
          children: [
            ListView(children: [
              ListTile(title: Text("元素1"),),
              ListTile(title: Text("元素2"),),
              ListTile(title: Text("元素3"),),
            ],),
            AnimatedPositioned(
                top: !addShop ? 10 : heightOfContent-250,
                right: !addShop ? 10 : withOfContent-50,
                child: Icon(
                  Icons.shopping_bag,
                  color: Colors.orange,
                  size: 50,
                ),
                duration: Duration(milliseconds: 800))
          ],
        ),
      ),
    );
  }
}
