
import 'package:flutter/widgets.dart';
import 'package:sequences/PresenterViews/Base/BasePresenterView.dart';
import 'package:sequences/Utils/Collections/EnumCollections.dart';
import 'package:sequences/Views/Components/TapToStart.dart';
import 'package:sequences/Views/Widgets/ContinueWrapper.dart';

class LandingPagePresenterView implements BasePresenterView{

  PageStatus status = PageStatus.initiating;

  @override
  BuildContext currentContext() {
    return null;
  }

  @override
  void updateState(callback) {

  }

  makeStatusReady(){
    status = PageStatus.ready;
  }

  Widget bottomSection(int currentStages){
    if(status == PageStatus.ready){
      if(currentStages >= 0){
        // button section;
        return ContinueWrapper();
      }
      // tap to startSection;
      return Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
        child: TapToStart(),
      );
    }
    return null;
  }
}