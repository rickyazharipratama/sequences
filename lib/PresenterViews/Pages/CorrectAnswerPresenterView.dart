import 'package:flutter/widgets.dart';
import 'package:sequences/PresenterViews/Base/BasePresenterView.dart';

class CorrectAnswerPresenterView implements BasePresenterView{

  AnimationController animController;
  Animation anim;

  bool isTransitionReady = false;

  initiateAnimation(SingleTickerProviderStateMixin ticker){
    animController = AnimationController(
      vsync: ticker,
      duration: Duration(milliseconds: 500)
    );
    
    anim = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      curve: Curves.ease,
      parent: animController
    ))..addStatusListener((status) {
      if(status == AnimationStatus.completed){
         isTransitionReady = true;
         updateState(() { });
      }
    })..addListener(() {
      updateState(() { });
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