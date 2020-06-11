import 'package:flutter/widgets.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:sequences/PresenterViews/Base/BasePresenterView.dart';
import 'package:sequences/Utils/Collections/EnumCollections.dart';

class WebPagePresenterView implements BasePresenterView{

  FlutterWebviewPlugin wv;
  PageStatus state = PageStatus.loading;

  Rect webRect = Rect.fromLTWH(0, 0, 0, 0);

  initiateWebview(String url){
    wv = FlutterWebviewPlugin()
    ..onStateChanged.listen(onWebStateChange)
    ..onHttpError.listen(onWebError);
    wv.launch(
      url,
      rect: webRect
    );
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

  onWebError(WebViewHttpError error){
    wv.resize(Rect.fromLTWH(0, 0, 0, 0));
    updateState(() {
      state = PageStatus.error;
    });
  }

  onRectChanged(Rect rct){
    webRect = rct;
  }

  destroyWeb() async{
    await wv?.close();
    wv.dispose();
  }
}