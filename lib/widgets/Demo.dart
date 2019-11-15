import 'package:flutter/material.dart';
import 'package:flutter_tech/bean/HomPageBean.dart';
import 'package:flutter_tech/utils/Style.dart';
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
            _buildDetailBanner(),
            Text("text"),
          ],
        ));
  }

  Widget _buildDetailBanner() {
    final bannerThumbnail = new Container(
      margin: new EdgeInsets.symmetric(vertical: 16.0),
      alignment: FractionalOffset.centerLeft,
      child: new ClipRRect(
        borderRadius: BorderRadius.circular(14.0),
        child: HeroBanner(widget._entity.id, widget._entity.img),
      ),
    );

    final bannerCard = new Container(
      height: 300.0,
      constraints: new BoxConstraints.expand(),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(height: 4.0),
          new Text(
            widget._entity.title,
            style: Style.titleTextStyle,
          ),
          new Container(height: 10.0),
          new Text(widget._entity.title, style: Style.subHeaderTextStyle),
          new Container(
              margin: new EdgeInsets.symmetric(vertical: 8.0),
              height: 2.0,
              width: 18.0,
              color: new Color(0xff00c6ff)),
          new Row(
            children: <Widget>[
              new Image.asset("assets/img/ic_distance.png", height: 12.0),
              new Container(width: 8.0),
              new Text(
                widget._entity.zhuti,
                style: Style.commonTextStyle,
              ),
              new Container(width: 24.0),
              new Image.asset("assets/img/ic_gravity.png", height: 12.0),
              new Container(width: 8.0),
              new Text(
                widget._entity.zhuti,
                style: Style.commonTextStyle,
              ),
            ],
          ),
        ],
      ),
      padding: EdgeInsets.fromLTRB(100, 40, 0, 0),
      margin: new EdgeInsets.fromLTRB(76.0, 16.0, 16.0, 16.0),
      decoration: new BoxDecoration(
        color: new Color(0xFF333366),
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: new Offset(0.0, 10.0),
          ),
        ],
      ),
    );

    return new Container(
      height: 280,
      margin: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 5.0,
      ),
      color: Colors.white70,
      child: new Stack(
        children: <Widget>[
          bannerCard,
          bannerThumbnail,
          Text(
            'test',
            style: Style.titleTextStyle,
          ),
        ],
      ),
    );
  }
}
