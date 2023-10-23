import 'package:flutter/material.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  final String _appBarText = " 自定义渐变滑动 ";
  final int _controllerSed = 2;
  final double yPosition = 0.0;
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: Duration(seconds: _controllerSed));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //初始化数据
    List<Widget> data=[
      MyContainer(controller: _controller,color: Colors.blue[100]!,start: 0.0,end: 0.2,),
      MyContainer(controller: _controller,color: Colors.blue[300]!,start: 0.2,end: 0.4,),
      MyContainer(controller: _controller,color: Colors.blue[500]!,start: 0.4,end: 0.6,),
      MyContainer(controller: _controller,color: Colors.blue[700]!,start: 0.6,end: 0.8,),
      MyContainer(controller: _controller,color: Colors.blue[900]!,start: 0.8,end: 1.0,),
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _controller.repeat(reverse: true);
          },
          child: const Icon(Icons.start),
        ),
        appBar: AppBar(
          title: Text(_appBarText),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: data,
          ),
        ),
      ),
    );
  }
}

class MyContainer extends StatefulWidget {
  final AnimationController controller;
  final double start;
  final double end;
  final Color color;
  const MyContainer({Key? key, required this.controller,required this.start,required this.end,required this.color}) : super(key: key);

  @override
  _MyContainerState createState() => _MyContainerState();
}

class _MyContainerState extends State<MyContainer> {
  double yPosition = 0;

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: widget.controller.drive(
          Tween(begin: Offset(0, yPosition), end: Offset(1, yPosition))
              .chain(CurveTween(curve:  Interval(widget.start, widget.end)))),
      child: Container(
        width: 150,
        height: 40,
        color: widget.color,
      ),
    );
  }
}
