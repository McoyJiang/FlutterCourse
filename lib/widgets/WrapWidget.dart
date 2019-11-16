import 'package:flutter/material.dart';
import 'package:flutter_tech/bean/MediaDetailsBean.dart';

/*
* 可以让子控件自动换行的控件
*
* */
class WrapWidget extends StatelessWidget {
  final List<MediaSeriesListItem> _series;

  WrapWidget(this._series);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20, //主轴上子控件的间距
      runSpacing: 20, //交叉轴上子控件之间的间距
      children: Boxs(), //要显示的子控件集合
    );
  }


  /*一个渐变颜色的正方形集合*/
  List<Widget> Boxs() => List.generate(_series.length, (index) {
    return Container(
      width: 80,
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.orangeAccent,
          Colors.orange,
          Colors.deepOrange
        ]),
      ),
      child: Text(
        "${_series[index].zhuti}",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  });
}