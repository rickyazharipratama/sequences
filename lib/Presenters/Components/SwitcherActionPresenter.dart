import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sequences/PresenterViews/Components/SwitcherActionPresenterView.dart';
import 'package:sequences/Presenters/Base/BasePresenter.dart';

class SwitcherActionPresenter extends BasePresenter{

  final SwitcherActionPresenterView view;
  final StreamSink sinker;

  bool isVal = false;

  SwitcherActionPresenter({@required this.view, @required this.sinker});

  onChangeSwitcher(bool val){
    isVal = val;
    sinker.add(val);
    view.updateState((){});
  }
}