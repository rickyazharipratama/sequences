import 'package:sequences/Models/UserStageModel.dart';
import 'package:sequences/PresenterViews/Pages/LevelPagePresenterView.dart';
import 'package:sequences/Presenters/Base/BasePresenter.dart';

class LevelPagePresenter extends BasePresenter{

  final LevelPagePresenterView view;
  UserStageModel stages = UserStageModel();

  LevelPagePresenter({this.view});

  @override
  void initiateData() async{
    super.initiateData();
    await stages.retrieveCurrentStage();
    view.updateState(() {});
  }
}