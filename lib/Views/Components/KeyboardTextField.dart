import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sequences/PresenterViews/Components/KeyboardTextFieldPresenterView.dart';
import 'package:sequences/Presenters/Components/KeyboardTextFieldPresenter.dart';
import 'package:sequences/Utils/Collections/EnumCollections.dart';
import 'package:sequences/Utils/CommonUtils.dart';

class KeyboardTextField extends StatefulWidget {

  // stream key number value when hitted by user
  final Stream<String> numberStreamer;

  // stream action key value whene hitted by user
  final Stream<KeyboardAction> actionStreamer;

  //sink text value to stremer
  final StreamSink<String> textSinker;

  KeyboardTextField({
    @required this.numberStreamer, 
    @required this.actionStreamer,
    @required this. textSinker});

  @override
  _KeyboardTextFieldState createState() => new _KeyboardTextFieldState();
}

class _KeyboardTextFieldState extends State<KeyboardTextField> with KeyboardTextFieldPresenterView{

  KeyboardTextFieldPresenter presenter;

  @override
  void initState() {
    super.initState();
    presenter = KeyboardTextFieldPresenter(
      actionStream: widget.actionStreamer,
      numberStream: widget.numberStreamer,
      answerSinker: widget.textSinker,
      view: this
    )
    ..initiateData();
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
        child: RichText(
          textAlign: TextAlign.left,
          text: TextSpan(
            text: presenter.value,
            style: Theme.of(context).primaryTextTheme.headline4
          ),
        ),
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