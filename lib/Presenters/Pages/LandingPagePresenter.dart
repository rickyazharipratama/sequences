import 'package:sequences/Models/UserStageModel.dart';
import 'package:sequences/PresenterViews/Pages/LandingPagePresenterView.dart';
import 'package:sequences/Presenters/Base/BasePresenter.dart';
import 'package:sequences/Utils/Collections/DefaultConstantCollection.dart';
import 'package:sequences/Views/SequencesApp.dart';

class LandingPagePresenter extends BasePresenter{


  final LandingPagePresenterView view;
  UserStageModel currentStages = UserStageModel();



  LandingPagePresenter({this.view});


  @override
  void initiateData() async{
    super.initiateData();
    sendCurrentScreen(DefaultConstantCollection.instance.landingPage);
    await currentStages.retrieveCurrentStage();
    view.updateState(view.makeStatusReady);
  }

  @override
  void destroyObject() {
    super.destroyObject();
  }

  Future<void> goToStage() async{
    await view.gotoStages();
    await currentStages.retrieveCurrentStage();
    SequencesApp.of(view.currentContext()).presenter.isInMusicArea = false;
    SequencesApp.of(view.currentContext()).presenter.stopMusicSound();
    view.updateState(() { });
  }

  Future<void> resetStage() async{
    await currentStages.retrieveCurrentStage();
    if(currentStages.currentStage != 1){
      currentStages.currentStage = 1;
      await currentStages.saveToStore();
    }
  }
}