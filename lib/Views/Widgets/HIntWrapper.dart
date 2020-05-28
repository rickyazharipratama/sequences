import 'package:flutter/material.dart';
import 'package:sequences/Models/RX/QuestionRxModel.dart';
import 'package:sequences/Views/Components/ImageButton.dart';

class HintWrapper extends StatelessWidget {

  final int hintWrap;
  final QuestionRxModel hintSource;

  HintWrapper({
    @required this.hintWrap,
    @required this.hintSource
  });

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
        MediaQuery.of(context).padding.bottom + 15
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: RichText(
                  text: TextSpan(
                    text: "Hint",
                    style: Theme.of(context).primaryTextTheme.bodyText1.apply(
                      color: Theme.of(context).focusColor
                    )
                  ),
                ),
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

          Text(
            hintSource.sequence.firstHint,
            textAlign: TextAlign.left,
            style: Theme.of(context).primaryTextTheme.bodyText2.apply(
              color: Theme.of(context).focusColor
            ),
          ),

          Padding(
            padding: EdgeInsets.only(
              top: 10
            ),
          ),

          hintWrap < 3 ?
          Text(
            hintSource.sequence.removeKeyCount.toString()+" number keys on keyboard has been disabled",
            textAlign: TextAlign.left,
            style: Theme.of(context).primaryTextTheme.bodyText2.apply(
              color: Theme.of(context).focusColor
            ),
          ) : Container(),

          Padding(
            padding: EdgeInsets.only(
              top: hintWrap < 2  ? 10 : 0
            ),
          ),

          hintWrap < 2 ?
          Text(
            "Formula: "+hintSource.sequence.formula,
            textAlign: TextAlign.left,
            style: Theme.of(context).primaryTextTheme.bodyText2.apply(
              color: Theme.of(context).focusColor
            ),
          ) : Container()

        ],
      ),
    );
  }
}