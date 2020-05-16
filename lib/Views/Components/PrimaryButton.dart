import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {

  final VoidCallback callback;
  final String text;

  PrimaryButton({@required this.callback, @required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(5),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 15
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