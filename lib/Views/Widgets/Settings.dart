import 'package:flutter/material.dart';
import 'package:navigatorium/navigatorium.dart';
import 'package:sequences/PresenterViews/Widgets/SettingsPresenterView.dart';
import 'package:sequences/Presenters/SettingsPresenter.dart';
import 'package:sequences/Utils/Collections/DefaultConstantCollection.dart';
import 'package:sequences/Utils/Collections/EnumCollections.dart';
import 'package:sequences/Views/Components/CheckBoxAction.dart';
import 'package:sequences/Views/Components/ImageButton.dart';
import 'package:sequences/Views/Components/ListButton.dart';
import 'package:sequences/Views/Components/SwitcherAction.dart';
import 'package:sequences/Views/Pages/AboutPage.dart';
import 'package:url_launcher/url_launcher.dart';

class Settings extends StatefulWidget {

  final bool isNeedMainMenu;
  Settings({this.isNeedMainMenu : false});

  @override
  _SettingsState createState() => new _SettingsState();
}

class _SettingsState extends State<Settings> with SettingsPresenterView, SingleTickerProviderStateMixin{


  SettingsPresenter presenter;

  @override
  void initState() {
    super.initState();
    presenter = SettingsPresenter(this)..initiateData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
      ),
      padding: EdgeInsets.fromLTRB(
        10,
        5,
        10,
        MediaQuery.of(context).padding.bottom+10),
      child: stateStatus == PageStatus.ready ? 
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(),
                ),
                ImageButton(
                  image: "assets/images/close.png",
                  callback: (){Navigator.of(context, rootNavigator: true).pop();},
                  color: Theme.of(context).focusColor,
                  size: 25,
                ),
              ],
            ),

            Padding(
              padding: EdgeInsets.only(top: 15),
            ),

            SwitcherAction(
              label: "Sound",
              sinker: presenter.soundStreamSink,
              firstValue: presenter.sounds.isSoundActive
            ),

            SwitcherAction(
              label: "Music",
              sinker: presenter.musicStreamSink,
              firstValue: presenter.sounds.isMusicActive,  
            ),

            CheckBoxAction(
              firstValue: presenter.config.isDarkTheme,
              label: "Using Dark Theme",
              sinker: presenter.themeSink,
            ),

            ListButton(
              callback: (){
                Navigator.of(context).pop(SettingList.privacyPolicy);
              },
              label: "Privacy Policy",
            ),

            ListButton(
              label: "Follow Us",
              callback: (){
                launch(DefaultConstantCollection.instance.instagramPageURL,
                  universalLinksOnly: true
                );
              }
            ),

            ListButton(
              callback: (){
                
                Navigatorium.instance.pushWithNoAnimate(
                  context, 
                  child: AboutPage()
                );
              },
              label: "About",
            ),
          
            widget.isNeedMainMenu?
              ListButton(
                callback: (){
                  Navigator.of(context).pop(SettingList.mainMenu);
                },
                label: "Back to Main Menu",
              )
            :Container(),
          ],
        )
      : Container()
    );
  }

  @override
  void updateState(callback) {
    super.updateState(callback);
    setState(callback);
  }

  @override
  BuildContext currentContext() {
    return context;
  }

  @override
  void dispose() {
    super.dispose();
    presenter.destroyObject();
  }
}