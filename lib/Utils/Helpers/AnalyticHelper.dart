import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticHelper{
  static AnalyticHelper of = AnalyticHelper();

  FirebaseAnalytics _anal;
  AnalyticHelper(){
    _anal = FirebaseAnalytics();
  }

  Future<void> sendEvent({
    String event,
    Map<String,dynamic> params
  }) async{
    await _anal.logEvent(
      name: event,
      parameters: params
    );
  }

  Future<void> setScreen({
    String screen
  }) async{
    await _anal.setCurrentScreen(screenName: screen);
  }
}