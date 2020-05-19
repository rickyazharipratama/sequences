import 'dart:async';

import 'package:sequences/PresenterViews/Components/KeyboardTextFieldPresenterView.dart';
import 'package:sequences/Presenters/Base/BasePresenter.dart';
import 'package:sequences/Utils/Collections/EnumCollections.dart';

class KeyboardTextFieldPresenter extends BasePresenter{


  // presenter view from view
  final KeyboardTextFieldPresenterView view;

  // stremer key value when hitted by user
  final Stream<String> numberStream;

  //streamer key value when hitted by user
  final Stream<KeyboardAction> actionStream;

  //sinker value to streamer 
  final StreamSink<String> answerSinker;

  KeyboardTextFieldPresenter({this.view, this.numberStream, this.actionStream, this.answerSinker});

  String _value="";
  String get value => _value;

  @override
  void initiateData() {
    super.initiateData();
    numberStream.listen(onNumberKeyboardListening);
    actionStream.listen(onActionKeyboardListening);
  }

  //listening event for number key action
  onNumberKeyboardListening(String val){
    if(_value == null){
      _value = val;
    }else{
      if(_value.length < 10){
        _value+=val;
      }
    }
    view.updateState((){});
  }

  //listening event for key action
  onActionKeyboardListening(KeyboardAction act){
    if(act == KeyboardAction.erase){
        //remove one string at last char
       _value = _value.substring(0, _value.length - 1);
    }else if(act == KeyboardAction.submit){
      // sink data value to stream and reset to empty
      answerSinker.add(_value);
      _value = "";
    }
    view.updateState((){});
  }
}