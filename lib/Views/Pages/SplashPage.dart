import 'dart:async';

import 'package:flutter/material.dart';
import 'package:navigatorium/navigatorium.dart';
import 'package:sequences/Views/Pages/BasePage.dart';
import 'package:sequences/Views/Pages/LandingPage.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => new _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    loadingSplash();
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


  loadingSplash(){
    Timer(Duration(milliseconds: 700), (){
        Navigatorium.instance.newRoute(context, child: LandingPage());
    });
  }
}