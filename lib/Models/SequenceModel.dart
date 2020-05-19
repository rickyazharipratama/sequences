
import 'dart:convert';

import 'package:flutter/services.dart';

class SequenceModel{

  String question;
  int answer;
  String firstHint;
  String formula;
  int removeKeyCount;

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