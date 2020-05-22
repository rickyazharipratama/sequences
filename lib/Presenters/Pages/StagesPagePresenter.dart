import 'dart:async';

import 'package:sequences/Models/SequenceModel.dart';
import 'package:sequences/Models/UserStageModel.dart';
import 'package:sequences/PresenterViews/Pages/StagesPagePresenterView.dart';
import 'package:sequences/Presenters/Base/BasePresenter.dart';
import 'package:sequences/Utils/Collections/DefaultConstantCollection.dart';
import 'package:sequences/Utils/Collections/EnumCollections.dart';
import 'package:sequences/Utils/CommonUtils.dart';

class StagesPagePresenter extends BasePresenter{

  final StagesPagePresenterView view;

  StreamController<String> _keyNumberStream = StreamController();
  StreamController<KeyboardAction> _keyActionStream = StreamController();
  StreamController<String> _sequenceStream = StreamController();
  StreamController<String> _answerStream = StreamController();
  StreamController<bool> _shakerStream = StreamController();



  StreamSink get keyNumberSinker => _keyNumberStream.sink;
  Stream<String> get keyNumberStream => _keyNumberStream.stream;

  StreamSink get keyActionSinker => _keyActionStream.sink;
  Stream<KeyboardAction> get keyActionStream => _keyActionStream.stream;

  StreamSink<String> get sequenceSinker => _sequenceStream.sink;
  Stream<String> get sequenceStream => _sequenceStream.stream;

  StreamSink<String> get answerSinker => _answerStream.sink;
  Stream<String> get answerStream => _answerStream.stream;

  StreamSink<bool> get shakerSinker => _shakerStream.sink;
  Stream<bool> get shakerStream => _shakerStream.stream;

  final bool isContinue;
  final int fromStage;

  int duration = 0;
  int unCorrectAnswer = 0;

  StagesPagePresenter({this.view, this. isContinue, this.fromStage});

  UserStageModel stages;
  SequenceModel sequence;


  @override
  void initiateData() async{
    super.initiateData();
    stages = UserStageModel();
    if(isContinue){
      if(fromStage < 0){
        await stages.retrieveCurrentStage();
      }else{
        stages.currentStage = fromStage;
      }
    }else{
      stages.currentStage = 1;
      stages.saveToStore();
    }
    sendCurrentScreen(DefaultConstantCollection.instance.stagePage);
    sequence = SequenceModel();
    await getQuestion();
    answerStream.listen(onReceiveAnswerListener);
    duration = DateTime.now().millisecondsSinceEpoch;
  }

  @override
  void destroyObject() {
    super.destroyObject();
    _keyNumberStream.close();
    _keyActionStream.close();
    _sequenceStream.close();
    _answerStream.close();
    _shakerStream.close();
  }


  //listening answer stream
  onReceiveAnswerListener(String answer) async{
    int intAnswer = int.parse(answer);
    // compare the answer with real answer
    if(intAnswer == sequence.answer){
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
      stages.resetHintCount();
      await getQuestion();
    }else{
      //wrong answer
      unCorrectAnswer++;
      shakerSinker.add(true);
    }
  }

  getQuestion() async{
    await sequence.sequencesWithStage(stages.currentStage);
    sequenceSinker.add(sequence.question);
  }
}