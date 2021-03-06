import 'package:flutter/material.dart';
import 'package:flutter_tech/bean/MediaDetailsBean.dart';
import 'package:flutter_tech/utils/navigator.dart';
import 'package:nice_button/NiceButton.dart';

/*
* 可以让子控件自动换行的控件
* */
class PlayButton extends StatelessWidget {
  final MediaDetailsResponse _response;

  PlayButton(this._response);

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
      List.generate(_response.seriesList.length, (index) {
        return NiceButton(
          padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
          width: 100,
          elevation: 2.0,
          radius: 10.0,
          text: "${_response.seriesList[index].zhuti}",
          background: Colors.orangeAccent,
          onPressed: () => goToVideoScreen(context, _response, _response.seriesList[index]),
        );
      });
}
