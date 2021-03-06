import 'package:flutter/material.dart';
import 'package:flutter_tech/bean/HomPageBean.dart';
import 'package:flutter_tech/utils/navigator.dart';

class HomePageListItem extends StatelessWidget {
  final HomeListEntity _entry;

  HomePageListItem(this._entry);

  @override
  Widget build(BuildContext context) {
    return new GridTile(
      child: new Card(
        color: Colors.white70,
          elevation: 1.0,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(14.0))),
          child: new InkWell(
            onTap: () => goToMediaDetails(context, _entry),
              child: new Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              new Expanded(
                flex: 3,
                child: Hero(
                  child: new ClipRRect(
                    borderRadius: BorderRadius.circular(14.0),
                    child: new FadeInImage.assetNetwork(
                      placeholder: "assets/placeholder.jpg",
                      image: _entry.img,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 300.0,
                      fadeInDuration: Duration(milliseconds: 50),
                    ),
                  ),
                  tag: "Movie-Tag-${_entry.id}",
                ),
              ),
              Container(
                height: 6.0,
              ),
              new Expanded(
                  flex: 1,
                  child: new Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new Text(
                        _entry.title,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .subhead
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      new Text('更新至 ${_entry.zhuti}'),
                    ],
                  )),
            ],
          ))),
    );
  }

//  goToMediaDetails(BuildContext context, HomeListEntity entry) {
//    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Demo()));
//  }
}
