// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SequenceModel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SequenceModel on _SequenceModel, Store {
  final _$questionAtom = Atom(name: '_SequenceModel.question');

  @override
  String get question {
    _$questionAtom.reportRead();
    return super.question;
  }

  @override
  set question(String value) {
    _$questionAtom.reportWrite(value, super.question, () {
      super.question = value;
    });
  }

  final _$sequencesWithStageAsyncAction =
      AsyncAction('_SequenceModel.sequencesWithStage');

  @override
  Future sequencesWithStage(int stage) {
    return _$sequencesWithStageAsyncAction
        .run(() => super.sequencesWithStage(stage));
  }

  @override
  String toString() {
    return '''
question: ${question}
    ''';
  }
}
