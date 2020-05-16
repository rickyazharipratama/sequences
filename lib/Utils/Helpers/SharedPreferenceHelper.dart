import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper{

  static SharedPreferenceHelper instance = new SharedPreferenceHelper();

  Future<SharedPreferences> pref() async {
    return await SharedPreferences.getInstance();
  }

  Future<int> getInt(String key) async{
    try{
      return (await pref()).getInt(key);
    } on Exception{
       return -1;
    }
  }

  Future<String> getString(String key)async{
    try{
      return (await pref()).getString(key);
    } on Exception{
      return null;
    }
  }

  Future<bool> getBool(String key,{bool error : false}) async{
    try{
      return (await pref()).getBool(key);
    }on Exception{
      return error;
    }
  }
  
  Future<double> getDouble(String key) async{
    try{
      return (await pref()).getDouble(key);
    }on Exception{
      return -1;
    }
  }

  Future<List<String>> getStringList(String key) async{
    try{
      return (await pref()).getStringList(key);
    }on Exception{
      return null;
    }
  }
}