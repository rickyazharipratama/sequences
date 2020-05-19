import 'package:flutter/material.dart';
import 'package:sequences/PresenterViews/Widgets/SequenceQuestionFieldPresenterView.dart';
import 'package:sequences/Presenters/Widgets/SequenceQuestionFieldPresenter.dart';

class SequenceQuestionField extends StatefulWidget {

  final Stream<String> streamer;
  final Stream<bool> shakerStreamer;

  SequenceQuestionField({@required this.streamer, @required this.shakerStreamer});

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
      streamer: widget.streamer,
      shakerStream: widget.shakerStreamer,
      view: this
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
        child: Text(
          presenter.value,
          maxLines: 1,
          style: Theme.of(context).primaryTextTheme.bodyText1,
        ),
      ),
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
    super.dispose();
    animController.dispose();
  }
}