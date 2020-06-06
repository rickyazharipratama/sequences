import 'package:flutter/material.dart';
import 'package:sequences/Views/Components/LineSeparator.dart';
import 'package:sequences/Views/Components/PrimaryButton.dart';
import 'package:sequences/Views/Components/SecondaryButton.dart';

class ContinueWrapper extends StatelessWidget{

  final VoidCallback onContinue;
  final VoidCallback onNewGame;
  final VoidCallback onLevelSelect;

  ContinueWrapper({
    @required this.onContinue,
    @required this.onNewGame,
    @required this. onLevelSelect
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[

        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 5,
            horizontal: (MediaQuery.of(context).size.width/4) / 2,
          ),
          child: PrimaryButton(callback: onContinue, text: "CONTINUE"),
        ),

        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[

            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 10
                ),
                child: LineSeparator(),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 20
              ),
              child: Text(
                "Or",
                style: Theme.of(context).primaryTextTheme.bodyText2,
              ),
            ),

            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  right: 10
                ),
                child: LineSeparator(),
              ),
            )
          ],
        ),

        Padding(
          padding: EdgeInsets.fromLTRB(
            10, 
            5, 
            10, 
            MediaQuery.of(context).padding.bottom  + 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    right: 5
                  ),
                  child: SecondaryButton(
                    callback: onLevelSelect,
                    text: "Levels",
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 5
                  ),
                  child: SecondaryButton(
                    callback: onNewGame,
                    text: "New Game",
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}