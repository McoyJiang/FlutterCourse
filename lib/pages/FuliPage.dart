import 'dart:async';
import 'dart:convert' show json, base64Decode;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as HTTP;
import 'package:pull_to_refresh/pull_to_refresh.dart';

/*
   this example will show you how to implements horizontal refresh or reverse,
   the main point is in child scrollDirection attr
 */
class FuliPage extends StatefulWidget {
  @override
  _HorizontalRefreshState createState() => _HorizontalRefreshState();
}

class _HorizontalRefreshState extends State<FuliPage>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  RefreshController _controller1 = RefreshController();
  RefreshController _controller2 = RefreshController();
  int indexPage = 0;
  List<String> data = [];

  void _fetch() {
    HTTP
        .get('http://gank.io/api/data/福利/10/$indexPage')
        .then((HTTP.Response response) {
      Map map = json.decode(response.body);
      return map["results"];
    }).then((array) {
      for (var item in array) {
        data.add(item["url"]);
      }
      if (mounted) setState(() {});
      _controller1.loadComplete();
      indexPage++;
    }).catchError((_) {
      print("error");
      _controller1.loadComplete();
    });
  }

  void _onRefresh() {
    Future.delayed(const Duration(milliseconds: 2009)).then((val) {
      _controller1.refreshCompleted();
//                refresher.sendStatus(RefreshStatus.completed);
    });
  }

  void _onLoading() {
    Future.delayed(const Duration(milliseconds: 2009)).then((val) {
      _fetch();
    });
  }

  Widget buildImage(context, index) {
    return GestureDetector(
      child: Item1(
        url: data[index],
      ),
      onTap: () {
        _controller1.requestRefresh();
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller1 = RefreshController();
    _fetch();
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: true,
      controller: _controller1,
      onRefresh: _onRefresh,
      footer: ClassicFooter(
        iconPos: IconPosition.top,
        outerBuilder: (child) {
          return Container(
            width: 80.0,
            child: Center(
              child: child,
            ),
          );
        },
      ),
      header: ClassicHeader(
        iconPos: IconPosition.top,
        outerBuilder: (child) {
          return Container(
            width: 80.0,
            child: Center(
              child: child,
            ),
          );
        },
      ),
      onLoading: _onLoading,
      child: ListView.builder(
        itemCount: data.length,
        scrollDirection: Axis.vertical,
        physics: ClampingScrollPhysics(),
        itemBuilder: buildImage,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class Item extends StatefulWidget {
  final String title;

  Item({this.title});

  @override
  State<StatefulWidget> createState() {
    return _ItemState();
  }
}

class _ItemState extends State<Item> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
        child: Center(
          child: Text(widget.title),
        ),
      ),
      height: 100.0,
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class Item1 extends StatefulWidget {
  final String url;

  Item1({this.url});

  @override
  _Item1State createState() => _Item1State();
}

class _Item1State extends State<Item1> {
  @override
  Widget build(BuildContext context) {
    if (widget.url == null) return Container();
    return FadeInImage(
      placeholder: AssetImage("images/empty.png"),
      image: NetworkImage(
        widget.url,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
