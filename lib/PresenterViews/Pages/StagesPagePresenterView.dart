import 'package:flutter/widgets.dart';
import 'package:navigatorium/navigatorium.dart';
import 'package:sequences/PresenterViews/Base/BasePresenterView.dart';
import 'package:sequences/Views/Pages/CorrectAnswer.dart';

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

}