import 'package:sequences/Utils/Helpers/AnalyticHelper.dart';

abstract class BasePresenter{

  void initiateData(){}
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
}