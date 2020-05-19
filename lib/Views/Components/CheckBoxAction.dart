import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sequences/PresenterViews/Components/CheckBoxActionPresenterView.dart';
import 'package:sequences/Presenters/Components/CheckBoxActionPresenter.dart';

class CheckBoxAction extends StatefulWidget {

  final String label;
  final bool firstValue;
  final StreamSink sinker;

  CheckBoxAction({@required this.label, @required this.firstValue, @required this.sinker});

  @override
  _CheckBoxActionState createState() => new _CheckBoxActionState();
}

class _CheckBoxActionState extends State<CheckBoxAction> with CheckBoxActionPresenterView{

  CheckBoxActionPresenter presenter;

  @override
  void initState() {
    super.initState();
    presenter = CheckBoxActionPresenter(view: this, sinker: widget.sinker)
    ..setChecked = widget.firstValue
    ..initiateData();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                widget.label,
                style: Theme.of(context).primaryTextTheme.button,
              ),
            ),

            Checkbox(
              value: presenter.isChecked == null ? false :  presenter.isChecked,
              onChanged: presenter.oncheckedChange
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
  void updateState(callback) {
    super.updateState(callback);
    setState(callback);
  }
}