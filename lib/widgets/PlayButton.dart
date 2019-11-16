import 'package:flutter/material.dart';
import 'package:flutter_tech/bean/MediaDetailsBean.dart';
import 'package:flutter_tech/utils/navigator.dart';
import 'package:nice_button/NiceButton.dart';

/*
* 可以让子控件自动换行的控件
* */
class PlayButton extends StatelessWidget {
  final List<MediaSeriesListItem> _series;

  PlayButton(this._series);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.start,
      spacing: 2, //主轴上子控件的间距
      runSpacing: 20, //交叉轴上子控件之间的间距
      children: Boxs(context), //要显示的子控件集合
    );
  }

  /*一个渐变颜色的正方形集合*/
  List<Widget> Boxs(BuildContext context) =>
      List.generate(_series.length, (index) {
        return NiceButton(
          padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
          width: 100,
          elevation: 2.0,
          radius: 10.0,
          text: "${_series[index].zhuti}",
          background: Colors.lightBlue,
          onPressed: () => goToVideoScreen(context, _series[index]),
        );
      });
}
