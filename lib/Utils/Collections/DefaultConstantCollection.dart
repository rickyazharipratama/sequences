class DefaultConstantCollection{

  static DefaultConstantCollection instance = DefaultConstantCollection();

  
  String version = "1.0.0";

  //STAGES
  int defautCurrentStage = 1;
  int totalStage = 10;

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
  

  //event
  String answerDuration = "Answer_Duration";
  String hintCount = "using_hint";
  String uncorrectAnswer = "uncorrect_answer";
}