import 'package:flutter/material.dart';
import 'package:sequences/PresenterViews/Widgets/SecondaryButtonWithLoadingPresenterView.dart';
import 'package:sequences/Utils/Collections/EnumCollections.dart';
import 'package:sequences/Views/Components/SecondaryButton.dart';
import 'package:sequences/Views/Components/SecondaryLoadingButton.dart';

class SecondaryButtonWithLoading extends StatefulWidget {

  final dynamic callback;
  final String title;
  final Color color;

  SecondaryButtonWithLoading({@required this.callback, @required this.title, @required this.color});

  @override
  _SecondaryButtonWithLoadingState createState() => new _SecondaryButtonWithLoadingState();
}

class _SecondaryButtonWithLoadingState extends State<SecondaryButtonWithLoading> with SecondaryButtonWithLoadingPresenterView {

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: SecondaryButton(
        text: widget.title,
        color: widget.color,
        callback: () async{
          startLoading();
          print("starting loading");
          await hookCallback();
          print("finishin loading");
          makeReady();
        },
      ),
      secondChild: SecondaryLoadingButton(
        color: widget.color
      ), 
      crossFadeState: state == PageStatus.loading ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      duration: Duration(
        microseconds: 500
      )
    );
  }

  Future<void> hookCallback() async{
    await widget.callback();
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
}