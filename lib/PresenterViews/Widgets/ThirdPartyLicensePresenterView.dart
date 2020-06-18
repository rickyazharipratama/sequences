import 'package:flutter/material.dart';
import 'package:sequences/PresenterViews/Base/BasePresenterView.dart';
import 'package:sequences/Utils/CommonUtils.dart';

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
    scrollController = ScrollController(
      keepScrollOffset: true,
    )
    ..addListener(() {
      if(scrollController.offset > MediaQuery.of(currentContext()).size.height){
        if(!isBackToTheTopActive){
          updateState(() { 
            isBackToTheTopActive = true;
          });
        }
        CommonUtils.instance.showLog("flutter key : "+flutterKey.currentContext.toString());
        CommonUtils.instance.showLog("shared preference key : "+sharedPreferencePluginKey.currentContext.toString());
        CommonUtils.instance.showLog("inAppUpdate : "+inAppUpdateKey.currentContext.toString());
        CommonUtils.instance.showLog("firebase Remote key : "+firebaseRemoteConfigKey.currentContext.toString());
      }else{
        if(isBackToTheTopActive){
          updateState(() {
            isBackToTheTopActive = false;
          });
        }
      }
      CommonUtils.instance.showLog("scroll offset : "+scrollController.offset.toString());
     });
  }
  goToWidget(GlobalKey key) async{

    double currentOffset = scrollController.offset;
    bool isEndScroll = false;
    do{
      if(currentOffset < scrollController.position.maxScrollExtent){
        if(key.currentContext == null){
          currentOffset += MediaQuery.of(currentContext()).size.height;
          await scrollController.animateTo(
            currentOffset,
            duration: Duration(
              milliseconds: 200
            ), curve: Curves.linear);
        }else{
          double diff = (key.currentContext.findRenderObject() as RenderBox).localToGlobal(Offset.zero).dy * .75;
          int durs = ((diff/MediaQuery.of(currentContext()).size.height) * 200).floor();
          double offs = currentOffset + diff;
          await scrollController.animateTo(
            offs,
            duration: Duration(
              milliseconds: durs
            ), 
            curve: Curves.ease);
            isEndScroll = true;
        }
      }else{
        isEndScroll = true;
      }
    }while(!isEndScroll);
  }

  scrollToWidget(double offset) async{
    int durs = ((scrollController.offset / MediaQuery.of(currentContext()).size.height) * 200).floor();
    await scrollController.animateTo(
      offset, 
    duration: Duration(
      milliseconds: durs
    ),
    curve: Curves.ease);
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