import 'package:flutter/material.dart';
import 'package:sequences/PresenterViews/Base/BasePresenterView.dart';

class ThirdPartyLicensePresenterView implements BasePresenterView{

  AnimationController animController;
  Animation anim;

  initiateAnimation(SingleTickerProviderStateMixin ticker){
    animController = AnimationController(
      vsync: ticker,
      duration: Duration(milliseconds: 300)
    );
    anim = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      curve: Curves.easeIn,
      parent: animController
    ))..addListener(() {
      updateState(() { });
    })..addStatusListener((status) {
      if(status == AnimationStatus.completed){
        animController.reverse();
      }else if(status == AnimationStatus.dismissed){
        animController.forward();
      }
    });
    animController.forward();
  }
  
  @override
  BuildContext currentContext() {
    throw UnimplementedError();
  }

  @override
  void updateState(callback) {
  }
}