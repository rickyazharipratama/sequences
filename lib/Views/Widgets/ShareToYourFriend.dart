import 'package:flutter/material.dart';
import 'package:sequences/Utils/CommonUtils.dart';
import 'package:sequences/Utils/Helpers/NetworkHelper.dart';
import 'package:sequences/Views/Components/ImageButton.dart';
import 'package:sequences/Views/Widgets/SecondaryButtonWithLoading.dart';

class ShareToYourFriend extends StatelessWidget {

  final String desc;

  ShareToYourFriend({@required this.desc});

  

  @override
  Widget build(BuildContext context) {
    bool isStillActive = true;
    return Container(
      padding: EdgeInsets.fromLTRB(
        10,
        5,
        10,
        MediaQuery.of(context).padding.bottom + 15
      ),
      color: Theme.of(context).cardColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[

          Row(
            children: <Widget>[
              Expanded(
                child: Container()
              ),
              ImageButton(
                image: "assets/images/close.png",
                callback: (){
                  isStillActive = false;
                  Navigator.of(context, rootNavigator: true).pop();
                },
                color: Theme.of(context).focusColor,
                size: 25,
              ),
            ],
          ),

          Padding(
            padding: EdgeInsets.only(
              top: 15
            ),
          ),

          Center(
            child: Image.asset(
              "assets/images/seru.png",
              height: 100,
              fit: BoxFit.fitHeight,
              alignment: Alignment.center,
            ),
          ),

          Padding(
            padding: EdgeInsets.fromLTRB(
              15,
              25,
              20,
              10
            ),
            child: Center(
              child: Text(
                "Aww...",
                textAlign: TextAlign.center,
                style: Theme.of(context).primaryTextTheme.bodyText1.apply(
                  fontWeightDelta: 1,
                  color: Theme.of(context).focusColor
                ),
              ),
            )
          ),

          Padding(
            padding: EdgeInsets.fromLTRB(
              20, 
              0, 
              20,
              20
            ),
            child: Text(
              "We have some issues to unlock hint. Share to your friends and get more help to solve this level.",
              textAlign: TextAlign.center,
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
                bool isHaveGoodConnection =  await NetworkHelper.instance.checkExternalRequest();
                Uri dynamicLink = await CommonUtils.instance.generateHelpDynamicLink(
                  isGoodConnection: isHaveGoodConnection
                );
                if(dynamicLink != null){
                  if(isStillActive){
                    await CommonUtils.instance.shareHelptoOthers(context,
                      link: dynamicLink,
                      subject: "Can you solve it!",
                      desc: desc
                    );
                  }
                }
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