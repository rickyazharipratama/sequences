import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:navigatorium/navigatorium.dart';
import 'package:sequences/Utils/Collections/DefaultConstantCollection.dart';
import 'package:sequences/Utils/Collections/EnumCollections.dart';
import 'package:sequences/Views/Pages/CreditsPage.dart';
import 'package:toast/toast.dart';

class CommonUtils{

  static CommonUtils instance = new CommonUtils();


  double getKeyboardSizeHeight(BuildContext context){
    return (MediaQuery.of(context).size.width / 5) * .75;
  }

  double getIconKeyboardSize(double size){
    return (size)/ 3;
  }

  String milliSecondToTime(int millis){
    int second = millis % (60 * 1000);
    int minute = (millis / (60 * 1000)).floor();
    int hour = (minute / 60).floor();

    String strHour;
    String strMinute;
    String strSecond;

    if(hour >= 10){
      strHour = hour.toString();
    }else{
      strHour = "0"+hour.toString();
    }

    if(minute >= 10){
      strMinute = minute.toString();
    }else{
      strMinute = "0"+minute.toString();
    }

    if(second >= 10){
      strSecond = second.toString();
    }else{
      strSecond = "0"+second.toString();
    }

    return strHour+":"+strMinute+":"+strSecond;
  }

  List<String> getAdmobId(){
    if(Platform.isIOS){
      List<String> strs = List();
      strs.add(DefaultConstantCollection.instance.admobIdIOS);
      strs.add("E93ADE10-FCC0-44D0-AE46-2B3F51291F06");
      return strs;
    }else if(Platform.isAndroid){
      List<String> strs = List();
      strs.add(DefaultConstantCollection.instance.admobIdAndroid);
      return strs;
    }
    return null;
  }

  String getAdmobBannerId(){
    if(Platform.isIOS){
      if(DefaultConstantCollection.instance.environment == FlavorEnvironment.debug){
        return null;
      }
      return DefaultConstantCollection.instance.admobBannerIdIOS;
    }else if(Platform.isAndroid){
      return DefaultConstantCollection.instance.admobBannerIdAndroid;
    }
    return null;
  }

  String getAdmobRewardId(){
    if(Platform.isIOS){
      if(DefaultConstantCollection.instance.environment == FlavorEnvironment.debug){
        return null;
      }
      return DefaultConstantCollection.instance.admobRewardIOS;
    }else if(Platform.isAndroid){
      return DefaultConstantCollection.instance.admobRewardIdAndroid;
    }
    return null;
  }

  showToast(BuildContext context,{String msg}){
    Toast.show(msg, context,
      backgroundColor: Theme.of(context).dividerColor,
      backgroundRadius: 7.5,
      duration: Toast.LENGTH_LONG,
      gravity: Toast.BOTTOM,
      textColor: Theme.of(context).focusColor
    );
  }

  preferablePortraitMode(){
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp
    ]);
  }


  settingPopChoice(BuildContext context, {
    SettingList choice,
    VoidCallback mainMenuCallback
  }){
    if(choice == SettingList.mainMenu){
      mainMenuCallback();
      Navigator.of(context).pop();
    }else if(choice == SettingList.credit){
      Navigatorium.instance.pushWithNoAnimate(context, child: CreditsPage());
    }else if(choice == SettingList.privacyPolicy){
      //should direct in to browser
    }
  }
}