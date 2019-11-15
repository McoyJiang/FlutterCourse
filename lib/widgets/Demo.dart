import 'package:flutter/material.dart';
import 'package:flutter_tech/bean/HomPageBean.dart';
import 'package:flutter_tech/widgets/HeroBanner.dart';

class Demo extends StatefulWidget {
  final HomeListEntity _entity;

  Demo(this._entity);

  @override
  State<StatefulWidget> createState() {
    return _DemoState();
  }
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: <Widget>[
            HeroBanner(widget._entity.id, widget._entity.img),
            Text("text"),
          ],
        ));
  }
}
