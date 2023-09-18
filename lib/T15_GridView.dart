import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text(
          "M&2",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: MyGridView(),
    ),
  ));
}

class MyGridView extends StatelessWidget {
  const MyGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.extent(
        maxCrossAxisExtent: 150,
        children: [
          Icon(Icons.add),
          Icon(Icons.motorcycle_sharp),
          Icon(Icons.search),
          Icon(Icons.settings),
          Icon(Icons.home_filled),
          Icon(Icons.add),
          Icon(Icons.motorcycle_sharp),
          Icon(Icons.search),
          Icon(Icons.settings),
          Icon(Icons.home_filled),
          Icon(Icons.add),
          Icon(Icons.motorcycle_sharp),
          Icon(Icons.search),
          Icon(Icons.settings),
          Icon(Icons.home_filled),
          Icon(Icons.add),
          Icon(Icons.motorcycle_sharp),
          Icon(Icons.search),
          Icon(Icons.settings),
          Icon(Icons.home_filled),
          Icon(Icons.add),
          Icon(Icons.motorcycle_sharp),
          Icon(Icons.search),
          Icon(Icons.settings),
          Icon(Icons.home_filled),
        ],
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //     child: GridView.count(
  //       crossAxisCount: 3,
  //       children: [
  //         Icon(Icons.add),
  //         Icon(Icons.motorcycle_sharp),
  //         Icon(Icons.search),
  //         Icon(Icons.settings),
  //         Icon(Icons.home_filled),
  //         Icon(Icons.add),
  //         Icon(Icons.motorcycle_sharp),
  //         Icon(Icons.search),
  //         Icon(Icons.settings),
  //         Icon(Icons.home_filled),
  //         Icon(Icons.add),
  //         Icon(Icons.motorcycle_sharp),
  //         Icon(Icons.search),
  //         Icon(Icons.settings),
  //         Icon(Icons.home_filled),
  //         Icon(Icons.add),
  //         Icon(Icons.motorcycle_sharp),
  //         Icon(Icons.search),
  //         Icon(Icons.settings),
  //         Icon(Icons.home_filled),
  //         Icon(Icons.add),
  //         Icon(Icons.motorcycle_sharp),
  //         Icon(Icons.search),
  //         Icon(Icons.settings),
  //         Icon(Icons.home_filled),
  //       ],
  //     ),
  //   );
  // }
}
