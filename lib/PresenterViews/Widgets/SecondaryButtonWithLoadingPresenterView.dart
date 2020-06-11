import 'package:flutter/widgets.dart';
import 'package:sequences/PresenterViews/Base/BasePresenterView.dart';
import 'package:sequences/Utils/Collections/EnumCollections.dart';

class SecondaryButtonWithLoadingPresenterView implements BasePresenterView{

  PageStatus state = PageStatus.ready;

  @override
  BuildContext currentContext() {
    throw UnimplementedError();
  }

  @override
  void updateState(callback) {
  }

  startLoading() {
    updateState((){
      state = PageStatus.loading;
    });
  }

  makeReady(){
    updateState(() {
      state = PageStatus.ready;
    });
  }
}