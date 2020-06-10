import 'package:flutter/material.dart';
import 'package:sequences/Models/RX/VirtualKeyboardModel.dart';
import 'package:sequences/Utils/Collections/EnumCollections.dart';
import 'package:sequences/Views/Components/HintActionButton.dart';
import 'package:sequences/Views/Components/KeyboardActionButton.dart';
import 'package:sequences/Views/Components/KeyboardNumberButton.dart';
import 'package:sequences/Views/Components/KeyboardTextField.dart';

class SequencesKeyboard extends StatelessWidget {

  final VirtualKeyboardModel keys;
  final VoidCallback hintCallback;

  SequencesKeyboard({
    @required this.keys,
    @required this.hintCallback
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
              child: HintActionButton(
                keys: keys,
                hintCallback: hintCallback,
              )
            ),
            // textfield
            Expanded(
              flex: 2,
              child: KeyboardTextField(
                keys: keys,
              )
            ),
            //erase
            Expanded(
              flex: 1,
              child: KeyboardActionButton(
                action: KeyboardAction.erase,
                keys: keys,
                color: Theme.of(context).errorColor,
                image: "assets/images/eraser.png",
              )
            ),
            //submit
            Expanded(
              flex: 1,
              child: KeyboardActionButton(
                action: KeyboardAction.submit,
                keys: keys,
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
                keys: keys,
              )
            ),
            Expanded(
              child:KeyboardNumberButton(
                label: "2",
                keys: keys,
              )
            ),
            Expanded(
              child:KeyboardNumberButton(
                label: "3",
                keys: keys,
              )
            ),
            Expanded(
              child:KeyboardNumberButton(
                label: "4",
                keys: keys,
              )
            ),
            Expanded(
              child:KeyboardNumberButton(
                label: "5",
                keys: keys,
              )
            )
          ],
        ),

        Row(
          children: <Widget>[
            Expanded(
              child:KeyboardNumberButton(
                label: "6",
                keys: keys,
              )
            ),
            Expanded(
              child:KeyboardNumberButton(
                label: "7",
                keys: keys,
              )
            ),
            Expanded(
              child:KeyboardNumberButton(
                label: "8",
                keys: keys,
              )
            ),
            Expanded(
              child:KeyboardNumberButton(
                label: "9",
                keys: keys,
              )
            ),
            Expanded(
              child:KeyboardNumberButton(
                label: "0",
                keys: keys,
              )
            )
          ],
        )
      ],
    );
  }
}