import 'package:sequences/Models/UserStageModel.dart';
import 'package:sequences/PresenterViews/Pages/LandingPagePresenterView.dart';
import 'package:sequences/Presenters/Base/BasePresenter.dart';
import 'package:sequences/Utils/Collections/DefaultConstantCollection.dart';
import 'package:sequences/Utils/Collections/EnumCollections.dart';
import 'package:sequences/Utils/CommonUtils.dart';
import 'package:sequences/Views/SequencesApp.dart';

class LandingPagePresenter extends BasePresenter{


  final LandingPagePresenterView view;
  UserStageModel currentStages = UserStageModel();



  LandingPagePresenter({this.view});


  @override
  void initiateData() async{
    super.initiateData();
    rc = await CommonUtils.instance.initiateRemoteConfig();
    sendCurrentScreen(DefaultConstantCollection.instance.landingPage);
    await currentStages.retrieveCurrentStage();
    playBackgroundMusic();
    view.updateState((){
      view.makeStatusReady();
      checkMaintenance(view.currentContext());
    });
  }

  @override
  void destroyObject() {
    super.destroyObject();
  }

  Future<void> goToStage() async{
    SequencesApp.of(view.currentContext()).presenter.stopMusicSound();
    await view.gotoStages();
    print("back from stage");
    playBackgroundMusic();
    await currentStages.retrieveCurrentStage();
    view.updateState(() { });
  }

  Future<void> resetStage() async{
    currentStages.currentStage = 1;
    await currentStages.saveToStore();
    await view.goToNewGame();
    playBackgroundMusic();
    await currentStages.retrieveCurrentStage();
    view.updateState(() { });
  }

  levelSelect() async{
    view.goToLevelSelect(
       selectedListener: (){
         print("on selected listener");
         SequencesApp.of(view.currentContext()).presenter.stopMusicSound();
       },
       returnStage: () async{
         playBackgroundMusic();
         await currentStages.retrieveCurrentStage();
         view.updateState(() { });
       }
    );
  }

  void playBackgroundMusic(){
    SequencesApp.of(view.currentContext()).presenter.musicArea = MusicState.landingPage;
    SequencesApp.of(view.currentContext()).presenter.playMusicSound();
  }
}