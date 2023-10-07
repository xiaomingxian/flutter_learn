import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    home: Scaffold(
      // appBar: AppBar(
      //   title: const Text("抽屉demo2"),
      // ),
      body: Container(
        alignment: Alignment.center,
        child: const Text("抽屉demo2"),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://www.itying.com/images/flutter/2.png"),
                      fit: BoxFit.cover),
                ),
                child: ListView(
                  children: [Text("我是头部",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),)],
                )),
            const Divider(),
            const ListTile(title: Text("个人中心"),leading: CircleAvatar(child: Icon(Icons.supervised_user_circle_rounded),),),
            const Divider(),
            const ListTile(title: Text("消息中心"),leading: CircleAvatar(child: Icon(Icons.notifications_active_outlined),),),
          ],
        ),
      ),
    ),
  ));
}
