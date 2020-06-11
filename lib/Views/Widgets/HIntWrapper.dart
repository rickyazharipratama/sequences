import 'package:flutter/material.dart';
import 'package:sequences/Models/RX/QuestionRxModel.dart';
import 'package:sequences/Utils/CommonUtils.dart';
import 'package:sequences/Views/Components/ImageButton.dart';
import 'package:sequences/Views/Components/LineSeparator.dart';
import 'package:sequences/Views/Components/SecondaryButton.dart';
import 'package:sequences/Views/Widgets/SecondaryButtonWithLoading.dart';

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
                      color: Theme.of(context).focusColor,
                      fontWeightDelta: 3
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

          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10
            ),
            child: Text(
              hintSource.sequence.firstHint,
              textAlign: TextAlign.left,
              style: Theme.of(context).primaryTextTheme.bodyText2.apply(
                color: Theme.of(context).focusColor
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(
              top: 10
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10
            ),
            child: Text(
              (hintWrap < 3 ? hintSource.sequence.removeKeyCount.toString()+" number keys on keyboard has been disabled" : "???"),
              textAlign: TextAlign.left,
              style: Theme.of(context).primaryTextTheme.bodyText2.apply(
                color: Theme.of(context).focusColor
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(
              top: 10
            ),
          ),

          
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10
            ),
            child: Text(
              (hintWrap < 2 ? "Formula: "+ hintSource.sequence.formula : "???"),
              textAlign: TextAlign.left,
              style: Theme.of(context).primaryTextTheme.bodyText2.apply(
                color: Theme.of(context).focusColor
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 15,
            ),
            child: LineSeparator(),
          ),

          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 0,
            ),
            child: Text(
              "Need more help?",
              style: Theme.of(context).primaryTextTheme.bodyText1.apply(
                fontWeightDelta: 1,
                color: Theme.of(context).focusColor
              ),
            ),
          ),
          
          Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Text(
              "Share to your friends and get more help to solve this level.",
              style: Theme.of(context).primaryTextTheme.bodyText2.apply(
                color: Theme.of(context).focusColor
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 0,
            ),
            child: SecondaryButtonWithLoading(
              callback: () async{
                //should be generate dynamic link
                print("clicked");
                String desc = "The Sequence is : "+hintSource.sequence.question+"\n\nFirst hint : "+hintSource.sequence.firstHint;
                if(hintWrap < 2)
                  desc+="\n\nFormula : "+hintSource.sequence.formula;
      
                await CommonUtils.instance.shareHelptoOthers(context,
                  link: await CommonUtils.instance.generateHelpDynamicLink(),
                  subject: "Can you solve it!",
                  desc: desc
                );
              }, 
              title: "Share it", 
              color: Theme.of(context).focusColor
            )
          )
        ],
      ),
    );
  }
}