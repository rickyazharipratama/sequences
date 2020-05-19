import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sequences/Utils/CommonUtils.dart';

class KeyboardNumberButton extends StatelessWidget {

  final String label;
  final StreamSink sinker;

  KeyboardNumberButton({@required this.label, @required this.sinker});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        sinker.add(label);
      },
      child: Container(
        height: CommonUtils.instance.getKeyboardSizeHeight(context),
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).buttonColor,
            width: 1
          )
        ),
        child: Center(
          child: RichText(
            text: TextSpan(
              text: label,
              style: Theme.of(context).primaryTextTheme.headline4
            ),
          ),
        ),
      ),
    );
  }
}