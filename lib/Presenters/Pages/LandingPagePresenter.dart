import 'package:sequences/Models/UserStageModel.dart';
import 'package:sequences/PresenterViews/Pages/LandingPagePresenterView.dart';
import 'package:sequences/Presenters/Base/BasePresenter.dart';

class LandingPagePresenter extends BasePresenter{


  final LandingPagePresenterView view;
  UserStageModel currentStages = UserStageModel();



  LandingPagePresenter({this.view});


  @override
  void initiateData() async{
    super.initiateData();
    await currentStages.retrieveCurrentStage();
    view.updateState(view.makeStatusReady);
  }

  @override
  void destroyObject() {
    super.destroyObject();
  }

  Future<void> goToStage() async{
    await view.gotoStages();
    currentStages.retrieveCurrentStage();
    view.updateState(() { });
  }

}