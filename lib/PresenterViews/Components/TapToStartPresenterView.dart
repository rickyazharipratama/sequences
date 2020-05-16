import 'package:flutter/material.dart';

class TapToStartPresenterView{
  
  AnimationController animController;
  Animation<double> anim;

  initiateAnimationController(SingleTickerProviderStateMixin ticker){
    animController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: ticker
    );
    anim = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        curve: Curves.easeInOut,
        parent: animController
      )
    )..addStatusListener((status){
      if(status == AnimationStatus.completed){
        animController.reverse();
      }else if(status == AnimationStatus.dismissed){
        animController.forward();
      }
    });
    animController.forward();
  }

}