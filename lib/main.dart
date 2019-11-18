import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tech/pages/FuliPage.dart';
import 'package:flutter_tech/pages/MePage.dart';
import 'package:flutter_tech/pages/home/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
  if(Platform.isAndroid){
    SystemUiOverlayStyle style = SystemUiOverlayStyle(
        statusBarColor: Colors.blue,
        ///这是设置状态栏的图标和字体的颜色
        ///Brightness.light  一般都是显示为白色
        ///Brightness.dark 一般都是显示为黑色
        statusBarIconBrightness: Brightness.light
    );
    SystemChrome.setSystemUIOverlayStyle(style);
  }
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainView(),
    );
  }
}

class MainView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainViewState();
  }
}

class MainViewState extends State<MainView>
    with SingleTickerProviderStateMixin {
  final items = [
    BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
    BottomNavigationBarItem(icon: Icon(Icons.category), title: Text('福利')),
    BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('我的'))
  ];

  final bodyList = [home_page(), FuliPage(), MePage()];

  final _pageController = PageController();

  int currentIndex = 0;

  void onTap(int index) {
    _pageController.jumpToPage(index);
  }

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  void dispose(){
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            items: items, currentIndex: currentIndex, onTap: onTap),
        // body: bodyList[currentIndex],
        body: PageView(
          controller: _pageController,
          onPageChanged: onPageChanged,
          children: bodyList,
          physics: NeverScrollableScrollPhysics(), // 禁止滑动
        ));
  }
}