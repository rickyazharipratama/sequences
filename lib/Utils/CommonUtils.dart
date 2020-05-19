
import 'package:flutter/material.dart';

class CommonUtils{

  static CommonUtils instance = new CommonUtils();


  double getKeyboardSizeHeight(BuildContext context){
    return MediaQuery.of(context).size.width / 5;
  }

  double getIconKeyboardSize(double size){
    return (size)/ 3;
  }
}