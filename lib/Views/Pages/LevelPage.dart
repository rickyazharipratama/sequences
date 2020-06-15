import 'package:flutter/material.dart';
import 'package:sequences/PresenterViews/Pages/LevelPagePresenterView.dart';
import 'package:sequences/Presenters/Pages/LevelPagePresenter.dart';
import 'package:sequences/Utils/Collections/DefaultConstantCollection.dart';
import 'package:sequences/Utils/Collections/EnumCollections.dart';
import 'package:sequences/Utils/CommonUtils.dart';
import 'package:sequences/Views/Components/ImageButton.dart';
import 'package:sequences/Views/Components/Level.dart';
import 'package:sequences/Views/Pages/BasePage.dart';
import 'package:sequences/Views/Widgets/Settings.dart';

class LevelPage extends StatefulWidget {
  @override
  _LevelPageState createState() => new _LevelPageState();
}

class _LevelPageState extends State<LevelPage> with LevelPagePresenterView{

  LevelPagePresenter presenter;

  @override
  void initState() {
    super.initState();
    presenter = LevelPagePresenter(view: this)
    ..initiateData();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        Navigator.of(context).pop(0);
        return true;
      },
      child: BasePage(
        child: Column(
          children: <Widget>[
            // header base
            Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child:  Container(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).padding.top + 5,
                      right: 10,
                    ),
                    child: ImageButton(
                      callback: () async{
                        CommonUtils.instance.showLog("show setting dialog");
                        SettingList res = await showModalBottomSheet(
                          context: context, 
                          builder: (context) => Settings(
                            isNeedMainMenu: true,
                          ));
                        CommonUtils.instance.settingPopChoice(context,choice: res);
                      },
                      image: "assets/images/gear.png",
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child : ListView(
                children: List.generate((DefaultConstantCollection.instance.totalStage / 5).ceil(), (index){
                  int start = index * 5;
                  int end = start + 5;
                  if(end > DefaultConstantCollection.instance.totalStage){
                    end =  DefaultConstantCollection.instance.totalStage;
                  }
                  int diff = end - start;
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 20
                    ),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
                       children: List.generate(diff, (index){
                         int part = start + index + 1;
                         CommonUtils.instance.showLog("part : "+part.toString()+", current stage: "+presenter.stages.currentStage.toString());
                         return Level(
                           label: "Level "+(part).toString(),
                           openState: presenter.stages.currentStage  == part?
                            LevelIconSimbol.current
                            : presenter.stages.currentStage > part ?
                              LevelIconSimbol.open
                              : LevelIconSimbol.closed,
                           callback: (){
                              if(presenter.stages.currentStage + 1 >= part){
                                Navigator.of(context).pop(part + 1);
                              }
                           },
                         );
                         //locked section
                       }).toList()
                     ),
                  );
                }).toList(),
              )
            )
          ],
        )
      ),
    );
  }

  @override
  BuildContext currentContext() {
    return context;
  }

  @override
  void updateState(callback) {
    super.updateState(callback);
    setState(callback);
  }


}