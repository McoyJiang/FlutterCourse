import 'package:flutter/material.dart';
import 'package:flutter_tech/bean/HomPageBean.dart';
import 'package:flutter_tech/bean/MediaDetailsBean.dart';
import 'package:flutter_tech/pages/VideoScreen.dart';
import 'package:flutter_tech/widgets/Demo.dart';

goToMediaDetails(BuildContext context, HomeListEntity _entry) {
  _pushWidgetWithFade(context, Demo(_entry));
}

goToVideoScreen(BuildContext context, MediaSeriesListItem _item) {
  _pushWidgetWithFade(context, VideoScreen(_item));
}

_pushWidgetWithFade(BuildContext context, Widget widget) {
  Navigator.of(context).push(
    PageRouteBuilder(
        transitionDuration: Duration(seconds: 1),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(opacity: animation, child: child),
        pageBuilder: (BuildContext context, Animation animation,
            Animation secondaryAnimation) {
          return widget;
        }),
  );
}
