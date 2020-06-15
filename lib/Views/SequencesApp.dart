import 'package:flutter/material.dart';
import 'package:sequences/PresenterViews/SequenceAppPresenterView.dart';
import 'package:sequences/Presenters/SequenceAppPresenter.dart';
import 'package:sequences/Utils/CommonUtils.dart';

class SequencesApp extends StatefulWidget {

  final String language;

  SequencesApp({this.language});

  static _SequencesAppState of(BuildContext context) => context.findAncestorStateOfType<_SequencesAppState>();

  @override
  _SequencesAppState createState() => new _SequencesAppState();
}

class _SequencesAppState extends State<SequencesApp> with WidgetsBindingObserver,SequenceAppPresenterView{


  SequenceAppPresenter presenter;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    presenter = SequenceAppPresenter(view: this)..initiateData();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    CommonUtils.instance.showLog("app state : "+state.toString());
    if(state == AppLifecycleState.resumed){
      presenter.resumeMusicSound();
    }else if(state == AppLifecycleState.paused || state == AppLifecycleState.inactive){
      presenter.pauseMusicSound();
    }else if(state == AppLifecycleState.detached){
      presenter.stopMusicSound();
    }
  }

  @override
  Widget build(BuildContext context) {
    return mainWidget(presenter.config.isDarkTheme);
  }

  @override
  BuildContext currentContext() => context;
  
  @override
  void updateState(VoidCallback callback) {
    super.updateState(callback);
    setState(callback);
  }

  @override
  void dispose() {
    presenter.clearSound();
    super.dispose();
  }
}