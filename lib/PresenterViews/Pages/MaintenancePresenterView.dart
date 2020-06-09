import 'package:flutter/widgets.dart';
import 'package:navigatorium/navigatorium.dart';
import 'package:sequences/PresenterViews/Base/BasePresenterView.dart';
import 'package:sequences/Views/Pages/LandingPage.dart';

class MaintenancePresenterView implements BasePresenterView{
  @override
  BuildContext currentContext() {
    throw UnimplementedError();
  }

  @override
  void updateState(callback) {
  }

  void backtoLandingPage(){
    Navigatorium.instance.newRoute(
      currentContext(), 
      child: LandingPage()
    );
  }

}