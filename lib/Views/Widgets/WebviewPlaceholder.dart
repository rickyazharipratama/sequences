import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

class WebviewPlaceholder extends SingleChildRenderObjectWidget{

  final ValueChanged<Rect> onRectChanged;

  WebviewPlaceholder({
    Key key,
    @required this.onRectChanged,
    Widget child
  }): super(key: key, child:child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return WebviewPlaceholderRender(
      onRectChanged: onRectChanged
    );
  }

  @override
  void updateRenderObject(BuildContext context, WebviewPlaceholderRender renderObject) {
    renderObject..onRectChanged = onRectChanged;

  }
}

class WebviewPlaceholderRender extends RenderProxyBox{
  ValueChanged<Rect> _callback;
  Rect _rect;
 
  Rect get rect => _rect;

  set onRectChanged(callback){
    if(_callback != callback){
      _callback = callback;
      notifyRect();
    }
  }

  WebviewPlaceholderRender({
    RenderBox child,
    ValueChanged<Rect> onRectChanged
  }): _callback = onRectChanged, super(child);

  notifyRect(){
    if(_callback != null && _rect != null){
      _callback(_rect);
    }
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    super.paint(context, offset);
    final rect = offset & size;
    if(_rect != rect){
      _rect = rect;
      notifyRect();
    }
  }
}