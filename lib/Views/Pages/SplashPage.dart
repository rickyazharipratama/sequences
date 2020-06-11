import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:sequences/PresenterViews/Pages/SplashPagePresenterView.dart';
import 'package:sequences/Presenters/Pages/SplashPagePresenter.dart';
import 'package:sequences/Utils/Collections/EnumCollections.dart';
import 'package:sequences/Views/Pages/BasePage.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => new _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SplashPagePresenterView{

  SplashPagePresenter presenter;

  @override
  void initState() {
    super.initState();

    presenter = SplashPagePresenter(view: this)
    ..initiateData();

  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Center(
              child: Image.asset(
                "assets/images/coret-logo.png",
                height: 75,
                fit: BoxFit.fitHeight,
                alignment: Alignment.center,
              ),
            ),
          ),

          Positioned(
            bottom: MediaQuery.of(context).padding.bottom + 10,
            left: 0,
            right: 0,
            height: 100,
            child: state == PageStatus.ready ? Center(
              child: SizedBox(
                height: 75,
                width: 75,
                child: LoadingIndicator(
                  indicatorType: Indicator.pacman,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ) : Container(),
          )
        ],
      )
    );
  }

  @override
  BuildContext currentContext() => context;
  
  @override
  void updateState(callback) {
    setState(callback);
  }


  // loadingSplash(){
  //   Timer(Duration(milliseconds: 700), (){
  //       Navigatorium.instance.newRoute(context, child: LandingPage());
  //   });
  // }
}