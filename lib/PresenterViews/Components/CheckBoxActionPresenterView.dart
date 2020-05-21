import 'package:flutter/widgets.dart';
import 'package:sequences/PresenterViews/Base/BasePresenterView.dart';
import 'package:sequences/Utils/Collections/EnumCollections.dart';

class CheckBoxActionPresenterView implements BasePresenterView{

  PageStatus state = PageStatus.initiating;

  @override
  BuildContext currentContext() {
    throw UnimplementedError();
  }

  @override
  void updateState(callback) {
  }

  makeStatusReady(){
    state = PageStatus.ready;
  }

}