import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:sequences/Models/RX/VirtualKeyboardModel.dart';
import 'package:sequences/Utils/Collections/EnumCollections.dart';
import 'package:sequences/Utils/CommonUtils.dart';
import 'package:sequences/Views/SequencesApp.dart';
import 'package:sequences/Views/Widgets/ShareToYourFriend.dart';

class HintActionButton extends StatelessWidget {

  final VirtualKeyboardModel keys;
  final VoidCallback hintCallback;

  HintActionButton({@required this.keys, @required this.hintCallback});

  @override
  Widget build(BuildContext context) {
    
    return Observer(
      builder: (context)=> GestureDetector(
        onTap: hintCallback,
        child: Container(
          height: CommonUtils.instance.getKeyboardSizeHeight(context),
          color: keys.hintState == HintState.ready ? Theme.of(context).hintColor : Theme.of(context).cardColor,
          child: Center(
            child: keys.hintState == HintState.loading ?
            SizedBox(
              height: (CommonUtils.instance.getKeyboardSizeHeight(context) * 2) / 3,
              width: (CommonUtils.instance.getKeyboardSizeHeight(context) * 2) / 3,
              child: LoadingIndicator(
                indicatorType: Indicator.pacman,
                color: Theme.of(context).primaryColor,
              )
            )
            : Image.asset(
              keys.hintState == HintState.ready ? 
                "assets/images/light-on.png"
                :"assets/images/no-light.png"
              ,
              width: CommonUtils.instance.getIconKeyboardSize(CommonUtils.instance.getKeyboardSizeHeight(context)),
              fit: BoxFit.contain,
              alignment: Alignment.center,
              color: Theme.of(context).focusColor,
            ),
          ),
        ),
      )
    );
  }
}