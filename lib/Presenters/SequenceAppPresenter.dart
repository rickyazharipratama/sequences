import 'package:sequences/Models/ConfigurationModel.dart';
import 'package:sequences/Models/SoundSettingModel.dart';
import 'package:sequences/PresenterViews/SequenceAppPresenterView.dart';
import 'package:sequences/Presenters/Base/BasePresenter.dart';

class SequenceAppPresenter extends BasePresenter{

  final SequenceAppPresenterView view;

  ConfigurationModel config = ConfigurationModel();
  SoundSettingModel sounds = SoundSettingModel();

  SequenceAppPresenter({this.view});

  @override
  void initiateData() async{
    super.initiateData();
    await sounds.retieveSoundSetting();
    await sounds.retrieveMusicSetting();
    await config.retrieveThemeConfiguration();
    view.updateState((){
      view.makeStateReady();
    });
  }

  void onChangeMusic(bool val) async{
    await sounds.saveMusicSetting(val);
  }
  
  void onChangeSound(bool val) async{
    await sounds.saveSoundSetting(val);
  }

  void onChangeTheme(bool val) async{
    config.setDarkTheme = val;
    await config.setThemeConfiguration();
    view.updateState(() {});
  }
}