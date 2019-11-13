import 'package:flutter/material.dart';
import 'package:flutter_tech/bean/HomPageBean.dart';

class HomePageListItem extends StatelessWidget{

  final HomeListEntity entry;

  HomePageListItem(this.entry);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      child: InkWell(
        onTap: () => print('HomePageListItem clicked'),
        child: Column(
          children: <Widget>[
            Hero(
              child: FadeInImage.assetNetwork(
                placeholder: "assets/placeholder.jpg",
                image: entry.img,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 400.0,
                fadeInDuration: Duration(milliseconds: 50),
              ),
              tag: "Movie-Tag-${entry.id}",
            ),
            _getTitleSection(context),
          ],
        ),
      ),

    );
  }

  Widget _getTitleSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    entry.title,
                    style: Theme
                        .of(context)
                        .textTheme
                        .subhead
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(entry.zhuti,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.body1,
                  ),
                )
              ],
            ),
          ),
          Container(
            width: 12.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    "",
                    style: Theme.of(context).textTheme.body1,
                  ),
                  Container(
                    width: 4.0,
                  ),
                  Icon(
                    Icons.star,
                    size: 16.0,
                  )
                ],
              ),
              Container(
                height: 4.0,
              ),
              Row(
                children: <Widget>[
                  Text(
                    "",
                    style: Theme.of(context).textTheme.body1,
                  ),
                  Container(
                    width: 4.0,
                  ),
                  Icon(
                    Icons.date_range,
                    size: 16.0,
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }

}