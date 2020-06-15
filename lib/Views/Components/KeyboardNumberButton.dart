import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sequences/Models/RX/VirtualKeyboardModel.dart';
import 'package:sequences/Utils/CommonUtils.dart';
import 'package:sequences/Views/SequencesApp.dart';

class KeyboardNumberButton extends StatelessWidget {

  final String label;
  final VirtualKeyboardModel keys;

  KeyboardNumberButton({@required this.label, @required this.keys});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_){
        bool isHasBeenDisabled = keys.blockNumberKey.contains(label);
        CommonUtils.instance.showLog("Key : "+label+" is disabled "+isHasBeenDisabled.toString()+", keys is "+keys.blockNumberKey.join(","));
        return GestureDetector(
          onTap: (){
            if(!isHasBeenDisabled){
              SequencesApp.of(context).presenter.playCoBell();
              keys.structurizeKeyPunched(label);
            }
          },
          child: Container(
            height: CommonUtils.instance.getKeyboardSizeHeight(context),
            decoration: BoxDecoration(
              color: isHasBeenDisabled ? Theme.of(context).disabledColor : Colors.transparent,
              border: Border.all(
                color: isHasBeenDisabled ? Theme.of(context).primaryTextTheme.bodyText2.color : Theme.of(context).buttonColor,
                width: 1
              )
            ),
            child: Center(
              child: RichText(
                text: TextSpan(
                  text: label,
                  style: Theme.of(context).primaryTextTheme.headline4.apply(
                    color: isHasBeenDisabled ? Theme.of(context).primaryTextTheme.bodyText2.color : Theme.of(context).primaryColor,
                  )
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}