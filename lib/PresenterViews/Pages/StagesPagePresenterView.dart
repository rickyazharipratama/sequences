import 'dart:async';

import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:navigatorium/navigatorium.dart';
import 'package:sequences/Models/RX/QuestionRxModel.dart';
import 'package:sequences/PresenterViews/Base/BasePresenterView.dart';
import 'package:sequences/Utils/Collections/SharedPreferencesConstantCollection.dart';
import 'package:sequences/Utils/CommonUtils.dart';
import 'package:sequences/Utils/Helpers/SharedPreferenceHelper.dart';
import 'package:sequences/Views/Pages/CorrectAnswer.dart';
import 'package:sequences/Views/Pages/CreditsPage.dart';
import 'package:sequences/Views/Widgets/HIntWrapper.dart';
import 'package:sequences/Views/Widgets/ShareToYourFriend.dart';

class StagesPagePresenterView implements BasePresenterView{

  AdmobReward admobReward;

  initializeAdmob({
    ValueChanged<int> rewardCallback,
    VoidCallback onAdsOpened,
    VoidCallback onAdsClosed,
    VoidCallback onHintLoad,
    VoidCallback onHintReady,
    VoidCallback onHintLoadFailed
  }) async{

    (await SharedPreferenceHelper.instance.pref()).setInt(SharedPreferencesConstantCollection.instance.tryLoadRewardAds, 0);

    admobReward = AdmobReward(
      adUnitId: CommonUtils.instance.getAdmobRewardId(),
      listener: (AdmobAdEvent event, Map<String,dynamic> arg) async{
        print("Reward admob event : "+event.toString());
        print("Reward admob args : "+arg.toString());
        if(event == AdmobAdEvent.rewarded){
          int val = -1;
          if(arg['amount'] != null){
            print("amount : "+arg['amount'].toString());
            //val = int.parse(arg['amount'].toString());
            val = 1;
          }
          print("reward admob type : "+arg['type'].toString()+", value : "+val.toString());
          rewardCallback(val);
        }else if(event == AdmobAdEvent.closed){
          admobReward = null;
          onHintLoad();
          initializeAdmob(
            rewardCallback: rewardCallback,
            onHintLoad: onHintLoad,
            onHintLoadFailed: onHintLoadFailed,
            onHintReady: onHintReady
          );
          onAdsClosed();
        }else if(event == AdmobAdEvent.failedToLoad){
          Timer(
            Duration(
              milliseconds: 1000
            ),
            () async{
              int retry = await SharedPreferenceHelper.instance.getInt(SharedPreferencesConstantCollection.instance.tryLoadRewardAds, error: -1);
              if(retry >= 0){
                if(retry <= 3){
                  retry++;
                  (await SharedPreferenceHelper.instance.pref()).setInt(SharedPreferencesConstantCollection.instance.tryLoadRewardAds, retry);
                  admobReward.load();
                }else{
                  retry = -10;
                  onHintLoadFailed();
                }
              }
            }
          );
        }else if(event == AdmobAdEvent.loaded){
          onHintReady();
        }else if(event == AdmobAdEvent.opened){
          onAdsOpened();
        }
      }
    );
    admobReward.load();
  }

  @override
  BuildContext currentContext() {
    return null;
  }

  @override
  void updateState(callback) {
  }

  Future<bool> goToCorrectAnswer() async{
    await Navigatorium.instance.pushWithNoAnimate(
      currentContext(),
      child: CorrectAnswer()
    );
    return true;
  }

  showHint({
    QuestionRxModel source,
    int phase
  }) async{
    await showModalBottomSheet(
      context: currentContext(), 
      builder: (context){
        return HintWrapper(
          hintSource: source,
          hintWrap: phase,
        );
    });
  } 

  Future<bool> goToCreditPage({VoidCallback ext}) async{
    await Navigatorium.instance.pushWithNoAnimate(currentContext(), child: CreditsPage());
    ext();
    Navigator.of(currentContext()).pop();
    return true;
  }

  goToShareToYourFriend({
    String desc
  }){
    showModalBottomSheet(
      context: currentContext(),
      isDismissible: false,
      builder: (context) => ShareToYourFriend(
        desc: desc,
      ),
    );
  }
}