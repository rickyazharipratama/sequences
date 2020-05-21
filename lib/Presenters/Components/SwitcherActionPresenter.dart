import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sequences/PresenterViews/Components/SwitcherActionPresenterView.dart';
import 'package:sequences/Presenters/Base/BasePresenter.dart';

class SwitcherActionPresenter extends BasePresenter{

  final SwitcherActionPresenterView view;
  final StreamSink sinker;
  final bool firstVal;

  bool isVal = false;

  SwitcherActionPresenter({@required this.view, @required this.sinker, this.firstVal});

  @override
  initiateData(){
    super.initiateData();
    isVal = firstVal;
    view.updateState(view.makePageReady);
  }

  onChangeSwitcher(bool val){
    isVal = val;
    print("switcher :"+isVal.toString());
    sinker.add(val);
    view.updateState((){});
  }
}