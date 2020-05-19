import 'package:flutter/material.dart';

class ImageButton extends StatelessWidget {
  final VoidCallback callback;
  final String image;
  final Color color;
  final double size;

  ImageButton({@required this.callback, @required this.image, this.color, this.size : 30});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Image.asset(
           image,
           alignment: Alignment.center,
           color: color == null ? Theme.of(context).primaryTextTheme.bodyText1.color : color,
           width: size,
           height: size,
           fit: BoxFit.contain,
        ),
      ),
    );
  }
}