import 'package:sequences/Utils/Collections/SharedPreferencesConstantCollection.dart';
import 'package:sequences/Utils/Helpers/SharedPreferenceHelper.dart';

class ConfigurationModel{

  bool _isDarkTheme = false;

  bool get isDarkTheme => _isDarkTheme;
  set setDarkTheme(bool val){_isDarkTheme = val;}

  retrieveThemeConfiguration() async{
    _isDarkTheme = await SharedPreferenceHelper.instance.getBool(SharedPreferencesConstantCollection.instance.themeConfiguration, error: false);
  }

  setThemeConfiguration() async{
    (await SharedPreferenceHelper.instance.pref()).setBool(SharedPreferencesConstantCollection.instance.themeConfiguration, _isDarkTheme);
  }
}