import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sequences/Utils/Collections/EnumCollections.dart';
import 'package:sequences/Utils/CommonUtils.dart';

class KeyboardActionButton extends StatelessWidget {

  final StreamSink actionSinker;
  final KeyboardAction action;
  final Color color;
  final String image;

  KeyboardActionButton({
    @required this.actionSinker,
    @required this.action,
    @required this.color,
    @required this.image
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        actionSinker.add(action);
      },
      child: Container(
        height: CommonUtils.instance.getKeyboardSizeHeight(context),
        color: color,
        child: Center(
          child: Image.asset(
            image,
            width: CommonUtils.instance.getIconKeyboardSize(CommonUtils.instance.getKeyboardSizeHeight(context)),
            fit: BoxFit.contain,
            alignment: Alignment.center,
            color: Theme.of(context).focusColor,
          ),
        ),
      ),
    );
  }
}