import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    home: const MyUserAccountDrawerHeader(),
  ));
}

class MyUserAccountDrawerHeader extends StatefulWidget {
  const MyUserAccountDrawerHeader({Key? key}) : super(key: key);

  @override
  _MyUserAccountDrawerHeaderState createState() =>
      _MyUserAccountDrawerHeaderState();
}

class _MyUserAccountDrawerHeaderState extends State<MyUserAccountDrawerHeader> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("用户抽屉表头demo"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: const Text(
          "最强App",
          style: TextStyle(
              color: Colors.lightGreen,
              fontSize: 50,),
        ),
      ),
      drawer:  Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName:const Text("最强程序员"),
              accountEmail:const Text("superCoder@gmail.com"),
              currentAccountPicture:const CircleAvatar(backgroundImage: NetworkImage("https://www.itying.com/images/flutter/4.png"),),
              decoration:const BoxDecoration(
                  color: Colors.lightGreen,
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://www.itying.com/images/flutter/3.png"),
                      fit: BoxFit.cover)),
              otherAccountsPictures: <Widget>[
                Image.network("https://www.itying.com/images/flutter/4.png"),
                Image.network("https://www.itying.com/images/flutter/5.png"),
                Image.network("https://www.itying.com/images/flutter/6.png"),
              ],
            ),
            const Divider(),
            const ListTile(title: Text("个人中心"),leading: CircleAvatar(child: Icon(Icons.supervised_user_circle_sharp),),),
            const Divider(),
            const ListTile(title: Text("通知中心"),leading: CircleAvatar(child: Icon(Icons.notifications_active_outlined),),),
            const Divider(),
            const ListTile(title: Text("我的文章"),leading: CircleAvatar(child: Icon(Icons.text_snippet),),),
            const Divider(),
            const ListTile(title: Text("我收到的赞"),leading: CircleAvatar(child: Icon(Icons.favorite),),),
            const Divider(),
            const ListTile(title: Text("我点赞的文章"),leading: CircleAvatar(child: Icon(Icons.face_retouching_natural),),),
            const Divider(),
            const ListTile(title: Text("我的收藏"),leading: CircleAvatar(child: Icon(Icons.color_lens_rounded),),),
          ],
        ),
      ),
    );
  }
}
