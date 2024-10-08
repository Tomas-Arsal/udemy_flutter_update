import 'package:shared_preferences/shared_preferences.dart';

class CashHelper {

  static late SharedPreferences _sharedPreferences;

  static Future<SharedPreferences> init() async {
    return _sharedPreferences = await SharedPreferences.getInstance();
  }
 static Future<bool> putBoolean ({
    required String key ,
   required bool value ,
}) async
 {
  return await  _sharedPreferences.setBool(key , value) ;
 }

  static  bool? getBoolean ({
    required String key ,
  })
  {
    return _sharedPreferences.getBool(key) ;
  }

}