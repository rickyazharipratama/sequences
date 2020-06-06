import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sequences/Models/RX/VirtualKeyboardModel.dart';
import 'package:sequences/Utils/Collections/EnumCollections.dart';
import 'package:sequences/Utils/CommonUtils.dart';
import 'package:sequences/Views/SequencesApp.dart';

class HintActionButton extends StatelessWidget {

  final VirtualKeyboardModel keys;

  HintActionButton({@required this.keys});

  @override
  Widget build(BuildContext context) {
    
    return Observer(
      builder: (context)=> GestureDetector(
        onTap: (){
          SequencesApp.of(context).presenter.playCoBell();
          if(keys.hintState == HintState.ready){
            keys.structurizeKeyAction(KeyboardAction.hint);
          }else if(keys.hintState == HintState.failed){
            CommonUtils.instance.showToast(context,
              msg: "Can't load ads to unlock hint"
            );
          }else if(keys.hintState == HintState.loading){
            CommonUtils.instance.showToast(context,
              msg: "Preparing ads to unlock hint"
            );
          }
        },
        child: Container(
          height: CommonUtils.instance.getKeyboardSizeHeight(context),
          color: keys.hintState == HintState.ready ? Theme.of(context).hintColor : Theme.of(context).cardColor,
          child: Center(
            child: keys.hintState == HintState.loading ?
            SizedBox(
              height: CommonUtils.instance.getIconKeyboardSize(CommonUtils.instance.getKeyboardSizeHeight(context)),
              width: CommonUtils.instance.getIconKeyboardSize(CommonUtils.instance.getKeyboardSizeHeight(context)),
              child: CircularProgressIndicator(
                backgroundColor: Theme.of(context).cardColor,
                strokeWidth: 3,
                valueColor: AlwaysStoppedAnimation(Theme.of(context).primaryColor),
              ),
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