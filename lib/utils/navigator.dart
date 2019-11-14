import 'package:flutter/material.dart';
import 'package:flutter_tech/bean/HomPageBean.dart';
import 'package:flutter_tech/widgets/Demo.dart';

goToMediaDetails(BuildContext context, HomeListEntity _entry) {
  _pushWidgetWithFade(context, Demo(_entry));
}

_pushWidgetWithFade(BuildContext context, Widget widget) {
  Navigator.of(context).push(
        PageRouteBuilder(
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    FadeTransition(opacity: animation, child: child),
            pageBuilder: (BuildContext context, Animation animation,
                Animation secondaryAnimation) {
              return widget;
            }),
      );
}
