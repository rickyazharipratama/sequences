
import 'package:flutter/material.dart';
import 'package:sequences/PresenterViews/Base/BasePresenterView.dart';
import 'package:sequences/Utils/ThemeUtil.dart';
import 'package:sequences/Views/LandingPage.dart';

class SequenceAppPresenterView implements BasePresenterView{
  
  @override
  BuildContext currentContext() {
    return null;
  }

  @override
  void updateState(VoidCallback callback) {}


  Widget mainWidget(bool isDarkTheme){
    return MaterialApp(
      home: LandingPage(),
      theme: isDarkTheme ? ThemeUtil.instance.darkTheme : ThemeUtil.instance.lightTheme,
    );
  }
}