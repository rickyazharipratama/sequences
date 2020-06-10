import 'dart:io';

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sequences/Utils/Collections/DefaultConstantCollection.dart';
import 'package:sequences/Utils/Collections/EnumCollections.dart';
import 'package:share/share.dart';
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
      if(mainMenuCallback != null){
        mainMenuCallback();
      }
      Navigator.of(context).pop(0);
    }else if(choice == SettingList.privacyPolicy){
      //should direct in to browser
    }
  }

  Future<RemoteConfig> initiateRemoteConfig() async{
     RemoteConfig rc = await RemoteConfig.instance;

     try{
       await rc.fetch(
         expiration: Duration(
           minutes: 5
         )
       );
       await rc.activateFetched();
     }catch(exception){
       print("error remote Config : "+ exception.toString());
     }
     return rc;
  }

  Future<Uri> generateHelpDynamicLink() async{
    DynamicLinkParameters params = DynamicLinkParameters(
      uriPrefix: DefaultConstantCollection.instance.prefixDynamicLink,
      link: Uri.parse(DefaultConstantCollection.instance.prefixDynamicLink),
      androidParameters: AndroidParameters(
        packageName: "std.coret.sequences",
        minimumVersion: 16,
      ),
      googleAnalyticsParameters: GoogleAnalyticsParameters(
        campaign: "Collaboration",
        medium: "Apps",
        source: "user"),
      iosParameters: IosParameters(
        bundleId: "std.coret.sequences",
        minimumVersion: "1.0.0"
      ),
      socialMetaTagParameters: SocialMetaTagParameters(
        imageUrl: await getIconUrlFromFirebaseStorage(),
        title: "Can you solve it!",
        description: "Help me to solve this riddle and find many interesting sequence riddles waiting to solve."
      )
    );
    Uri result;
    try{
      ShortDynamicLink shortLink = await params.buildShortLink();
      result = shortLink.shortUrl;
    }catch(exception){
      result = await params.buildUrl();
      print(exception.toString());
    }
    return result;
  }

  shareHelptoOthers(BuildContext context,{String subject, Uri link,String desc}){
    String dsc = desc+"\n\n"+link.toString();
    RenderBox box = context.findRenderObject();
    Share.share(
      dsc,
      subject: link.toString(),
      sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size,
    );
  }

  Future<Uri> getIconUrlFromFirebaseStorage() async{
    StorageReference ref =  FirebaseStorage.instance.ref().child("ic_launcher_sequence.png");
    print("icon name : "+ await ref.getName());
    print("url name : "+ (await ref.getDownloadURL()).toString());
    return null;
  }
}