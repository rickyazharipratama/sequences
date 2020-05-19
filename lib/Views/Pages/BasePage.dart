import 'package:flutter/material.dart';

class BasePage extends StatelessWidget {

  final Widget child;
  BasePage({@required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Builder(
        builder: (context) => child
      ),
    );
  }
}