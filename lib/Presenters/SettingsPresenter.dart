import 'dart:async';

import 'package:sequences/Models/ConfigurationModel.dart';
import 'package:sequences/Models/SoundSettingModel.dart';
import 'package:sequences/PresenterViews/Widgets/SettingsPresenterView.dart';
import 'package:sequences/Presenters/Base/BasePresenter.dart';

class SettingsPresenter extends BasePresenter{


  final SettingsPresenterView view;
  SoundSettingModel sounds;
  ConfigurationModel config;

  StreamController<bool> _soundStream = StreamController();
  StreamController<bool> _musicStream = StreamController();
  StreamController<bool> _themeStream = StreamController();

  StreamSink get soundStreamSink => _soundStream.sink;
  Stream<bool> get soundStream => _soundStream.stream;

  StreamSink get musicStreamSink => _musicStream.sink;
  Stream<bool> get musicStream => _musicStream.stream;

  StreamSink get themeSink => _themeStream.sink;
  Stream<bool> get themeStream => _themeStream.stream;


  SettingsPresenter(this.view);

  @override
  void initiateData() {
    super.initiateData();
    
    sounds = SoundSettingModel()
    ..retieveSoundSetting()
    ..retrieveMusicSetting();
    
    config = ConfigurationModel()
    ..retrieveThemeConfiguration();
    
    soundStream.listen(onSoundSettingChanged);
    musicStream.listen(onMusicSettingChanged);
    view.updateState(() {});
  }


  void onSoundSettingChanged(bool val){
    sounds.setSoundActive = val;
    sounds.saveSoundSetting();
  }

  void onMusicSettingChanged(bool val){
    sounds.setMusicActive = val;
    sounds.saveMusicSetting();
  }

  @override
  void destroyObject() {
    super.destroyObject();
    _soundStream.close();
    _musicStream.close();
    _themeStream.close();
  }
}