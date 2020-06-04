import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:sequences/Models/ConfigurationModel.dart';
import 'package:sequences/Models/SoundSettingModel.dart';
import 'package:sequences/PresenterViews/SequenceAppPresenterView.dart';
import 'package:sequences/Presenters/Base/BasePresenter.dart';
import 'package:sequences/Utils/Collections/EnumCollections.dart';
import 'package:sequences/Utils/Collections/SharedPreferencesConstantCollection.dart';
import 'package:sequences/Utils/Helpers/SharedPreferenceHelper.dart';

class SequenceAppPresenter extends BasePresenter{

  final SequenceAppPresenterView view;

  ConfigurationModel config = ConfigurationModel();
  SoundSettingModel sounds = SoundSettingModel();

  AudioCache musicSounds;
  AudioPlayer _musicPlayer;

  AudioCache sfxSounds;
  AudioPlayer _sfxPlayer;

  MusicState musicArea = MusicState.none;

  SequenceAppPresenter({this.view}){

    _musicPlayer = AudioPlayer(
      mode: PlayerMode.MEDIA_PLAYER
    );
    _musicPlayer.setVolume(.3);

    musicSounds = AudioCache(
      fixedPlayer: _musicPlayer,
      prefix: "sounds/"
    )..disableLog();

    _sfxPlayer = AudioPlayer(
      mode: PlayerMode.LOW_LATENCY
    )..setVolume(.25);

    sfxSounds = AudioCache(
      fixedPlayer: _sfxPlayer,
      prefix: "sounds/"
    )..disableLog();
  }

  @override
  void initiateData() async{
    super.initiateData();
    await sounds.retieveSoundSetting();
    await sounds.retrieveMusicSetting();
    await config.retrieveThemeConfiguration();
    await musicSounds.loadAll([
      "sequence-theme.mp3",
      "sequence-landing-page.mp3"
    ]);
    await sfxSounds.loadAll([
      "cobell.mp3"
    ]);
    view.updateState((){
      view.makeStateReady();
    });
  }

  void onChangeMusic(bool val) async{
    await sounds.saveMusicSetting(val);
    playMusicSound();
  }
  
  void onChangeSound(bool val) async{
    await sounds.saveSoundSetting(val);
  }

  void onChangeTheme(bool val) async{
    config.setDarkTheme = val;
    await config.setThemeConfiguration();
    view.updateState(() {});
  }

  void playMusicSound() async{
      if(sounds.isMusicActive){
        if(musicArea == MusicState.stage){
          await musicSounds.loop("sequence-theme.mp3");
        }else if(musicArea == MusicState.landingPage){
          await musicSounds.loop("sequence-landing-page.mp3");
        }else{
          stopMusicSound();
        }
      }else{
        stopMusicSound();
      }
    
  }

  void resumeMusicSound() async{
    if(sounds.isMusicActive){
      int pos = await SharedPreferenceHelper.instance.getInt(SharedPreferencesConstantCollection.instance.musicPosition , error: -1);
      print("music cursor pos : "+ pos.toString());
      if(pos > 0){
        await musicSounds.fixedPlayer.seek(Duration(milliseconds: pos));
      }
      await musicSounds.fixedPlayer.resume();
      
    }
  }

  void pauseMusicSound() async{
    if(sounds.isMusicActive){
      int pos = await musicSounds.fixedPlayer.getCurrentPosition();
      print("music pasu in pos : "+pos.toString());
      (await SharedPreferenceHelper.instance.pref()).setInt(SharedPreferencesConstantCollection.instance.musicPosition, pos);
      await musicSounds.fixedPlayer.pause();
    }
  }

  void stopMusicSound() async{
    print("stopping musing");
    await musicSounds.fixedPlayer.stop();
  }

  void releaseMusicSound() async{
    await musicSounds.fixedPlayer.release();
  }

  void clearSound(){
    releaseMusicSound();
    musicSounds.clearCache();
  }

  void playCoBell(){
    if(sounds.isSoundActive){
      sfxSounds.play("cobell.mp3");
    }
  }
}