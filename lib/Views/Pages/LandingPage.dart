import 'package:flutter/material.dart';
import 'package:sequences/PresenterViews/Pages/LandingPagePresenterView.dart';
import 'package:sequences/Presenters/Pages/LandingPagePresenter.dart';
import 'package:sequences/Views/Components/ImageButton.dart';
import 'package:sequences/Views/Components/Logo.dart';
import 'package:sequences/Views/Pages/BasePage.dart';
import 'package:sequences/Views/Widgets/Settings.dart';

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
    return BasePage(
      child: GestureDetector(
        onTap: (){
          if(presenter != null){
            if(presenter.currentStages.currentStage >= 0  && presenter.currentStages.currentStage < 2){
              presenter.goToStage();
            }
          }
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: <Widget>[
                // Main Content
                Positioned.fill(
                  child:  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Center(
                      child: Logo(),
                    ),
                  ),
                ),
                
                Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: bottomSection(presenter.currentStages.currentStage),
                ),

                Positioned(
                  top: MediaQuery.of(context).padding.top + 5,
                  right: 10,
                  child: ImageButton(
                    callback: (){
                      print("show setting dialog");
                      showModalBottomSheet(
                        context: context, 
                        builder: (context) => Settings());
                    },
                    image: "assets/images/gear.png",
                  ),
                ),
            ],
          ),
        )
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

  @override
  void dispose(){
    super.dispose();
    presenter.destroyObject();
  }
}