import 'dart:async';

import 'package:sequences/PresenterViews/Pages/MaintenancePresenterView.dart';
import 'package:sequences/Presenters/Base/BasePresenter.dart';
import 'package:sequences/Utils/Collections/DefaultConstantCollection.dart';
import 'package:sequences/Utils/CommonUtils.dart';

class MaintenancePresenter extends BasePresenter{


  final MaintenancePresenterView view;

  MaintenancePresenter({this.view});

  @override
  void initiateData() {
    super.initiateData();
    sendCurrentScreen(DefaultConstantCollection.instance.maintenance);
    updateMaintenance();
  }


  updateMaintenance(){
    Timer(
      Duration(
        seconds: 5
      ),
      () async{
          rc = await CommonUtils.instance.initiateRemoteConfig();
          bool isMaintenance = true;
          print("check is Maintenance is over ?");
          if(rc != null){
            isMaintenance = rc.getBool(DefaultConstantCollection.instance.isMaintenance);
            print("maintenance is over");
            if(!isMaintenance){
              view.backtoLandingPage();
            }
          }
      }
    );
  }
}