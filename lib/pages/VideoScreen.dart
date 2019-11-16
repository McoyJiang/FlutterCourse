import 'package:flutter/material.dart';
import 'package:flutter_tech/bean/MediaDetailsBean.dart';

class VideoScreen extends StatefulWidget {
  final MediaSeriesListItem _item;

  VideoScreen(this._item);

  @override
  State<StatefulWidget> createState() {
    return _VideoScreenState();
  }

}

class _VideoScreenState extends State<VideoScreen> with AutomaticKeepAliveClientMixin {

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Text('this is VideoScreen');
  }

  @override
  bool get wantKeepAlive => null;

}