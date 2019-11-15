import 'package:flutter/material.dart';

class HeroBanner extends StatelessWidget {
  final String _id;
  final String _bannerUrl;

  HeroBanner(this._id, this._bannerUrl);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "Movie-Tag-$_id",
      child: FadeInImage.assetNetwork(
          fit: BoxFit.cover,
          width: double.infinity,
          height: 280,
          placeholder: "assets/placeholder.jpg",
          image: _bannerUrl),
    );
  }

}