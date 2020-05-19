import 'package:sequences/Utils/Collections/DefaultConstantCollection.dart';
import 'package:sequences/Utils/Collections/SharedPreferencesConstantCollection.dart';
import 'package:sequences/Utils/Helpers/SharedPreferenceHelper.dart';

class UserStageModel{

  int currentStage = DefaultConstantCollection.instance.defautCurrentStage;

  retrieveCurrentStage() async{
    currentStage =  await SharedPreferenceHelper.instance.getInt(SharedPreferencesConstantCollection.instance.currentStage);
  }
  saveToStore() async{
    (await SharedPreferenceHelper.instance.pref()).setInt(SharedPreferencesConstantCollection.instance.currentStage, currentStage);
  }
}