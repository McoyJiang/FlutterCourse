import 'package:flutter/material.dart';

class FavoriteIcon extends StatefulWidget {
  final double iconSize;
  final Color color;

  final bool active;
  final ValueChanged<bool> onChanged;

  FavoriteIcon({this.iconSize = 30, this.color = Colors.white,
    @required this.active,
    @required this.onChanged});

  @override
  State<StatefulWidget> createState() {
    return _FavoriteIconState();
  }

}

class _FavoriteIconState extends State<FavoriteIcon> {
  bool _isFavorited = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0),
      child: IconButton(
        iconSize: widget.iconSize,
        icon: (_isFavorited ? Icon(Icons.favorite) : Icon(Icons.favorite_border)),
        color: widget.color,
        onPressed: _toggleFavorite,
      ),
    );
  }

  void _toggleFavorite() {
    setState(() {
      _isFavorited = !_isFavorited;
      widget?.onChanged(_isFavorited);
    });
  }

}