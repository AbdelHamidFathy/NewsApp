
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? sharedPrefernces;

  static init()async{
   sharedPrefernces=await SharedPreferences.getInstance();
  }

  static Future<bool> putBoolean({
    required bool value, 
  })async{
    return await sharedPrefernces!.setBool('isDark', value);
  }

  static bool?  getBoolean(){
    return sharedPrefernces!.getBool('isDark');
  }
}