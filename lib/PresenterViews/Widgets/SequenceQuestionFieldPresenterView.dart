
import 'package:flutter/material.dart';
import 'package:sequences/PresenterViews/Base/BasePresenterView.dart';

class SequenceQuestionFieldPresenterView implements BasePresenterView{

  AnimationController animController;
  Animation anim;
  double animatePadding = 0;

  initiateAnimation(SingleTickerProviderStateMixin ticker){
    animController = AnimationController(
      vsync: ticker,
      duration: Duration(milliseconds: 500)  
    );
    anim = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      curve: Curves.ease,
      parent: animController
    ))..addListener((){
      if(anim.status == AnimationStatus.forward || anim.status == AnimationStatus.completed){
        animatingForwarding();
      }else{
        animationReversing();
      }
      print("animation value : "+anim.value.toString()+"Animating : "+animatePadding.toString());
      updateState(() { });
    })..addStatusListener((status){

    });
  }

  animationReversing(){
    double percent = 0;
    double maxMove = 15;
    if(anim.value > 0.875 && anim.value <= 1){
      percent = 1 - ((anim.value - .875) / .125);
      animatePadding = maxMove * percent;
    }else if(anim.value > 0.75 && anim.value <= 0.875){
      percent = (anim.value - .75) / .125;
      animatePadding = maxMove * percent;
    }else if(anim.value > 0.625 && anim.value <= 0.75){
      percent = 1-((anim.value - .625) / .125);
      animatePadding = -maxMove * percent;
    }else if(anim.value > 0.5 && anim.value <= 0.625){
      percent = (anim.value - .5) / .125;
      animatePadding = -maxMove * percent;
    }else if(anim.value > 0.375 && anim.value <= 0.5){
      percent = 1 - ((anim.value - .375) / .125);
      animatePadding = maxMove * percent;
    }else if(anim.value > 0.25 && anim.value <= 0.375){
      percent = (anim.value - .25) / .125;
      animatePadding = maxMove * percent;
    }else if(anim.value > 0.125 && anim.value <= 0.25){
      percent = 1-((anim.value - .125) / .125);
      animatePadding = -maxMove * percent;
    }else{
      percent = (anim.value) / .125;
      animatePadding = -maxMove * percent;
    }
  }


  animatingForwarding(){
    double percent = 0;
      double maxMove = 15;
      if(anim.value >= 0 && anim.value <= 0.125){
        percent = anim.value / .125;
        animatePadding = maxMove * percent;
      }else if(anim.value > 0.125 && anim.value <= 0.25){
        percent =  1 - ((anim.value - 0.125) / .125);
        animatePadding = maxMove * percent; 
      }else if(anim.value > 0.25 && anim.value <= 0.375){
        percent = (anim.value - .25) / 0.125;
        animatePadding = -maxMove * percent;
      }else if(anim.value > 0.375 && anim.value <= 0.5){
        percent =  1 - ((anim.value - .375) / .125);
        animatePadding = -maxMove * percent; 
      }else if(anim.value > 0.5 && anim.value <= 0.625){
        percent = (anim.value - .5) / .125;
        animatePadding = maxMove * percent;
      }else if(anim.value > 0.625 && anim.value <= 0.75){
        percent =  1 - ((anim.value - .625) / .125);
        animatePadding = maxMove * percent; 
      }else if(anim.value > 0.75 && anim.value <= 0.875){
        percent = (anim.value - .75) / 0.125;
        animatePadding = -maxMove * percent;
      }else{
        percent =  1 - ((anim.value - .875) / .125);
        animatePadding = -maxMove * percent; 
      }
  }


  handleAnimation(){
    if(animController.status == AnimationStatus.completed){
      animController.reverse();
    }else if(animController.status == AnimationStatus.dismissed){
      animController.forward();
    }
  }

  @override
  BuildContext currentContext() {
    throw UnimplementedError();
  }

  @override
  void updateState(callback) {
  }
}