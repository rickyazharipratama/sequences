import 'package:mobx/mobx.dart';
import 'package:sequences/Models/RX/SequenceModel.dart';

part 'QuestionRxModel.g.dart';


class QuestionRxModel = _QuestionRxModel with _$QuestionRxModel;

abstract class _QuestionRxModel with Store{

  @observable
  SequenceModel sequence = SequenceModel();

  @action
  Future<void> generateQuestion(int stage) async{
    await sequence.sequencesWithStage(stage);
  }
}