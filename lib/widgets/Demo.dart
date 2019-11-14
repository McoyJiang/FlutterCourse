import 'package:flutter/material.dart';
import 'package:flutter_tech/bean/HomPageBean.dart';

class Demo extends StatefulWidget{
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
        backgroundColor: Color(0xFF2C2B33),
        body: CustomScrollView(
          slivers: <Widget>[
            _buildAppBar(),
          ],
        ));
  }

  Widget _buildAppBar() {
    return SliverAppBar(
      expandedHeight: 300.0,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Hero(
              tag: "Movie-Tag-${widget._entity.id}",
              child: FadeInImage.assetNetwork(
                  fit: BoxFit.cover,
                  width: double.infinity,
                  placeholder: "assets/placeholder.jpg",
                  image: widget._entity.img),
            ),
          ],
        ),
      ),
    );
  }
}