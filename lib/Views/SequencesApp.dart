import 'package:flutter/material.dart';
import 'package:sequences/PresenterViews/SequenceAppPresenterView.dart';
import 'package:sequences/Presenters/SequenceAppPresenter.dart';

class SequencesApp extends StatefulWidget {

  final String language;

  SequencesApp({this.language});

  @override
  _SequencesAppState createState() => new _SequencesAppState();
}

class _SequencesAppState extends State<SequencesApp> with SequenceAppPresenterView{


  SequenceAppPresenter presenter;

  @override
  void initState() {
    super.initState();
    presenter = SequenceAppPresenter(view: this);
  }

  @override
  Widget build(BuildContext context) {
    return mainWidget(presenter.isUsedDarkTheme);
  }

  @override
  BuildContext currentContext() => context;
  
  @override
  void updateState(VoidCallback callback) {
    super.updateState(callback);
    setState(() {
      callback();
    });
  }
}