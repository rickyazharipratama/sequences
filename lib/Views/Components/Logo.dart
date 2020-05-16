import 'package:flutter/material.dart';
import 'package:sequences/Utils/Collections/DefaultConstantCollection.dart';

class Logo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Theme.of(context).brightness == Brightness.dark ?
        "assets/images/logo-dark.png"
        : "assets/images/logo-light.png",

        alignment: Alignment.center,
        fit: BoxFit.fitHeight,
        height: DefaultConstantCollection.instance.defaultHeightLogo, 
    );
  }
}