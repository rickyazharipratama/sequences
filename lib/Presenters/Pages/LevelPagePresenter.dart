import 'package:sequences/Models/UserStageModel.dart';
import 'package:sequences/PresenterViews/Pages/LevelPagePresenterView.dart';
import 'package:sequences/Presenters/Base/BasePresenter.dart';
import 'package:sequences/Utils/Collections/DefaultConstantCollection.dart';

class LevelPagePresenter extends BasePresenter{

  final LevelPagePresenterView view;
  UserStageModel stages = UserStageModel();

  LevelPagePresenter({this.view});

  @override
  void initiateData() async{
    super.initiateData();
    sendCurrentScreen(DefaultConstantCollection.instance.levelSelectPage);
    await stages.retrieveCurrentStage();
    view.updateState(() {});
  }
}