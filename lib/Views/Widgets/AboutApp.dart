import 'package:flutter/material.dart';
import 'package:sequences/PresenterViews/Widgets/AboutAppPresenterView.dart';
import 'package:sequences/Utils/Collections/DefaultConstantCollection.dart';

class AboutApp extends StatefulWidget {

  final double offset;
  final VoidCallback action;

  AboutApp({@required this.action, @required this. offset});

  @override
  _AboutAppState createState() => new _AboutAppState();
}

class _AboutAppState extends State<AboutApp> with AboutAppPresenterView, SingleTickerProviderStateMixin{
  
  @override
  void initState() {
    super.initState();
    initiateAnimation(this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Theme.of(context).primaryColor,
      alignment: Alignment(0, -widget.offset.abs()),
      child: Stack(
        children: <Widget>[

          Positioned.fill(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[

                  Center(
                    child: Image.asset(
                      "assets/images/logo-light.png",
                      color: Theme.of(context).focusColor,
                      alignment: Alignment.center,
                      height: DefaultConstantCollection.instance.defaultHeightLogo,
                      fit: BoxFit.fitHeight,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10
                    ),
                    child: Center(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: "V "+DefaultConstantCollection.instance.version,
                          style: Theme.of(context).primaryTextTheme.bodyText2.apply(
                            color: Theme.of(context).focusColor,
                            fontWeightDelta: 2
                          )
                        ),
                      ),
                    ),
                  )
                ],
              )
            )
          ),

          Positioned(
            left: 0,
            right: 0,
            bottom: MediaQuery.of(context).padding.bottom + 50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                
                Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: "made with love by",
                      style: Theme.of(context).primaryTextTheme.bodyText2.apply(
                        color: Theme.of(context).focusColor,
                        fontWeightDelta: 1
                      )
                    ),
                  ),
                ),


                Padding(
                  padding: EdgeInsets.only(
                    top: 10
                  ),
                  child: Center(
                    child: Image.asset(
                      "assets/images/coret-logo.png",
                      width: 85,
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.center,
                      color: Theme.of(context).focusColor
                    ),
                  ),
                )
              ],
            ),
          ),

          Positioned(
            left: 0,
            right: 0,
            bottom: MediaQuery.of(context).padding.bottom + 5,
            child: Center(
              child: GestureDetector(
                onTap: widget.action,
                child: SizedBox(
                  height: 50,
                  width: 100,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 10 * anim.value
                    ),
                    child: Icon(
                      Icons.expand_more,
                      color: Theme.of(context).focusColor,
                      size: 30,
                    ),
                  )
                ),
              ),
            ),
          )
        ],
      ),
    );
  }


  @override
  BuildContext currentContext() => context;

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