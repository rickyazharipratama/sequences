import 'dart:io';

import 'package:in_app_update/in_app_update.dart';
import 'package:sequences/PresenterViews/Pages/SplashPagePresenterView.dart';
import 'package:sequences/Presenters/Base/BasePresenter.dart';
import 'package:sequences/Utils/Collections/SharedPreferencesConstantCollection.dart';
import 'package:sequences/Utils/Helpers/SharedPreferenceHelper.dart';

class SplashPagePresenter extends BasePresenter{

  final SplashPagePresenterView view;
  SplashPagePresenter({this.view});

  AppUpdateInfo updateInfo;

  @override
  void initiateData() {
    super.initiateData();
    view.updateState(() {
      view.makeReadyState();
      view.loadingSplash(() {
        checkMaintenance(view.currentContext());
        view.goToLandingPage();
      });
    });
  }
  
  checkForUpdate() async{
      if(Platform.isAndroid){
        updateInfo = await InAppUpdate.checkForUpdate();
        if(updateInfo != null){
          if(updateInfo.updateAvailable){
            if(updateInfo.immediateUpdateAllowed){
              await InAppUpdate.performImmediateUpdate();
            }else if(updateInfo.flexibleUpdateAllowed){
              (await SharedPreferenceHelper.instance.pref()).setBool(SharedPreferencesConstantCollection.instance.isFlexibleUpdate, true);
              await InAppUpdate.startFlexibleUpdate();
            }else{
              view.goToLandingPage();
            }
          }
        }else{
          view.goToLandingPage();
        }
      }else{
        view.goToLandingPage();
      }
  }

}