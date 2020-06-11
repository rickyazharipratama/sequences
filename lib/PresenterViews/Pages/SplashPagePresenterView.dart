
import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:navigatorium/navigatorium.dart';
import 'package:sequences/PresenterViews/Base/BasePresenterView.dart';
import 'package:sequences/Utils/Collections/EnumCollections.dart';
import 'package:sequences/Views/Pages/LandingPage.dart';

class SplashPagePresenterView implements BasePresenterView{

  
  PageStatus state = PageStatus.initiating;

  @override
  BuildContext currentContext() {
    throw UnimplementedError();
  }

  @override
  void updateState(callback) {
  }

  loadingSplash(VoidCallback callback){
    Timer(
      Duration(milliseconds: 700),
      (){
        callback();
      }
    );
  }

  makeReadyState(){
  }

  makeStateReady(){
    state = PageStatus.ready;
  }

  goToLandingPage(){
    Timer(
      Duration(milliseconds: 500),
      (){
        Navigatorium.instance.newRoute(currentContext(), child: LandingPage());
      }
    );
  }

}