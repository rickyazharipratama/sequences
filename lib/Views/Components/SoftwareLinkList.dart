import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SoftwareLinkList extends StatelessWidget {

  final VoidCallback action;
  final String title;

  SoftwareLinkList({@required this.action, @required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 0,
        vertical: 5
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          RichText(
            text: TextSpan(
              style: Theme.of(context).primaryTextTheme.bodyText2.apply(
                color: Theme.of(context).primaryColor
              ),
              text: "●"
            ),
          ),

          Padding(
            padding: EdgeInsets.only(
              left: 10
            ),
            child: RichText(
              text: TextSpan(
                style: Theme.of(context).primaryTextTheme.bodyText2.apply(
                  color: Theme.of(context).primaryColor
                ),
                text: title,
                recognizer: TapGestureRecognizer()..onTap = action,
              ),
            ),
          )
        ],
      ),
    );
  }
}