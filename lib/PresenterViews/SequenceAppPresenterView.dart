
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sequences/PresenterViews/Base/BasePresenterView.dart';
import 'package:sequences/Utils/Collections/EnumCollections.dart';
import 'package:sequences/Utils/CommonUtils.dart';
import 'package:sequences/Utils/ThemeUtil.dart';
import 'package:sequences/Views/Pages/SplashPage.dart';

class SequenceAppPresenterView implements BasePresenterView{
  
  PageStatus state = PageStatus.initiating;

  @override
  BuildContext currentContext() {
    return null;
  }

  @override
  void updateState(VoidCallback callback) {}


  Widget mainWidget(bool isDarkTheme){
    CommonUtils.instance.preferablePortraitMode();
    setStatusAndNavigation(isDarkTheme);
    print("using d.theme => "+isDarkTheme.toString());
    if(state == PageStatus.ready){
      return MaterialApp(
        home: SplashPage(),
        theme: isDarkTheme ? ThemeUtil.instance.darkTheme : ThemeUtil.instance.lightTheme,
      );
    }
    return Container();
  }

  void makeStateReady(){
    state = PageStatus.ready;
  }

  setStatusAndNavigation(bool darkTheme){
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarBrightness: darkTheme ? Brightness.dark : Brightness.light,
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: darkTheme ? Brightness.light : Brightness.dark,
        systemNavigationBarColor: darkTheme ? 
          ThemeUtil.instance.darkTheme.backgroundColor
          : ThemeUtil.instance.lightTheme.backgroundColor,
        systemNavigationBarIconBrightness: darkTheme ? Brightness.light : Brightness.dark
      )
    );
  }
}