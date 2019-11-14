import 'package:flutter/material.dart';
import 'package:flutter_tech/widgets/home_hj_page.dart';
import 'package:flutter_tech/widgets/home_mj_page.dart';
import 'package:flutter_tech/widgets/home_rj_page.dart';

class home_page extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _home_page_state();
  }
}

class _home_page_state extends State<home_page> with AutomaticKeepAliveClientMixin{

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              bottom: TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.directions_car)),
                  Tab(icon: Icon(Icons.directions_transit)),
                  Tab(icon: Icon(Icons.directions_bike)),
                ],
              ),
              title: Text('Tabs Demo'),
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

  @override
  bool get wantKeepAlive => true;

}