import 'package:flutter/material.dart';

class ListButton extends StatelessWidget {

  final String label;
  final VoidCallback callback;

  ListButton({@required this.label, @required this.callback});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 7.5
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Text(
                label,
                maxLines: 1,
                style: Theme.of(context).primaryTextTheme.button,
              ),
            ),

            Icon(Icons.chevron_right,
              color: Theme.of(context).focusColor,
              size: 30,
            )
          ],
        ),
      ),
    );
  }
}