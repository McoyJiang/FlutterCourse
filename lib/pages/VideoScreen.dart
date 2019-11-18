import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tech/bean/MediaDetailsBean.dart';
import 'package:flutter_tech/utils/Style.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  final MediaDetailsResponse _response;
  final MediaSeriesListItem _item;

  VideoScreen(this._response, this._item);

  @override
  State<StatefulWidget> createState() {
    return _VideoScreenState();
  }
}

class _VideoScreenState extends State<VideoScreen>
    with AutomaticKeepAliveClientMixin {
  ChewieController chewieController;

  @override
  void initState() {
    super.initState();
    chewieController = ChewieController(
      videoPlayerController:
          VideoPlayerController.network(widget._item.downloadUrl),
      aspectRatio: 3 / 2,
      autoPlay: true,
      looping: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final playerWidget = Chewie(
      controller: chewieController,
    );

    return new Scaffold(
      body: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new Container(height: 30,),
          playerWidget,
          new Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              widget._response.zhuyan,
              //style: Style.smallTextStyle.copyWith(fontSize: 15),
            ),
          ),

        ],
      ),
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
