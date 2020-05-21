
import 'package:flutter/widgets.dart';
import 'package:sequences/PresenterViews/Base/BasePresenterView.dart';
import 'package:sequences/Utils/Collections/EnumCollections.dart';

class SwitcherActionPresenterView implements BasePresenterView{

  PageStatus state = PageStatus.initiating;

  @override
  BuildContext currentContext() {
    return null;
  }

  @override
  void updateState(callback) {
  }

  makePageReady(){
    state = PageStatus.ready;
  }
}