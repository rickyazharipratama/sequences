import 'package:flutter/widgets.dart';
import 'package:sequences/PresenterViews/Base/BasePresenterView.dart';
import 'package:sequences/Utils/CommonUtils.dart';

class AboutPagePresenterView implements BasePresenterView{

  PageController pageController;
  int activePage = 0;
  double pageOffset = 0;
  initiateController(){
    pageController = PageController(
      initialPage: activePage,
      keepPage: true,
    )..addListener(() {
      updateState(() { 
        CommonUtils.instance.showLog("page view page :"+pageController.page.toString());
        pageOffset = pageController.page;
      });
    });
  }

  onPageChanged(int page){
    activePage = page;
  }

  goTothirdLicense(){
    pageController.animateToPage(1, 
      duration: Duration(
        milliseconds: 500
      ),
      curve: Curves.ease
    );
  }

  goToAboutPage(){
    pageController.animateToPage(
      0, 
      duration: Duration(
        milliseconds: 500
      ), 
      curve: Curves.ease
    );
  }

  @override
  BuildContext currentContext() {
    throw UnimplementedError();
  }

  @override
  void updateState(callback) {

  }

}