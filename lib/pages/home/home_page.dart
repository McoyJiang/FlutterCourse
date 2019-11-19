import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tech/widgets/basic_widget.dart';
import 'package:flutter_tech/pages/home/home_hj_page.dart';
import 'package:flutter_tech/pages/home/home_mj_page.dart';
import 'package:flutter_tech/pages/home/home_rj_page.dart';

class home_page extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _home_page_state();
  }
}

class _home_page_state extends State<home_page>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white10,
        body: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              flexibleSpace: SafeArea(
                child: Scaffold(
                  backgroundColor: Colors.lightBlueAccent,
                  body: Column(
                    children: <Widget>[
                      Container(
                        height: 10,
                        alignment: Alignment.center,
                        color: Colors.lightBlueAccent,
                      ),
                      getTabBar(),
                    ],
                  ),
                ),
              ),
              bottom: MyDivider(
                height: 10.0,
                color: Colors.white,
              ),
              backgroundColor: Colors.lightBlueAccent,
            ),
            body: TabBarView(
              children: [
                home_rj_page(),
                home_mj_page(),
                home_hj_page(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  getTabBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 80),
      child: new TabBar(
        labelStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(fontSize: 14),
//        indicator: UnderlineTabIndicator(),
        indicatorSize: TabBarIndicatorSize.tab,
      indicator: new BubbleTabIndicator(
        indicatorHeight: 30.0,
        indicatorColor: Colors.white,
        padding: EdgeInsets.fromLTRB(-5, 0, -5, 0),
        insets: EdgeInsets.fromLTRB(-10, 0, -10, 0),
        tabBarIndicatorSize: TabBarIndicatorSize.label,
      ),
        tabs: [
          Tab(
              child: Text('日剧',
                  style:
                      new TextStyle(color: Colors.blueAccent, fontSize: 20))),
          Tab(
              child: Text('美剧',
                  style:
                      new TextStyle(color: Colors.blueAccent, fontSize: 20))),
          Tab(
              child: Text('韩剧',
                  style: new TextStyle(color: Colors.blueAccent, fontSize: 20)))
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
