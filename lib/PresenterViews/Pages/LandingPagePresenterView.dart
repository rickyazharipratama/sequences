
import 'package:flutter/widgets.dart';
import 'package:navigatorium/navigatorium.dart';
import 'package:sequences/PresenterViews/Base/BasePresenterView.dart';
import 'package:sequences/Utils/Collections/EnumCollections.dart';
import 'package:sequences/Views/Components/TapToStart.dart';
import 'package:sequences/Views/Pages/LevelPage.dart';
import 'package:sequences/Views/Pages/StagesPage.dart';
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

  Widget bottomSection(int currentStages, VoidCallback reset){
    if(status == PageStatus.ready){
      if(currentStages > 1){
        // button section;
        return ContinueWrapper(
          onContinue: gotoStages,
          onLevelSelect: goToLevelSelect,
          onNewGame: (){
            goToNewGame(reset);
          },
        );
      }
      // tap to startSection;
      return Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
        child: TapToStart(
          text: "Tap to Play",
        ),
      );
    }
    return Container();
  }

  goToNewGame(VoidCallback reset) async{
    await Navigatorium.instance.pushWithNoAnimate(
      currentContext(),
      child: StagesPage.resetGame()
    );
    reset();
    updateState(() { });
  }

  goToLevelSelect() async{
    int level = await Navigatorium.instance.pushWithNoAnimate(
      currentContext(),
      child: LevelPage()
    );
    print("level : "+level.toString());
    if(level > 0){
      await Navigatorium.instance.pushWithNoAnimate(
        currentContext(),
        child: StagesPage.toContinue(
          isContinue: true,
          spesificStage: level,
        )
      );
    }
  }

  Future<void> gotoStages() async{
    await Navigatorium.instance.pushWithNoAnimate(
      currentContext(),
      child: StagesPage.toContinue()
    );
  }
}