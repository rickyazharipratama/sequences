import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:navigatorium/navigatorium.dart';
import 'package:sequences/Models/RX/QuestionRxModel.dart';
import 'package:sequences/PresenterViews/Base/BasePresenterView.dart';
import 'package:sequences/Views/Pages/CorrectAnswer.dart';
import 'package:sequences/Views/Widgets/HIntWrapper.dart';

class StagesPagePresenterView implements BasePresenterView{

  @override
  BuildContext currentContext() {
    return null;
  }

  @override
  void updateState(callback) {
  }


  Future<bool> goToCorrectAnswer() async{
    await Navigatorium.instance.pushWithNoAnimate(
      currentContext(),
      child: CorrectAnswer()
    );
    return true;
  }

  Future<bool> willPop() async{
    return true;
  }

  showHint({
    QuestionRxModel source,
    int phase
  }) async{
    await showModalBottomSheet(
      context: currentContext(), 
      builder: (context){
        return HintWrapper(
          hintSource: source,
          hintWrap: phase,
        );
    });
  }  
}