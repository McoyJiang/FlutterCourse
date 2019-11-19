import 'package:flutter/material.dart';
import 'package:flutter_tech/bean/HomPageBean.dart';
import 'package:flutter_tech/bean/MediaDetailsBean.dart';
import 'package:flutter_tech/bloc/RjDetailBloc.dart';
import 'package:flutter_tech/persistence/DatabaseClient.dart';
import 'package:flutter_tech/utils/Style.dart';
import 'package:flutter_tech/widgets/FavoriteIcon.dart';
import 'package:flutter_tech/widgets/HeroBanner.dart';
import 'package:flutter_tech/widgets/PlayButton.dart';
import 'package:nice_button/NiceButton.dart';

class RjDetailPage extends StatefulWidget {
  final HomeListEntity _entity;

  RjDetailPage(this._entity);

  @override
  State<StatefulWidget> createState() {
    return _RjDetailPageState();
  }
}

class _RjDetailPageState extends State<RjDetailPage> with AutomaticKeepAliveClientMixin {
  DatabaseClient db;
  @override
  void initState() {
    super.initState();
    initDB();
    rj_detail_bloc.getRJDetails(widget._entity.id);
  }

  void initDB() async {
    db = new DatabaseClient();
    await db.create();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return StreamBuilder<MediaDetailsResponse>(
      stream: rj_detail_bloc.subject.stream,
      builder: (context, AsyncSnapshot<MediaDetailsResponse> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.errorMessage != null &&
              snapshot.data.errorMessage.length > 0) {
            return _buildErrorWidget(snapshot.data.errorMessage);
          }
          return _buildUserWidget(snapshot.data);
        } else if (snapshot.hasError) {
          return _buildErrorWidget(snapshot.error);
        } else {
          return _buildLoadingWidget();
        }
      },
    );
  }

  Widget _buildLoadingWidget() {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [CircularProgressIndicator()],
        ));
  }

  Widget _buildErrorWidget(String error) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Error occured: $error"),
          ],
        ));
  }

  Widget _buildUserWidget(MediaDetailsResponse data) {
    return Scaffold(
        backgroundColor: Colors.grey,
        body: ListView(
          padding: EdgeInsets.all(0),
          children: <Widget>[
            _buildDetailBanner(data),
            Container(height: 30,),
            _buildPlays(data),
          ],
        ));
  }

  @override
  bool get wantKeepAlive => true;

  Widget _buildPlays(MediaDetailsResponse data) {
    return new PlayButton(data);
  }

  void _handleTapboxChanged(bool newValue) {
    print('newValue is $newValue');
    db.insertHomeListEntity(widget._entity);
  }

  Widget _buildDetailBanner(MediaDetailsResponse data) {
    final bannerThumbnail = new Container(
      margin: new EdgeInsets.fromLTRB(16.0, 0, 0, 0),
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
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new Container(height: 24,),
          new Text(
            data.title,
            style: Style.headerTextStyle,
          ),

          new Container(height: 10.0),
          new Text('主演: ${data.zhuyan}', style: Style.subHeaderTextStyle),

          new Container(
            height: 40,
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              NiceButton(
                text:'下载',
                width: 60,
                radius: 10.0,
                fontSize: 20,
                background: Colors.lightBlue,
                padding: EdgeInsets.fromLTRB(0, 3, 0, 3),
              ),
              Container(width: 20,),
              FavoriteIcon(
                iconSize: 30,
                onChanged: _handleTapboxChanged,
              )
            ],
          )
        ],
      ),
      padding: EdgeInsets.fromLTRB(160, 40, 0, 0),
      margin: new EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
      decoration: new BoxDecoration(
        color: new Color(0xFF333366),
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(14.0),
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
      height: 300,
      margin: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 5.0,
      ),
      //color: Colors.white70,
      child: new Stack(
        children: <Widget>[
          bannerCard,
          bannerThumbnail,
        ],
      ),
    );
  }
}

class TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;

  TestFlowDelegate({this.margin});
  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i).width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i,
            transform: new Matrix4.translationValues(
                x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i).height + margin.top + margin.bottom;
        context.paintChild(i,
            transform: new Matrix4.translationValues(
                x, y, 0.0));
        x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}