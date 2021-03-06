import 'package:sequences/Utils/Collections/DefaultConstantCollection.dart';
import 'package:sequences/Utils/Collections/SharedPreferencesConstantCollection.dart';
import 'package:sequences/Utils/CommonUtils.dart';
import 'package:sequences/Utils/Helpers/SharedPreferenceHelper.dart';

class UserStageModel{

  int currentStage = DefaultConstantCollection.instance.defautCurrentStage;
  int hintCounter = 3;

  retrieveCurrentStage() async{
    currentStage =  await SharedPreferenceHelper.instance.getInt(SharedPreferencesConstantCollection.instance.currentStage, error: 1);
    CommonUtils.instance.showLog("current stage from retrieve : "+currentStage.toString());
  }
  saveToStore() async{
    (await SharedPreferenceHelper.instance.pref()).setInt(SharedPreferencesConstantCollection.instance.currentStage, currentStage);
  }

  goToNextStage(){
    if(currentStage <= DefaultConstantCollection.instance.totalStage){
      currentStage++;
    }
  }

  resetHintCount(){
    hintCounter = 3;
  }
}