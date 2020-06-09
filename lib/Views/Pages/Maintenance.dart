import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:sequences/PresenterViews/Pages/MaintenancePresenterView.dart';
import 'package:sequences/Presenters/Pages/MaintenancePresenter.dart';
import 'package:sequences/Views/Pages/BasePage.dart';

class Maintenance extends StatefulWidget {
  @override
  _MaintenanceState createState() => new _MaintenanceState();
}

class _MaintenanceState extends State<Maintenance> with MaintenancePresenterView{

  MaintenancePresenter presenter;

  @override
  void initState() {
    super.initState();
    presenter = MaintenancePresenter(view: this);
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      child: Stack(
        children: <Widget>[

          Positioned.fill(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[

                  Center(
                    child: Image.asset(
                      "assets/images/maintenance.png",
                      width: MediaQuery.of(context).size.width / 2,
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.center,
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 30, 20, 10),
                    child: Text(
                      "New Feature(s) is OTW!",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).primaryTextTheme.bodyText1.apply(
                        fontWeightDelta: 7
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 5, 20, 10),
                    child: Text(
                      "We are currently improving feature's quality and enhance with some cool stuff, we'll be back up shortly.",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).primaryTextTheme.bodyText2,
                    ),
                  )
                ],
              ),
            ),
          ),

          Positioned(
            bottom: MediaQuery.of(context).padding.bottom + 10,
            left: 0,
            right: 0,
            child: Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: LoadingIndicator(
                  indicatorType: Indicator.pacman,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}