import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PluginListItem extends StatelessWidget {

  final String title;
  final String desc;
  final String version;
  final String link;
  
  PluginListItem({@required this.title, @required this.desc, this.version, this.link});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[

        RichText(
          text: TextSpan(
            style: Theme.of(context).primaryTextTheme.bodyText1,
            text: title
          ),
        ),

        version != null ?
        Padding(
          padding: EdgeInsets.only(
            top: 3.5
          ),
          child: RichText(
            text: TextSpan(
              style: Theme.of(context).primaryTextTheme.bodyText2.apply(
                color: Theme.of(context).primaryColor,
                fontSizeDelta: -2
              ),
              text: version,
            ),
          ),
        ) : Container(),

        link != null ?
        Padding(
          padding: EdgeInsets.only(
            top: 3.5
          ),
          child: RichText(
            text: TextSpan(
              style: Theme.of(context).primaryTextTheme.bodyText2.apply(
                fontSizeDelta: -2,
                color: Theme.of(context).primaryColor,
              ),
              recognizer: TapGestureRecognizer()
              ..onTap = () async{
                if(await canLaunch(link)){
                  launch(link,
                    forceSafariVC: false,
                    forceWebView: false
                  );
                }
              },
              text: link,
            ),
          ),
        ) : Container(),

        Padding(
          padding: EdgeInsets.only(
            top: 15
          ),
          child: RichText(
            text: TextSpan(
              style: Theme.of(context).primaryTextTheme.bodyText2,
              text: desc
            ),
          ),
        ),
      ],
    );
  }
}