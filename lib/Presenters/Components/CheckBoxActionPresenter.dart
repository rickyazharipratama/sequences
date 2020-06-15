import 'dart:async';

import 'package:sequences/PresenterViews/Components/CheckBoxActionPresenterView.dart';
import 'package:sequences/Presenters/Base/BasePresenter.dart';
import 'package:sequences/Utils/CommonUtils.dart';

class CheckBoxActionPresenter extends BasePresenter{

  final StreamSink sinker;
  final CheckBoxActionPresenterView view;
  final bool isChecked;

  bool _isCheck;

  bool get isCheck => _isCheck;
  set setCheck(bool val){_isCheck = val;}

  CheckBoxActionPresenter({this.sinker, this.view, this.isChecked});

  @override
  void initiateData() async{
    super.initiateData();
    setCheck = isChecked;
    CommonUtils.instance.showLog("is Checked  :" + isChecked.toString());
    view.updateState(view.makeStatusReady);
  }

  oncheckedChange(bool val){
     setCheck = val;
     sinker.add(val);
    view.updateState((){});
  }
}