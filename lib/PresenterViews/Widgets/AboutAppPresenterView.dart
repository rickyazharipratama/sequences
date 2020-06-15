import 'package:flutter/widgets.dart';
import 'package:sequences/PresenterViews/Base/BasePresenterView.dart';

class AboutAppPresenterView implements BasePresenterView{

  AnimationController animController;
  Animation anim;

  initiateAnimation(SingleTickerProviderStateMixin ticker){
    animController = AnimationController(
      vsync: ticker,
      duration: Duration(milliseconds: 350)
    );
    anim = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      curve: Curves.ease,
      parent: animController,
    )
    )..addListener(() {
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