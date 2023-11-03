import 'package:flutter/material.dart';

import '../model/video_model.dart';

class VideoDetail extends StatefulWidget {
 final VideoModel videoModel;
  const VideoDetail(this.videoModel,{Key? key}) : super(key: key);

  @override
  _VideoDetailState createState() => _VideoDetailState();
}

class _VideoDetailState extends State<VideoDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Text('视频详情页面:${widget.videoModel.name}'),
      ),
    );
  }
}
