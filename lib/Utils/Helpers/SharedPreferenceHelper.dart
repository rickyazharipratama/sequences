import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper{

  static SharedPreferenceHelper instance = new SharedPreferenceHelper();

  Future<SharedPreferences> pref() async {
    return await SharedPreferences.getInstance();
  }

  Future<int> getInt(String key,{int error: -1}) async{
    try{
      int val =  (await pref()).getInt(key);
      if(val != null){
        return val;
      }
      return error;
    } on Exception{
       return error;
    }
  }

  Future<String> getString(String key,{String error})async{
    try{
      String val = (await pref()).getString(key);
      if(val != null){
        return val;
      }
      return error;
    } on Exception{
      return error;
    }
  }

  Future<bool> getBool(String key,{bool error : false}) async{
    try{
      bool val =  (await pref()).getBool(key);
      if(val != null){
        return val;
      }
      return error;
    }on Exception{
      return error;
    }
  }
  
  Future<double> getDouble(String key,{double error : -1}) async{
    try{
      double val = (await pref()).getDouble(key);
      if(val != null){
        return val;
      }
      return error;
    }on Exception{
      return error;
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