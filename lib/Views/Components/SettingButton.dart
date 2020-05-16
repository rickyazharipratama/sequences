import 'package:flutter/material.dart';

class SettingButton extends StatelessWidget {
  final VoidCallback callback;
  final String image;

  SettingButton({@required this.callback, @required this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Image.asset(
           image,
           alignment: Alignment.center,
           color: Theme.of(context).primaryTextTheme.bodyText1.color,
           width: 30,
           height: 30,
           fit: BoxFit.contain,
        ),
      ),
    );
  }
}