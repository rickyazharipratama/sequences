import 'package:flutter/material.dart';
import 'package:sequences/Utils/Collections/EnumCollections.dart';

class Level extends StatelessWidget {

  final VoidCallback callback;
  final String label;
  final LevelIconSimbol openState;

  Level({@required this.callback, @required this.label, this.openState : LevelIconSimbol.closed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Center(
        child: Column(
          children: <Widget>[
              Image.asset(
                openState ==LevelIconSimbol.open ? 
                  "assets/images/check-circle.png"
                : openState == LevelIconSimbol.current ?
                  "assets/images/current-circle.png"
                  : "assets/images/lock.png",
                width: 35,
                fit: BoxFit.contain,
                alignment: Alignment.center,
                color: openState == LevelIconSimbol.open ? 
                  Theme.of(context).primaryColor
                  : openState == LevelIconSimbol.current ? 
                    Theme.of(context).hintColor
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