import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ChewieController chewieController;
  late VideoPlayerController videoPlayerController;

  final String url =
      "https://edianyun-interview-system-bj.oss-cn-beijing.aliyuncs.com/demo1.mp4";

  @override
  void initState() {
    videoPlayerController = VideoPlayerController.network(url);
    chewieController = ChewieController(
        videoPlayerController: videoPlayerController,
        autoPlay: true,
        looping: true,
        aspectRatio: 3 / 2);
    super.initState();
  }

  @override
  void dispose() {
    //页面销毁时视频也销毁
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("视频播放Demo"),
        ),
        body: ListView(
          children: [
            Center(
              child: Chewie(
                controller: chewieController,
              ),
            )
          ],
        ),
      ),
    );
  }
}
