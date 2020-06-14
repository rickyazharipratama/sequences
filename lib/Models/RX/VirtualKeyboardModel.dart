import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:sequences/Utils/Collections/EnumCollections.dart';

part 'VirtualKeyboardModel.g.dart';

class VirtualKeyboardModel = _VirtualKeyboadModel with _$VirtualKeyboardModel;

abstract class _VirtualKeyboadModel with Store{

  final ValueChanged<String> submitCallback;
  final VoidCallback hintCallback;
  
  _VirtualKeyboadModel({
    this.submitCallback,
    this.hintCallback
  });

  @observable
  String keyPunched="";

  KeyboardAction keyAction;

  @observable
  HintState hintState = HintState.loading;

  @observable
  ObservableList<String> blockNumberKey = ObservableList();


  @action
  void addBlockNumberkey(String key){
    blockNumberKey.add(key);
  }

  @action
  void addAllBlockNumberKeys(List<String> keys){
    blockNumberKey.addAll(keys);
  }

  @action
  void resetBlockNumberKey(){
    blockNumberKey.clear();
  }

  @action
  void structurizeKeyPunched(String val){
    if(keyPunched.length < 10){
      print("text length : "+keyPunched.length.toString());
      keyPunched+=val;
    }
  }

  @action
  void structurizeKeyAction(KeyboardAction key){
    if(key == KeyboardAction.erase){
      if(keyPunched.length > 0){
        keyPunched = keyPunched.substring(0, keyPunched.length - 1);
      }
    }else if(key == KeyboardAction.submit){
      if(keyPunched.length > 0){
        submitCallback(keyPunched);
        resetKeyPunched();
      }
    }else if(key == KeyboardAction.hint){
        hintCallback();
    }
    keyAction = key;
  }

  @action
  void resetKeyPunched(){
    keyPunched="";
  }

  @action
  void onHintLoading(){
    hintState = HintState.loading;
  }

  @action
  void onHintLoadFailed(){
    hintState = HintState.failed;
  }

  @action
  void onHintReady(){
    hintState = HintState.ready;
  }
}