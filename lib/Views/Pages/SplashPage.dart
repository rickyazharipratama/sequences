import 'package:flutter/material.dart';
import 'package:sequences/PresenterViews/Pages/SplashPagePresenterView.dart';
import 'package:sequences/Presenters/Pages/SplashPagePresenter.dart';
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
      child: Center(
        child: Image.asset(
          "assets/images/coret-logo.png",
          height: 75,
          fit: BoxFit.fitHeight,
          alignment: Alignment.center,
        ),
      ),
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