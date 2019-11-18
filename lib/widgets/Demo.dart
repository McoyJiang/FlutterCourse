import 'package:flutter/material.dart';
import 'package:flutter_tech/utils/Style.dart';

class Demo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DemoState();
  }
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: false,
      appBar: PreferredSize(child: Text(''), preferredSize: Size.fromHeight(30)),
      backgroundColor: Colors.white,
      body: Text('this is Demo',
        //style: Style.baseTextStyle.copyWith(color: Colors.blue),
        overflow: TextOverflow.ellipsis));
  }
}
