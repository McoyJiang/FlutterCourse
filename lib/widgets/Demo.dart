import 'package:flutter/material.dart';
import 'package:flutter_tech/bean/HomPageBean.dart';
import 'package:flutter_tech/bean/MediaDetailsBean.dart';
import 'package:flutter_tech/bloc/RjDetailBloc.dart';
import 'package:flutter_tech/utils/Style.dart';
import 'package:flutter_tech/utils/navigator.dart';
import 'package:flutter_tech/widgets/HeroBanner.dart';

class Demo extends StatefulWidget {
  final HomeListEntity _entity;

  Demo(this._entity);

  @override
  State<StatefulWidget> createState() {
    return _DemoState();
  }
}

class _DemoState extends State<Demo> with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    rj_detail_bloc.getRJDetails(widget._entity.id);
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
    return getDetailsWidget(data);
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget getDetailsWidget(MediaDetailsResponse data) {
    return Scaffold(
        backgroundColor: Colors.grey,
        body: Column(
          children: <Widget>[
            _buildDetailBanner(data),
            _buildPlays(data),
          ],
        ));
  }

  Widget _buildPlays(MediaDetailsResponse data) {
    List<MediaSeriesListItem> _series = data.seriesList;
    return new Flexible(
        child: new GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, //一行几个
          mainAxisSpacing: 10.0, //Y轴间距
          crossAxisSpacing: 7.0, //X轴间距
          childAspectRatio: 0.7),
      itemCount: _series.length,
      itemBuilder: (context, index) {
        return RaisedButton(
          onPressed: () {},
          textColor: Colors.white,
          padding: const EdgeInsets.all(0.0),
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  Color(0xFF0D47A1),
                  Color(0xFF1976D2),
                  Color(0xFF42A5F5),
                ],
              ),
            ),
            padding: const EdgeInsets.all(10.0),
            child:
                const Text('Gradient Button', style: TextStyle(fontSize: 20)),
          ),
        );
      },
    ));
  }

  Widget _buildDetailBanner(MediaDetailsResponse data) {
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
          new Container(height: 24.0),
          new Text(
            data.title,
            style: Style.titleTextStyle.copyWith(fontSize: 30),
          ),
          new Container(height: 10.0),
          new Text('主演: ${data.zhuyan}', style: Style.subHeaderTextStyle),
          new Container(
              margin: new EdgeInsets.symmetric(vertical: 8.0),
              height: 2.0,
              width: 18.0,
              color: new Color(0xff00c6ff)),
          new Container(height: 20.0),
          new Text('更新至: ${widget._entity.zhuti}',
              style: Style.subHeaderTextStyle.copyWith(fontSize: 18))
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
        ],
      ),
    );
  }
}
