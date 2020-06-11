import 'package:flutter/material.dart';

class WebError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[

        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10
          ),
          child: Center(
            child: Image.asset(
              "assets/images/seru.png",
              height: 125,
              fit: BoxFit.fitHeight,
              color: Theme.of(context).primaryColor,
              alignment: Alignment.center,
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
          child: Center(
            child: Text(
              "Aww...!",
              textAlign: TextAlign.center,
              style: Theme.of(context).primaryTextTheme.bodyText1,
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.fromLTRB(20, 5, 20, 10),
          child: Center(
            child: Text(
              "There is problem(s) encountered to open this site. Try again later.",
              textAlign: TextAlign.center,
              style: Theme.of(context).primaryTextTheme.bodyText2,
            ),
          ),
        ),
      ],
    );
  }
}