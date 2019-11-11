
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
//  @override
//  Widget build(BuildContext context) {
//    print('HomePage build');
//    return Container(
//      child: Center(
//        child: Text('This is HomePage'),
//      ),
//    );
//  }

  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }

}

class HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    print('initState');
  }

  @override
  void dispose() {
    print('dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    print('HomePage build()');
    return Container(
      child: Center(
        child: Text('This is HomePage'),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}