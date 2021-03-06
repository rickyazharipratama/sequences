import 'package:flutter/material.dart';
import 'package:sequences/Views/SequencesApp.dart';

class PrimaryButton extends StatelessWidget {

  final VoidCallback callback;
  final String text;

  PrimaryButton({@required this.callback, @required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        SequencesApp.of(context).presenter.playCoBell();
        callback();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(5),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 18
        ),
        child: Center(
          child: Text(
            text,
            style: Theme.of(context).primaryTextTheme.button,
          ),
        ),
      ),
    );
  }
}