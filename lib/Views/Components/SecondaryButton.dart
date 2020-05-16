import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {

  final VoidCallback callback;
  final String text;

  SecondaryButton({@required this.callback, @required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        decoration: BoxDecoration(
          color:  Colors.transparent,
          border: Border.all(
            color: Theme.of(context).primaryColor,
            width: 2
          ),
          borderRadius: BorderRadius.circular(5)
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 15
        ),
        child: Center(
          child: Text(
            text,
            style: Theme.of(context).primaryTextTheme.headline4,
          ),
        ),
      ),
    );
  }
}