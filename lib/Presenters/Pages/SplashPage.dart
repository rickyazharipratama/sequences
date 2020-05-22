import 'package:flutter/material.dart';
import 'package:sequences/Views/Pages/BasePage.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => new _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return BasePage(
      child: Center(
        child: Image.asset(
          "assets/images/coret-logo.png"
        ),
      ),
    );
  }
}