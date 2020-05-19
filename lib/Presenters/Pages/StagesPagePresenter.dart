import 'dart:async';

import 'package:sequences/Models/SequenceModel.dart';
import 'package:sequences/Models/UserStageModel.dart';
import 'package:sequences/PresenterViews/Pages/StagesPagePresenterView.dart';
import 'package:sequences/Presenters/Base/BasePresenter.dart';
import 'package:sequences/Utils/Collections/EnumCollections.dart';

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

  StagesPagePresenter({this.view});

  UserStageModel stages;
  SequenceModel sequence;


  @override
  void initiateData() async{
    super.initiateData();
    stages =  UserStageModel()..retrieveCurrentStage();
    if(stages.currentStage < 0){
      stages.currentStage = 1;
      await stages.saveToStore();
    }
    sequence = SequenceModel();
    await getQuestion();
    answerStream.listen(onReceiveAnswerListener);
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
      // stages.currentStage++;
      // await stages.saveToStore();
      await view.goToCorrectAnswer();
      await getQuestion();
    }else{
      //wrong answer
      shakerSinker.add(true);
    }
  }

  getQuestion() async{
    await sequence.sequencesWithStage(stages.currentStage);
    sequenceSinker.add(sequence.question);
  }
}