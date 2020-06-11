import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class SecondaryLoadingButton extends StatelessWidget {

  final Color color;
  SecondaryLoadingButton({@required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:  Colors.transparent,
        border: Border.all(
          color: color ?? Theme.of(context).primaryColor,
          width: 2
        ),
        borderRadius: BorderRadius.circular(5)
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 0
      ),
      child: Center(
        child: SizedBox(
          height: 50,
          width: 50,
          child: LoadingIndicator(
            indicatorType: Indicator.pacman,
            color: color ?? Theme.of(context).primaryColor,
          ),
        )
      ),
    );
  }
}