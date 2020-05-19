import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sequences/Utils/Collections/EnumCollections.dart';
import 'package:sequences/Views/Components/KeyboardActionButton.dart';
import 'package:sequences/Views/Components/KeyboardNumberButton.dart';
import 'package:sequences/Views/Components/KeyboardTextField.dart';

class SequencesKeyboard extends StatelessWidget {

  // sink num key value to streamer when hitted by user
  final StreamSink<String> numberSinker;

  // sink action key value to streamer when hitted by user
  final StreamSink<KeyboardAction> actionSinker;

  // stream number key value when hitted by user
  final Stream<String> numberSteam;

  // stream action key value when hitted by user
  final Stream<KeyboardAction> actionStream;

  //sink text value to streamer
  final StreamSink<String> answerSinker;

  SequencesKeyboard({
    @required this.numberSinker, 
    @required this.actionSinker, 
    @required this.numberSteam, 
    @required this.actionStream,
    @required this.answerSinker
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        
        Row(
          children: <Widget>[
            // hint
            Expanded(
              flex: 1,
              child: KeyboardActionButton(
                action: KeyboardAction.hint,
                actionSinker: actionSinker,
                color: Theme.of(context).hintColor,
                image: "assets/images/light-on.png",
              ),
            ),
            // textfield
            Expanded(
              flex: 2,
              child: KeyboardTextField(
                textSinker: answerSinker,
                numberStreamer: numberSteam, 
                actionStreamer: actionStream
              )
            ),
            //erase
            Expanded(
              flex: 1,
              child: KeyboardActionButton(
                action: KeyboardAction.erase,
                actionSinker: actionSinker,
                color: Theme.of(context).errorColor,
                image: "assets/images/eraser.png",
              )
            ),
            //submit
            Expanded(
              flex: 1,
              child: KeyboardActionButton(
                action: KeyboardAction.submit,
                actionSinker: actionSinker,
                color: Theme.of(context).primaryColor,
                image: "assets/images/check.png",
              ),
            )
          ],
        ),

        Row(
          children: <Widget>[
            Expanded(
              child:KeyboardNumberButton(
                label: "1",
                sinker: numberSinker,
              )
            ),
            Expanded(
              child:KeyboardNumberButton(
                label: "2",
                sinker: numberSinker,
              )
            ),
            Expanded(
              child:KeyboardNumberButton(
                label: "3",
                sinker: numberSinker,
              )
            ),
            Expanded(
              child:KeyboardNumberButton(
                label: "4",
                sinker: numberSinker,
              )
            ),
            Expanded(
              child:KeyboardNumberButton(
                label: "5",
                sinker: numberSinker,
              )
            )
          ],
        ),

        Row(
          children: <Widget>[
            Expanded(
              child:KeyboardNumberButton(
                label: "6",
                sinker: numberSinker,
              )
            ),
            Expanded(
              child:KeyboardNumberButton(
                label: "7",
                sinker: numberSinker,
              )
            ),
            Expanded(
              child:KeyboardNumberButton(
                label: "8",
                sinker: numberSinker,
              )
            ),
            Expanded(
              child:KeyboardNumberButton(
                label: "9",
                sinker: numberSinker,
              )
            ),
            Expanded(
              child:KeyboardNumberButton(
                label: "0",
                sinker: numberSinker,
              )
            )
          ],
        )
      ],
    );
  }
}