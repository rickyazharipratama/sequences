import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:navigatorium/navigatorium.dart';
import 'package:sequences/Utils/Collections/DefaultConstantCollection.dart';
import 'package:sequences/Utils/CommonUtils.dart';
import 'package:sequences/Utils/Helpers/AnalyticHelper.dart';
import 'package:sequences/Views/Pages/Maintenance.dart';
import 'package:sequences/Views/SequencesApp.dart';

abstract class BasePresenter{

  RemoteConfig rc;

  void initiateData() async{
  }
  void destroyObject(){}
  void sendCurrentScreen(String event){
    AnalyticHelper.of.setScreen(screen: event);
  }
  void sendAnalyticEvent({String name, Map<String,dynamic> params}){
    AnalyticHelper.of.sendEvent(
      event: name,
      params: params
    );
  }


  void checkMaintenance(BuildContext context){
    bool isMaintenance = false;
    print("is it maintenance?");
    if(rc != null){
      isMaintenance = rc.getBool(DefaultConstantCollection.instance.isMaintenance);
      print("it is in Maintenance Mode");
      if(isMaintenance){
        Navigatorium.instance.newRoute(context, 
          child: Maintenance()
        );
      }
    }
  }
}