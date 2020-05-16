import 'package:flutter/widgets.dart';

abstract class BasePresenterView{

  BuildContext currentContext() => null;
  void updateState(VoidCallback callback){}

}