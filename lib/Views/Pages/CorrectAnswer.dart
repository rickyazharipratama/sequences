import 'package:flutter/material.dart';
import 'package:sequences/PresenterViews/Pages/CorrectAnswerPresenterView.dart';

class CorrectAnswer extends StatefulWidget {
  @override
  _CorrectAnswerState createState() => new _CorrectAnswerState();
}

class _CorrectAnswerState extends State<CorrectAnswer> with CorrectAnswerPresenterView, SingleTickerProviderStateMixin{


  @override
  void initState() {
    super.initState();
    initiateAnimation(this);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            color: Theme.of(context).primaryColor,
            height: (MediaQuery.of(context).size.height / 2) * anim.value,
            width: MediaQuery.of(context).size.width,
          ),
        ),

        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            color: Theme.of(context).primaryColor,
            height: ( MediaQuery.of(context).size.height / 2 ) * anim.value,
            width: MediaQuery.of(context).size.width,
          ),
        ),

        Positioned.fill(
          child: AnimatedCrossFade(
            crossFadeState: isTransitionReady ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            duration: Duration(milliseconds: 300),
            firstChild: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                    Image.asset(
                      "assets/images/check.png",
                      color: Theme.of(context).focusColor,
                      width: 75,
                      height: 75,
                      fit: BoxFit.contain,
                      alignment: Alignment.center,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 15
                      ),
                      child: Text(
                        "Correct!",
                        maxLines: 1,
                        style: Theme.of(context).primaryTextTheme.button.apply(
                          fontSizeDelta: 16,
                        ),
                      ),
                    )
                ],
              ),
            ),
            secondChild: Container(),
          )
        )
      ],
    );
  }


  @override
  BuildContext currentContext() => context;

  @override
  void updateState(callback){
    super.updateState(callback);
    setState(callback);
  }
}