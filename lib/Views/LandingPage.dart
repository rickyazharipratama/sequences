import 'package:flutter/material.dart';
import 'package:sequences/PresenterViews/LandingPagePresenterView.dart';
import 'package:sequences/Presenters/LandingPagePresenter.dart';
import 'package:sequences/Views/Components/Logo.dart';
import 'package:sequences/Views/Components/SettingButton.dart';

class LandingPage extends StatefulWidget {

  @override
  _LandingPageState createState() => new _LandingPageState();
}

class _LandingPageState extends State<LandingPage> with LandingPagePresenterView{

  LandingPagePresenter presenter;

  @override
  void initState() {
    super.initState();
    presenter = LandingPagePresenter(view: this)..initiateData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: GestureDetector(
        onTap: (){},
        child: Stack(
          children: <Widget>[
              // Main Content
              Positioned.fill(
                child: Center(
                  child: Logo(),
                )
              ),
              
              Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: bottomSection(presenter.currentStages.currentStage),
              ),

              // its for setting new design
              Positioned(
                top: MediaQuery.of(context).padding.top + 5,
                right: 10,
                child: SettingButton(
                  callback: (){},
                  image: "assets/images/gear.png",
                ),
              )
          ],
        ),
      )
    );
  }


  @override
  BuildContext currentContext() {
    return context;
  }

  @override
  void updateState(VoidCallback callback){
     setState(() {
       callback();
     });
  }
}