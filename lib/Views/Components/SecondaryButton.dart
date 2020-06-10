import 'package:flutter/material.dart';
import 'package:sequences/Views/SequencesApp.dart';

class SecondaryButton extends StatelessWidget {

  final VoidCallback callback;
  final String text;
  final Color color;

  SecondaryButton({@required this.callback, @required this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        SequencesApp.of(context).presenter.playCoBell();
        callback();
      },
      child: Container(
        decoration: BoxDecoration(
          color:  Colors.transparent,
          border: Border.all(
            color: color ?? Theme.of(context).primaryColor,
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
            style: Theme.of(context).primaryTextTheme.headline4.apply(
              color: color ?? Theme.of(context).primaryColor
            ),
          ),
        ),
      ),
    );
  }
}