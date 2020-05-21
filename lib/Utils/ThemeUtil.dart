import 'package:flutter/material.dart';

class ThemeUtil{

  static ThemeUtil instance = new ThemeUtil();


  ThemeData lightTheme = ThemeData(
    brightness:  Brightness.light,
    //primary color
    primaryColor: Color(0xff06D6A0),
    //page color
    backgroundColor: Color(0xffFAFAFA),
    // primary button color
    buttonColor: Color(0xff06D6A0),
    // line color
    canvasColor: Color(0xffDCDCDC),
    //lock icon color
    cardColor: Color(0xff969FAA),
    //red color
    errorColor: Color(0xffF95F62),
    //hint
    hintColor: Color(0xffF8CD85),
    //switcher off
    disabledColor: Color(0xFFdcdcdc),
    //switcher on
    focusColor: Color(0xffffffff),
    //elevationColor
    dividerColor: Color(0x77000000),
    primaryTextTheme: TextTheme(
      //text or
      bodyText2: TextStyle(
        color: Color(0xff7A8290),
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      //numbers, and riddle
      bodyText1: TextStyle(
        color: Color(0xff3C4245),
        fontSize: 28,
        fontWeight: FontWeight.w500
      ),
      //primary button
      button: TextStyle(
        color: Color(0xffffffff),
        fontSize: 14,
        fontWeight: FontWeight.w700
      ),
      //secondary button
      headline4: TextStyle(
        color: Color(0xff06D6A0),
        fontSize: 16,
        fontWeight: FontWeight.w700
      ),
      subtitle1: TextStyle(
        color: Color(0xff7A8290),
        fontSize: 18,
        fontWeight: FontWeight.w500
      )
    ),
  );



  ThemeData darkTheme = ThemeData(
    brightness:  Brightness.dark,
    //primary color
    primaryColor: Color(0xff06D6A0),
    //page color
    backgroundColor: Color(0xff353535),
    // primary button color
    buttonColor: Color(0xff06D6A0),
    // line color
    canvasColor: Color(0xff515151),
    //lock icon color
    cardColor: Color(0xff969FAA),
    //red color
    errorColor: Color(0xffF95F62),
    //hint
    hintColor: Color(0xffF8CD85),
    //switcher off
    disabledColor: Color(0xFFdcdcdc),
    //switcher on
    focusColor: Color(0xffffffff),
    //elevationColor
    dividerColor: Color(0x77000000),
    primaryTextTheme: TextTheme(
      //text or
      bodyText2: TextStyle(
        color: Color(0xff6A6A6A),
        fontSize: 50,
        fontWeight: FontWeight.w500,
      ),
      //numbers, and riddle
      bodyText1: TextStyle(
        color: Color(0xffBDCFD4),
        fontSize: 28,
        fontWeight: FontWeight.w500
      ),
      //primary button
      button: TextStyle(
        color: Color(0xffffffff),
        fontSize: 14,
        fontWeight: FontWeight.w700
      ),
      //secondary button
      headline4: TextStyle(
        color: Color(0xff06D6A0),
        fontSize: 16,
        fontWeight: FontWeight.w700
      ),
      subtitle1: TextStyle(
        color: Color(0xff6A6A6A),
        fontSize: 18,
        fontWeight: FontWeight.w500
      )
    )
  );
}