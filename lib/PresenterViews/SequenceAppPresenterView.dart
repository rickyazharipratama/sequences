
import 'package:flutter/material.dart';
import 'package:sequences/PresenterViews/Base/BasePresenterView.dart';
import 'package:sequences/Utils/Collections/EnumCollections.dart';
import 'package:sequences/Utils/ThemeUtil.dart';
import 'package:sequences/Views/Pages/LandingPage.dart';

class SequenceAppPresenterView implements BasePresenterView{
  
  PageStatus state = PageStatus.initiating;

  @override
  BuildContext currentContext() {
    return null;
  }

  @override
  void updateState(VoidCallback callback) {}


  Widget mainWidget(bool isDarkTheme){
    print("using d.theme => "+isDarkTheme.toString());
    if(state == PageStatus.ready){
      return MaterialApp(
        home: LandingPage(),
        theme: isDarkTheme ? ThemeUtil.instance.darkTheme : ThemeUtil.instance.lightTheme,
      );
    }
    return Container();
  }

  void makeStateReady(){
    state = PageStatus.ready;
  }
}