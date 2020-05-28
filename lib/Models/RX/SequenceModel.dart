
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';

part 'SequenceModel.g.dart';

class SequenceModel = _SequenceModel with _$SequenceModel;

abstract class _SequenceModel with Store{
  @observable
  String question="";
  int answer;
  String firstHint="";
  String formula="";
  int removeKeyCount;

  @action
  sequencesWithStage(int stage) async{

    String asset = await rootBundle.loadString("assets/stages/basic.json");
    Map<String,dynamic> seq = jsonDecode(asset)[stage.toString()];
    if(seq != null){
      question = seq["q"];
      answer = int.parse(seq["a"].toString());
      firstHint = seq["firstHint"];
      formula = seq["formula"];
      removeKeyCount = int.parse(seq["removeKeyCount"].toString());
    }
  }
}