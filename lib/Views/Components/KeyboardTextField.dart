
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sequences/Models/RX/VirtualKeyboardModel.dart';
import 'package:sequences/PresenterViews/Components/KeyboardTextFieldPresenterView.dart';
import 'package:sequences/Utils/CommonUtils.dart';

class KeyboardTextField extends StatefulWidget {

  // stream key number value when hitted by user
  final VirtualKeyboardModel keys;


  KeyboardTextField({
    @required this.keys  
  });

  @override
  _KeyboardTextFieldState createState() => new _KeyboardTextFieldState();
}

class _KeyboardTextFieldState extends State<KeyboardTextField> with KeyboardTextFieldPresenterView{


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).primaryColor,
          width: 1
        ),
      ),
      height: CommonUtils.instance.getKeyboardSizeHeight(context),
      padding: EdgeInsets.symmetric(
        horizontal: 5
      ),
      child: Center(
        child: Observer(
          builder: (context) => RichText(
            textAlign: TextAlign.left,
            text: TextSpan(
              text: widget.keys.keyPunched,
              style: Theme.of(context).primaryTextTheme.headline4
            ),
          ),
        )
      )
    );
  }

  @override
  BuildContext currentContext() {
    return context;
  }

  @override
  void updateState(callback) {
    super.updateState(callback);
    setState(callback);
  }

}