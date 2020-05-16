import 'package:flutter/material.dart';
import 'package:sequences/PresenterViews/Components/TapToStartPresenterView.dart';

class TapToStart extends StatefulWidget {
  @override
  _TapToStartState createState() => new _TapToStartState();
}

class _TapToStartState extends State<TapToStart> with TapToStartPresenterView, SingleTickerProviderStateMixin{


  @override
  void initState() {
    super.initState();
    initiateAnimationController(this);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child:  FadeTransition(
        opacity: anim,
        child: Text(
          "Tap to play",
          style: Theme.of(context).primaryTextTheme.subtitle1,
          maxLines: 1,
        ),
      ),
    );
  }
}