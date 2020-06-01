import 'package:flutter/material.dart';
import 'package:sequences/Views/Components/LineSeparator.dart';
import 'package:sequences/Views/Components/TapToStart.dart';
import 'package:sequences/Views/Pages/BasePage.dart';

class CreditsPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return BasePage(
      child: GestureDetector(
          onTap: (){
            Navigator.of(context).pop();
          },
          child: Stack(
            children: <Widget>[

              Positioned.fill(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: Theme.of(context).backgroundColor,
                ),
              ),

              Positioned.fill(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 60),
                            child: Center(
                              child: Image.asset(
                                "assets/images/thanks-for-playing.png",
                                alignment: Alignment.center,
                                width: MediaQuery.of(context).size.width - 80,
                                fit: BoxFit.fitWidth,
                                color: Theme.of(context).primaryColor,
                              ),
                            )
                          ),

                          Expanded(
                            child: Container(),
                          ),

                          Padding(
                            padding: EdgeInsets.only(
                              top: 20,
                              left: 20,
                              right: 20,
                              bottom: 10
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  child: LineSeparator(),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 15
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    style: Theme.of(context).primaryTextTheme.bodyText2,
                                    text: " Presented By "
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    right: 15
                                  ),
                                ),
                                Expanded(
                                  child: LineSeparator(),
                                )
                              ],
                            ),
                          ),
                          
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: 20,
                              top: 20
                            ),
                            child: Center(
                              child: Image.asset(
                                "assets/images/coret-logo.png",
                                height: 75,
                                fit: BoxFit.fitHeight,
                                alignment: Alignment.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.fromLTRB(
                        10,
                        20,
                        10, 
                        MediaQuery.of(context).padding.bottom + 20),
                      child: Center(
                        child : TapToStart(
                          text: "Tap to exit"
                        )
                      ),
                    )
                  ],
                ),
              )
            ],
          )
      ),
    );
  }
}