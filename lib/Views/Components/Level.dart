import 'package:flutter/material.dart';

class Level extends StatelessWidget {

  final VoidCallback callback;
  final String label;
  final bool isOpen;

  Level({@required this.callback, @required this.label, this.isOpen : false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Center(
        child: Column(
          children: <Widget>[
              Image.asset(
                isOpen ? 
                  "assets/images/check-circle.png"
                : "assets/images/lock.png",
                width: 35,
                fit: BoxFit.contain,
                alignment: Alignment.center,
                color: isOpen ? 
                  Theme.of(context).primaryColor
                  : Theme.of(context).cardColor
              ),

              Padding(
                padding: const EdgeInsets.only(
                  top: 15,
                  left: 5,
                  right: 5,
                ),
                child: Text(
                  label,
                  maxLines: 1,
                  style: Theme.of(context).primaryTextTheme.bodyText2,
                ),
              )
          ],
        ),
      ),
    );
  }
}