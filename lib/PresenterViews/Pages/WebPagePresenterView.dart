import 'package:flutter/widgets.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:sequences/PresenterViews/Base/BasePresenterView.dart';
import 'package:sequences/Utils/Collections/EnumCollections.dart';
import 'package:url_launcher/url_launcher.dart';

class WebPagePresenterView implements BasePresenterView{

  FlutterWebviewPlugin wv;
  PageStatus state = PageStatus.loading;
  Rect webRect = Rect.fromLTWH(0, 0, 0, 0);

  initiateWebview(String url) async{
    if(await canLaunch(url)){
      wv = FlutterWebviewPlugin()
      ..onStateChanged.listen(onWebStateChange);
      wv.launch(
        url,
        rect: webRect
      );
    }else{
      updateState(() {
        state = PageStatus.error;
      });
    }
  }

  @override
  BuildContext currentContext() {
    throw UnimplementedError();
  }

  @override
  void updateState(callback) {

  }

  onWebStateChange(WebViewStateChanged event){
    if(event.type == WebViewState.finishLoad){
      wv.resize(webRect);
    }else if(event.type == WebViewState.startLoad){
      wv.resize(Rect.fromLTWH(0, 0, 0, 0));
      updateState(() {
        state = PageStatus.loading;
      });
    }
  }

  onRectChanged(Rect rct){
    webRect = rct;
  }

  destroyWeb() async{
    await wv?.close();
    wv.dispose();
  }
}