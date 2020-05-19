import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sequences/PresenterViews/Components/SwitcherActionPresenterView.dart';
import 'package:sequences/Presenters/Components/SwitcherActionPresenter.dart';

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
    presenter = SwitcherActionPresenter(view: this, sinker: widget.sinker)
    ..initiateData()
    ..isVal = widget.firstValue;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
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
            child: Switch(
              value: presenter.isVal == null ? false : presenter.isVal, 
              onChanged: presenter.onChangeSwitcher
            ),
          )
        ],
    );
  }
}