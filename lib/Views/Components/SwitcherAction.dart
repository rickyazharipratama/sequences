import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sequences/PresenterViews/Components/SwitcherActionPresenterView.dart';
import 'package:sequences/Presenters/Components/SwitcherActionPresenter.dart';
import 'package:sequences/Utils/Collections/EnumCollections.dart';
import 'package:sequences/Utils/CommonUtils.dart';

class SwitcherAction extends StatefulWidget {

  final String label;
  final StreamSink sinker;
  final bool firstValue;

  SwitcherAction({@required this.label, @required this.sinker, @required this.firstValue});

  @override
  _SwitcherActionState createState() => new _SwitcherActionState();
}

class _SwitcherActionState extends State<SwitcherAction> with SwitcherActionPresenterView{

  SwitcherActionPresenter presenter;

  @override
  void initState() {
    super.initState();
    CommonUtils.instance.showLog("switcher + "+widget.label+" is "+widget.firstValue.toString());
    presenter = SwitcherActionPresenter(view: this, sinker: widget.sinker, firstVal: widget.firstValue)
    ..initiateData();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
          onTap: (){
            if(state == PageStatus.ready){
              presenter.onChangeSwitcher(!presenter.isVal);
            }
          },
          child: Row(
          children: <Widget>[
            
            Expanded(
              child: Text(
                widget.label,
                textAlign: TextAlign.left,
                maxLines: 1,
                style: Theme.of(context).primaryTextTheme.button
              ),
            ),

            Padding(
              padding: EdgeInsets.only(
                left: 5
              ),
              child: state == PageStatus.ready ? 
                Switch(
                  value: presenter.isVal, 
                  onChanged: presenter.onChangeSwitcher,
                  activeColor: Theme.of(context).focusColor,
                  inactiveThumbColor: Theme.of(context).disabledColor,
                )
                : Container()
            )
          ],
      ),
    );
  }

  @override
  BuildContext currentContext() => context;

  @override
  void updateState(callback) {
    super.updateState(callback);
    setState(callback);
  }
}