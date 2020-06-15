import 'package:flutter/material.dart';
import 'package:sequences/PresenterViews/Pages/AboutPagePresenterView.dart';
import 'package:sequences/Views/Components/ImageButton.dart';
import 'package:sequences/Views/Pages/BasePage.dart';
import 'package:sequences/Views/Widgets/AboutApp.dart';
import 'package:sequences/Views/Widgets/ThirdPartyLicense.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => new _AboutPageState();
}

class _AboutPageState extends State<AboutPage> with AboutPagePresenterView{


  @override
  void initState() {
    super.initState();
    initiateController();
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: PageView(
              controller: pageController,
              onPageChanged: onPageChanged,
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                AboutApp(
                  action: goTothirdLicense,
                  offset: pageOffset,
                ),
                ThirdPartyLicense(
                  action: goToAboutPage,
                  offset: pageOffset - 1,
                )
              ],
            )
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 5,
            right: 10,
            child: ImageButton(
              image: "assets/images/close.png",
              callback: () async{
                Navigator.of(context, rootNavigator: true).pop();
              },
              color: Theme.of(context).brightness ==  Brightness.dark ?
                Theme.of(context).focusColor 
                :  Color.lerp(Theme.of(context).focusColor, Theme.of(context).primaryTextTheme.bodyText1.color, pageOffset),
              size: 25,
            ),
          )
        ],
      ),
    );
  }

  @override
  void updateState(callback) {
    super.updateState(callback);
    setState(callback);
  }

  @override
  BuildContext currentContext() => context;
}