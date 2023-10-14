import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  final Map arguments;
  const SearchPage({Key? key,required this.arguments}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  @override
  void initState() {
    // TODO: implement initState
    print('接受到的参数:${widget.arguments}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("搜索页"),
      ),
      body: Center(
        child: ElevatedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, "/");
            },
            icon: const Icon(Icons.home),
            label: const Text("跳转到home page")),
      ),
    );
  }
}
