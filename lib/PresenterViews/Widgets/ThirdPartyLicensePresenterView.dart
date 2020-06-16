import 'package:flutter/material.dart';
import 'package:sequences/PresenterViews/Base/BasePresenterView.dart';

class ThirdPartyLicensePresenterView implements BasePresenterView{

  AnimationController animController;
  Animation anim;

  GlobalKey flutterKey = GlobalKey();
  GlobalKey sharedPreferencePluginKey = GlobalKey();
  GlobalKey navigatoriumKey = GlobalKey();
  GlobalKey inAppUpdateKey = GlobalKey();
  GlobalKey firebaseAnalyticKey = GlobalKey();
  GlobalKey firebaseRemoteConfigKey = GlobalKey();
  GlobalKey firebaseCrashlyticKey = GlobalKey();
  GlobalKey firebaseDynamicLinkKey = GlobalKey();
  GlobalKey firebaseStorageKey = GlobalKey();
  GlobalKey firebasePerformanceKey = GlobalKey();
  GlobalKey flutterMobxKey = GlobalKey();
  GlobalKey admobFlutterKey = GlobalKey();
  GlobalKey toastKey = GlobalKey();
  GlobalKey loadingIndicatorKey = GlobalKey();
  GlobalKey audioPlayersKey = GlobalKey();
  GlobalKey shareKey = GlobalKey();
  GlobalKey flutterWebviewPluginKey = GlobalKey();
  GlobalKey dioKey = GlobalKey();
  GlobalKey urlLauncherKey = GlobalKey();

  ScrollController scrollController;
  bool isBackToTheTopActive = false;

  initiateScroll(){
    scrollController = ScrollController()
    ..addListener(() {
      if(scrollController.offset > MediaQuery.of(currentContext()).size.height){
        if(!isBackToTheTopActive){
          updateState(() { 
            isBackToTheTopActive = true;
          });
        }
      }else{
        if(isBackToTheTopActive){
          updateState(() {
            isBackToTheTopActive = false;
          });
        }
      }
     });
  }

  goToWidget(double scroll) async{
    scrollController.animateTo(
      scroll, 
      duration: Duration(milliseconds: 500), 
      curve: Curves.ease
    );
  }

  initiateAnimation(SingleTickerProviderStateMixin ticker){
    animController = AnimationController(
      vsync: ticker,
      duration: Duration(milliseconds: 300)
    );
    anim = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      curve: Curves.easeIn,
      parent: animController
    ))..addListener(() {
      updateState(() { });
    })..addStatusListener((status) {
      if(status == AnimationStatus.completed){
        animController.reverse();
      }else if(status == AnimationStatus.dismissed){
        animController.forward();
      }
    });
    animController.forward();
  }
  
  @override
  BuildContext currentContext() {
    throw UnimplementedError();
  }

  @override
  void updateState(callback) {
  }
}