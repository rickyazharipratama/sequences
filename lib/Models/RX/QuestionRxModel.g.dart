// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'QuestionRxModel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$QuestionRxModel on _QuestionRxModel, Store {
  final _$sequenceAtom = Atom(name: '_QuestionRxModel.sequence');

  @override
  SequenceModel get sequence {
    _$sequenceAtom.reportRead();
    return super.sequence;
  }

  @override
  set sequence(SequenceModel value) {
    _$sequenceAtom.reportWrite(value, super.sequence, () {
      super.sequence = value;
    });
  }

  final _$generateQuestionAsyncAction =
      AsyncAction('_QuestionRxModel.generateQuestion');

  @override
  Future<void> generateQuestion(int stage) {
    return _$generateQuestionAsyncAction
        .run(() => super.generateQuestion(stage));
  }

  @override
  String toString() {
    return '''
sequence: ${sequence}
    ''';
  }
}
