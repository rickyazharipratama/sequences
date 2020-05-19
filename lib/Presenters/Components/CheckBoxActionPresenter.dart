import 'dart:async';

import 'package:sequences/PresenterViews/Components/CheckBoxActionPresenterView.dart';
import 'package:sequences/Presenters/Base/BasePresenter.dart';

class CheckBoxActionPresenter extends BasePresenter{

  final StreamSink sinker;
  final CheckBoxActionPresenterView view;

  bool _isChecked = false;

  CheckBoxActionPresenter({this.sinker, this.view});

  bool get isChecked => _isChecked;
  set setChecked(bool val){_isChecked = val;}

  @override
  void initiateData() async{
    
    super.initiateData();
  }

  oncheckedChange(bool val){
    view.updateState((){
      setChecked = val;
      sinker.add(val);
    });
  }
}