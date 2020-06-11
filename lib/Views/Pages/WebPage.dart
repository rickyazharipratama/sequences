import 'package:flutter/material.dart';
import 'package:sequences/PresenterViews/Pages/WebPagePresenterView.dart';
import 'package:sequences/Utils/Collections/EnumCollections.dart';
import 'package:sequences/Views/Components/ImageButton.dart';
import 'package:sequences/Views/Pages/BasePage.dart';
import 'package:sequences/Views/Widgets/WebError.dart';
import 'package:sequences/Views/Widgets/WebviewPlaceholder.dart';

class WebPage extends StatefulWidget {

  final String title;
  final String url;

  WebPage({@required this.title, @required this.url});

  @override
  _WebPageState createState() => new _WebPageState();
}

class _WebPageState extends State<WebPage> with WebPagePresenterView{
  
  @override
  void initState() {
    super.initState();
    initiateWebview(widget.url);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        await destroyWeb();
        return true;
      },
      child: BasePage(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[

            Padding(
              padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).padding.top + 10, 10, 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: 10
                      ),
                      child: Text(
                        widget.title,
                        style: Theme.of(context).primaryTextTheme.bodyText1,
                      ),
                    )
                  ),
                  ImageButton(
                    image: "assets/images/close.png",
                    callback: () async{
                      await destroyWeb();
                      Navigator.of(context, rootNavigator: true).pop();
                    },
                    color: Theme.of(context).primaryTextTheme.bodyText1.color,
                    size: 25,
                  )
                ],
              ),
            ),

            Expanded(
              child: WebviewPlaceholder(
                onRectChanged: onRectChanged,
                child: Center(
                  child : state == PageStatus.error ? 
                    WebError()
                  : SizedBox(
                    width: 75,
                    height: 75,
                    child: CircularProgressIndicator(
                      backgroundColor: Theme.of(context).primaryColor,
                      strokeWidth: 2,
                    ),
                  )
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() async{
    super.dispose();
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