import 'package:dio/dio.dart';

class NetworkHelper{

  static NetworkHelper instance = NetworkHelper();

  Dio _connector;

  NetworkHelper(){
    _connector = Dio(BaseOptions(
      connectTimeout: 5000,
      receiveTimeout: 5000,
      receiveDataWhenStatusError: true
    ));
  }

  Future<bool> checkExternalRequest() async{
    try{
      Response res = await _connector.get("https://google.com");
      if(res != null){
        return true;
      }
    }catch(e){
      print("network error : "+e.toString());
      return false;
    }
    return false;
  }

}