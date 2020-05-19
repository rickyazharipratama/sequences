import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sequences/PresenterViews/Base/BasePresenterView.dart';
import 'package:sequences/Utils/Collections/EnumCollections.dart';

class SettingsPresenterView implements BasePresenterView{

  PageStatus _stateStatus = PageStatus.initiating;
  PageStatus get stateStatus => _stateStatus;

  @override
  BuildContext currentContext() {
    return null;
  }

  @override
  void updateState(callback) {
  }

  pageIsReady(){
    _stateStatus = PageStatus.ready;
  }
}