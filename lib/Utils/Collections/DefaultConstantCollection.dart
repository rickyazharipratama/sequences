import 'package:sequences/Utils/Collections/EnumCollections.dart';

class DefaultConstantCollection{

  static DefaultConstantCollection instance = DefaultConstantCollection();

  FlavorEnvironment environment = FlavorEnvironment.debug;
  
  String version = "1.0.0";

  //STAGES
  int defautCurrentStage = 1;
  int totalStage = 90;

  double defaultSettingHeight = 400;

  double defaultHeightLogo = 75;
  double defaultWidthLogo = 100;

  //flag
  String mainMenuFlag = "mainMenu";


  //page
  String landingPage = "Landing_Page";
  String stagePage = "Stage_Page";
  String levelSelectPage = "Level_Select_Page";
  String creditPage = "Credit_Page";
  String privacyPolicy = "Privacy_Policy_Page";
  String maintenance = "Maintenance";
  

  //event
  String answerDuration = "Answer_Duration";
  String hintCount = "using_hint";
  String uncorrectAnswer = "uncorrect_answer";

  //admob
  String admobIdIOS = "ca-app-pub-5718875531666553~8715462450";
  String admobBannerIdIOS = "ca-app-pub-5718875531666553/6671753046";
  String admobRewardIOS = "ca-app-pub-5718875531666553/2729951687";

  String admobIdAndroid ="ca-app-pub-5718875531666553~2256977267";
  String admobBannerIdAndroid = "ca-app-pub-5718875531666553/6004650589";
  String admobRewardIdAndroid = "ca-app-pub-5718875531666553/3186915553";


  //Remote Config
  String get isMaintenance => environment == FlavorEnvironment.release ? "isMaintenance" : "isMaintenance";

  //dynamicLink
  String prefixDynamicLink = "https://sequences.page.link";
}