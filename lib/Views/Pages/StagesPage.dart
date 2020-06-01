import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:sequences/PresenterViews/Pages/StagesPagePresenterView.dart';
import 'package:sequences/Presenters/Pages/StagesPagePresenter.dart';
import 'package:sequences/Utils/Collections/DefaultConstantCollection.dart';
import 'package:sequences/Utils/Collections/EnumCollections.dart';
import 'package:sequences/Utils/CommonUtils.dart';
import 'package:sequences/Views/Components/ImageButton.dart';
import 'package:sequences/Views/Pages/BasePage.dart';
import 'package:sequences/Views/Widgets/SequenceQuestionField.dart';
import 'package:sequences/Views/Widgets/SequencesKeyboard.dart';
import 'package:sequences/Views/Widgets/Settings.dart';

class StagesPage extends StatefulWidget {

  final bool isContinue;
  final int spesificStage;

  StagesPage.toContinue({this.isContinue = true, this.spesificStage : -1});
  StagesPage.resetGame({this.isContinue = false, this.spesificStage : -1});

  @override
  _StagesPageState createState() => new _StagesPageState();
}

class _StagesPageState extends State<StagesPage> with StagesPagePresenterView{

  StagesPagePresenter presenter;


  @override
  void initState() {
    super.initState();
    presenter = StagesPagePresenter(
      view: this,
      fromStage: widget.spesificStage,
      isContinue: widget.isContinue
    )..initiateData();
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
          onWillPop: willPop,
          child: BasePage(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Stack(
                    children: <Widget>[
                      //main content
                      Positioned.fill(
                        child: SequenceQuestionField(
                          shaker: presenter.shakerStream,
                          question: presenter.seq,
                        ),
                      ),

                      Positioned(
                        top: MediaQuery.of(context).padding.top + 5,
                        right: 10,
                        left: 10,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[

                            Expanded(
                              child: AdmobBanner(
                                key: GlobalKey(),
                                adSize: AdmobBannerSize.BANNER,
                                adUnitId: CommonUtils.instance.getAdmobBannerId(),
                                listener: (event,__){
                                  print("banner admob event : "+event.toString());
                                },
                                
                              )
                            ),

                            Padding(
                              padding: EdgeInsets.only(
                                right: 15
                              ),
                            ),

                            ImageButton(
                              callback: () async{
                                print("show setting dialog");
                                SettingList res = await showModalBottomSheet(
                                  context: context, 
                                  builder: (context) => Settings(
                                    isNeedMainMenu: true,
                                  ));
                                CommonUtils.instance.settingPopChoice(context,
                                  choice: res
                                );
                              },
                              image: "assets/images/gear.png",
                            ),

                          ],
                        )
                      ),
                    ]
                  ), 
                ),

                Padding(
                  padding : EdgeInsets.only(
                    bottom: MediaQuery.of(context).padding.bottom,
                  ),
                  child: SequencesKeyboard(
                    keys: presenter.keys,
                  ),
                ),
              ],
            )
          ),
    );
  }

  @override
  BuildContext currentContext() {
    return context;
  }

  @override
  void updateState(callback) {
    super.updateState(callback);
    setState(callback);
  }

  @override
  void dispose() {
    super.dispose();
  }
}