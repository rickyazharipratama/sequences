import 'dart:async';
import 'dart:math';

import 'package:sequences/Models/RX/QuestionRxModel.dart';
import 'package:sequences/Models/RX/VirtualKeyboardModel.dart';
import 'package:sequences/Models/UserStageModel.dart';
import 'package:sequences/PresenterViews/Pages/StagesPagePresenterView.dart';
import 'package:sequences/Presenters/Base/BasePresenter.dart';
import 'package:sequences/Utils/Collections/DefaultConstantCollection.dart';
import 'package:sequences/Utils/Collections/EnumCollections.dart';
import 'package:sequences/Utils/CommonUtils.dart';
import 'package:sequences/Views/SequencesApp.dart';

class StagesPagePresenter extends BasePresenter{

  final StagesPagePresenterView view;

  QuestionRxModel seq;
  VirtualKeyboardModel keys;

  StreamController<bool> _shakerStream = StreamController();

  Stream<bool> get shakerStream => _shakerStream.stream;
  StreamSink<bool> get shakerSink => _shakerStream.sink;

  final bool isContinue;
  final int fromStage;

  int duration = 0;
  int unCorrectAnswer = 0;

  StagesPagePresenter({this.view, this. isContinue, this.fromStage}){
    keys = VirtualKeyboardModel(
      hintCallback: onMustDoHint,
      submitCallback: onReceiveAnswerListener
    );
    seq = QuestionRxModel();
  }

  UserStageModel stages;


  @override
  void initiateData() async{
    super.initiateData();
    await view.initializeAdmob(
      rewardCallback: onAdmobRewardCallback,
      onHintLoad: keys.onHintLoading,
      onHintLoadFailed: keys.onHintLoadFailed,
      onHintReady: keys.onHintReady,
      onAdsOpened: SequencesApp.of(view.currentContext()).presenter.pauseMusicSound,
      onAdsClosed: SequencesApp.of(view.currentContext()).presenter.resumeMusicSound
    );
    stages = UserStageModel();
    if(isContinue){
      if(fromStage < 0){
        await stages.retrieveCurrentStage();
      }else{
        stages.currentStage = fromStage;
      }
    }else{
      stages.currentStage = 1;
      await stages.saveToStore();
    }
    await seq.generateQuestion(stages.currentStage);
    SequencesApp.of(view.currentContext()).presenter.musicArea = MusicState.stage;
    SequencesApp.of(view.currentContext()).presenter.playMusicSound();
    sendCurrentScreen(DefaultConstantCollection.instance.stagePage);
    duration = DateTime.now().millisecondsSinceEpoch;
  }

  @override
  void destroyObject() {
    super.destroyObject();
    _shakerStream.close();
  }


  Future<bool> closingPage() async{
    SequencesApp.of(view.currentContext()).presenter.stopMusicSound();
    return true;
  }

  //listening answer stream
  onReceiveAnswerListener(String answer) async{
    int intAnswer = int.parse(answer);
    // compare the answer with real answer
    if(intAnswer == seq.sequence.answer){
      //correct answer
      int diff = DateTime.now().millisecondsSinceEpoch - duration;
      String diffTimeFormat = CommonUtils.instance.milliSecondToTime(diff);
      sendAnalyticEvent(
        name: DefaultConstantCollection.instance.answerDuration,
        params: {
          "date" : DateTime.now().toString(),
          "level" : stages.currentStage.toString(),
          "duration": diff,
          "duration_tim_format":diffTimeFormat
        }
      );
      sendAnalyticEvent(
        name: DefaultConstantCollection.instance.hintCount,
        params: {
          "date": DateTime.now().toString(),
          "level": stages.currentStage.toString(),
          "hint_left": 3 - stages.hintCounter
        }
      );

      sendAnalyticEvent(
        name: DefaultConstantCollection.instance.uncorrectAnswer,
        params: {
          "date" : DateTime.now().toString(),
          "level": stages.currentStage.toString(),
          "uncorrect": unCorrectAnswer
        }
      );
      stages.goToNextStage();
      await stages.saveToStore();
      await view.goToCorrectAnswer();
      unCorrectAnswer = 0;
      duration = DateTime.now().millisecondsSinceEpoch;
      keys.resetBlockNumberKey();
      stages.resetHintCount();
      if(stages.currentStage <= DefaultConstantCollection.instance.totalStage){
        await seq.generateQuestion(stages.currentStage);
      }else{
        await view.goToCreditPage(
          ext: closingPage
        );
      }
    }else{
      //wrong answer
      unCorrectAnswer++;
      shakerSink.add(true);
      CommonUtils.instance.showLog("wrong answer");
    }
  }

  onMustDoHint() async{
    if(stages.hintCounter >0){
      if(await view.admobReward.isLoaded){
        view.admobReward.show();
      }else{
        view.goToShareToYourFriend();
      }
    }else{
      onAdmobRewardCallback(1);
    }
  }


  blockNumberKey(){
    int index = 0;
    List<String> idxAnswers = seq.sequence.answer.toString().split("");
    List<String> blockedkeys = List();
    Random rand = Random();
    while(index < seq.sequence.removeKeyCount){
      String cln =   rand.nextInt(9).toString();
      if(!idxAnswers.contains(cln) && !blockedkeys.contains(cln)){
        blockedkeys.add(cln);
        index++;
      }
    }
    keys.addAllBlockNumberKeys(blockedkeys);
    CommonUtils.instance.showLog(keys.blockNumberKey.join(",").toString());
  }


  onAdmobRewardCallback(int val) async{
    if(val > 0){
      await view.showHint(
        phase: stages.hintCounter,
        source: seq
      );
      CommonUtils.instance.showLog("hint counter : "+stages.hintCounter.toString());
      if(stages.hintCounter == 2){
        blockNumberKey();
      }
      stages.hintCounter--;
    }else{

    }
  }

  hintActionTapped(){
    SequencesApp.of(view.currentContext()).presenter.playCoBell();
    if(keys.hintState == HintState.ready){
      keys.structurizeKeyAction(KeyboardAction.hint);
    }else if(keys.hintState == HintState.failed){
      String desc = "S∈Q riddle\n\nThe Sequence is : "+seq.sequence.question;
      
      desc+="\n\nHelp me to solve this riddle and find many interesting sequence riddles waiting to solve.";
      view.goToShareToYourFriend(
        desc: desc
      );
    }else if(keys.hintState == HintState.loading){
      CommonUtils.instance.showToast(view.currentContext(),
        msg: "Preparing ads to unlock hint"
      );
    }
  }
}