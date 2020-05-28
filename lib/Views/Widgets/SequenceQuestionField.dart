import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sequences/Models/RX/QuestionRxModel.dart';
import 'package:sequences/PresenterViews/Widgets/SequenceQuestionFieldPresenterView.dart';
import 'package:sequences/Presenters/Widgets/SequenceQuestionFieldPresenter.dart';

class SequenceQuestionField extends StatefulWidget {

  final QuestionRxModel question;
  final Stream<bool> shaker;

  SequenceQuestionField({@required this.question, @required this.shaker});

  @override
  _SequenceQuestionFieldState createState() => new _SequenceQuestionFieldState();
}

class _SequenceQuestionFieldState extends State<SequenceQuestionField> with SequenceQuestionFieldPresenterView, SingleTickerProviderStateMixin{

  SequenceQuestionFieldPresenter presenter;

  @override
  void initState() {
    super.initState();
    initiateAnimation(this);
    presenter = SequenceQuestionFieldPresenter(
      view: this,
      shakerStream: widget.shaker
    )
    ..initiateData();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(
          top: 30,
          left: animatePadding > 0 ? animatePadding : 0,
          right: animatePadding < 0 ? (animatePadding * -1) : 0
        ),
        child: Observer(
          builder: (context) => Text(
            widget.question.sequence.question,
            maxLines: 1,
            style: Theme.of(context).primaryTextTheme.bodyText1,
          ), 
        )
      )
    );
  }

  @override
  BuildContext currentContext() {
    return context;
  }

  @override
  void updateState(callback) {
    super.updateState(callback);
    setState(callback);
  }

  @override
  void dispose() {
    animController.dispose();
    super.dispose();
  }
}