import 'dart:async';

import 'package:sequences/Models/ConfigurationModel.dart';
import 'package:sequences/Models/SoundSettingModel.dart';
import 'package:sequences/PresenterViews/Widgets/SettingsPresenterView.dart';
import 'package:sequences/Presenters/Base/BasePresenter.dart';
import 'package:sequences/Views/SequencesApp.dart';

class SettingsPresenter extends BasePresenter{


  final SettingsPresenterView view;

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
  void initiateData() async{
    super.initiateData();
    soundStream.listen(onSoundSettingChanged);
    musicStream.listen(onMusicSettingChanged);
    themeStream.listen(onThemeChanged);
    view.updateState(view.pageIsReady);
  }


  void onSoundSettingChanged(bool val){
    SequencesApp.of(view.currentContext()).presenter.onChangeSound(val);
  }

  void onMusicSettingChanged(bool val){
    SequencesApp.of(view.currentContext()).presenter.onChangeMusic(val);
  }

  void onThemeChanged(bool val) async{
    SequencesApp.of(view.currentContext()).presenter.onChangeTheme(val);
  }

  SoundSettingModel get sounds => SequencesApp.of(view.currentContext()).presenter.sounds;
  ConfigurationModel get config => SequencesApp.of(view.currentContext()).presenter.config;

  @override
  void destroyObject() {
    super.destroyObject();
    _soundStream.close();
    _musicStream.close();
    _themeStream.close();
  }
}