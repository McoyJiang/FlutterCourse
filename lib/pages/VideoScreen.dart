import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tech/bean/MediaDetailsBean.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  final MediaSeriesListItem _item;

  VideoScreen(this._item);

  @override
  State<StatefulWidget> createState() {
    return _VideoScreenState();
  }

}

class _VideoScreenState extends State<VideoScreen> with AutomaticKeepAliveClientMixin {

  final chewieController = ChewieController(
    videoPlayerController: VideoPlayerController.network(
        'http://okxzy.xzokzyzy.com/20191103/8912_19507cae/%E6%88%91%E7%9A%84%E4%BA%8B%E8%AF%B4%E6%9D%A5%E8%AF%9D%E9%95%BF04.mp4'),
    aspectRatio: 3 / 2,
    autoPlay: true,
    looping: false,
  );

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final playerWidget = Chewie(
      controller: chewieController,
    );

    return new Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        new Container(height: 30,),
        playerWidget,
        Text('jianjie'),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    chewieController.dispose();
  }

  @override
  bool get wantKeepAlive => true;

}