import 'package:flutter/material.dart';
import 'package:sequences/PresenterViews/Components/TapToStartPresenterView.dart';

class TapToStart extends StatefulWidget {

  final String text;
  final Color color;

  TapToStart({@required this.text, this.color});

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
          widget.text,
          style: widget.color == null ? Theme.of(context).primaryTextTheme.subtitle1
           : Theme.of(context).primaryTextTheme.subtitle1.apply(
             color: widget.color
           ),
          maxLines: 1,
        ),
      ),
    );
  }

  @override
  void dispose() {
    animController.dispose();
    super.dispose();
  }

}