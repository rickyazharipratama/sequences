import 'package:flutter/material.dart';
import 'package:sequences/PresenterViews/Widgets/ThirdPartyLicensePresenterView.dart';

class ThirdPartyLicense extends StatefulWidget {

  final VoidCallback action;
  final double offset;

  ThirdPartyLicense({@required this.action, @required this.offset});

  @override
  _ThirdPartyLicenseState createState() => new _ThirdPartyLicenseState();
}

class _ThirdPartyLicenseState extends State<ThirdPartyLicense> with ThirdPartyLicensePresenterView, SingleTickerProviderStateMixin{

  @override
  void initState() {
    super.initState();
    initiateAnimation(this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      alignment: Alignment(0, -widget.offset.abs()),
      child: Stack(
        children: <Widget>[

          Positioned(
            left: 0,
            right: 0,
            top: MediaQuery.of(context).padding.top + 5,
            child: Center(
              child: GestureDetector(
                onTap: widget.action,
                child: SizedBox(
                  height: 50,
                  width: 100,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 10 * anim.value
                    ),
                    child: Icon(
                      Icons.expand_less,
                      color: Theme.of(context).brightness == Brightness.dark ? Theme.of(context).focusColor : Theme.of(context).primaryTextTheme.bodyText1.color,
                      size: 30,
                    ),
                  )
                ),
              ),
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

  @override
  void dispose() {
    animController.dispose();
    super.dispose();
  }
}