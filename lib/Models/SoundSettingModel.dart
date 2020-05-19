import 'package:sequences/Utils/Collections/SharedPreferencesConstantCollection.dart';
import 'package:sequences/Utils/Helpers/SharedPreferenceHelper.dart';

class SoundSettingModel{

  bool _isSoundActive = true;
  bool _isMusicActive = true;

  
  bool get isSoundActive => _isSoundActive;
  set setSoundActive( bool val){ _isSoundActive = val;}

  bool get isMusicActive => _isMusicActive;
  set setMusicActive(bool val) => _isMusicActive;

  retieveSoundSetting() async{
    _isSoundActive =  await SharedPreferenceHelper.instance.getBool(SharedPreferencesConstantCollection.instance.isSoundActive, error: true);
  }
  retrieveMusicSetting() async{
    _isMusicActive = await SharedPreferenceHelper.instance.getBool(SharedPreferencesConstantCollection.instance.isMusicActive, error: true);
  }

  saveSoundSetting() async{
    (await SharedPreferenceHelper.instance.pref()).setBool(SharedPreferencesConstantCollection.instance.isSoundActive, _isSoundActive);
  }
  saveMusicSetting() async{
    (await SharedPreferenceHelper.instance.pref()).setBool(SharedPreferencesConstantCollection.instance.isMusicActive, _isMusicActive);
  }
}