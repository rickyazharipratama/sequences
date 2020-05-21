import 'package:sequences/Utils/Collections/SharedPreferencesConstantCollection.dart';
import 'package:sequences/Utils/Helpers/SharedPreferenceHelper.dart';

class SoundSettingModel{

  bool _isSoundActive;
  bool _isMusicActive;

  
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

  saveSoundSetting(bool val) async{
    _isSoundActive = val;
    print("sound before store =>"+_isSoundActive.toString());
    (await SharedPreferenceHelper.instance.pref()).setBool(SharedPreferencesConstantCollection.instance.isSoundActive, _isSoundActive);
  }
  
  saveMusicSetting(bool val) async{
    _isMusicActive = val;
    print("music before store =>"+_isMusicActive.toString());
    (await SharedPreferenceHelper.instance.pref()).setBool(SharedPreferencesConstantCollection.instance.isMusicActive, _isMusicActive);
  }
}