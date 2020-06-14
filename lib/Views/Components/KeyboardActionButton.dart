import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sequences/Models/RX/VirtualKeyboardModel.dart';
import 'package:sequences/Utils/Collections/EnumCollections.dart';
import 'package:sequences/Utils/CommonUtils.dart';
import 'package:sequences/Views/SequencesApp.dart';

class KeyboardActionButton extends StatelessWidget {

  final VirtualKeyboardModel keys;
  final KeyboardAction action;
  final Color color;
  final String image;

  KeyboardActionButton({
    @required this.keys,
    @required this.action,
    @required this.color,
    @required this.image
  });

  @override
  Widget build(BuildContext context) {
    Timer timer;
    bool isLongPressActive = false;
    return GestureDetector(
      onTap: (){
        SequencesApp.of(context).presenter.playCoBell();
        keys.structurizeKeyAction(action);
      },
      onLongPressStart: (details){
        if(action == KeyboardAction.erase && keys.keyPunched.length > 0){
          SequencesApp.of(context).presenter.playCoBell();
          isLongPressActive = true;
          print("long Press start");
        }
      },
      onLongPress: (){
        if(action == KeyboardAction.erase && keys.keyPunched.length > 0){
          timer = Timer.periodic(
            Duration(
              milliseconds: 250
            ), 
            (timer){
              if(keys.keyPunched.length > 0){
                SequencesApp.of(context).presenter.playCoBell();
                keys.structurizeKeyAction(action);
              }
            }
          );
        }
      },
      onLongPressEnd: (detail){
        print("long press end");
        if(timer != null){
          if(timer.isActive){
            timer.cancel();
          }
        }
        isLongPressActive = false;
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