import 'package:cached_network_image/cached_network_image.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tech/bean/MediaDetailsBean.dart';
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
  VideoPlayerController videoPlayerController;

  @override
  void initState() {
    super.initState();
    videoPlayerController = VideoPlayerController.network(widget._item.downloadUrl);
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
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
              widget._response.jianjie,
              //style: Style.smallTextStyle.copyWith(fontSize: 15),
            ),
          ),
          new Container(height: 30,),
          Image(image: CachedNetworkImageProvider("http://via.placeholder.com/350x150")),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    videoPlayerController.dispose();
    chewieController.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}
