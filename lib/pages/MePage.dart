
import 'package:flutter/material.dart';

class MePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return MePageState();
  }

}

class MePageState extends State<MePage> with AutomaticKeepAliveClientMixin {
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
    print('MePage build()');
    return Container(
      child: Center(
        child: Text('This is MePage'),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}