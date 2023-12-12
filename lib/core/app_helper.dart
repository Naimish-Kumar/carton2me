import 'package:shared_preferences/shared_preferences.dart';

class AppHelper {
  static String ACCESSTOKEN = "";
  static String userid = "";
  static String email = "";
  static String role = "";
  static String language = "";
  static String firstName = "";
  static String lastName = "";
  static String userAvatar = "";
  static String trainerId = "";
  static String phoneNumber = "";
  static String companyName = "";
  static String dateOfBirth = "";
}

class LocDb
 {
  LocDb._internal();
  static final LocDb _db = LocDb._internal();
  factory LocDb() {
    return _db;
  }
  bool loginapp = false;

 static Future<bool> isLoggedIn() async
   {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    AppHelper.ACCESSTOKEN = preferences.getString('token')!;
    AppHelper.userid = preferences.getString('userId')!;
    AppHelper.email = preferences.getString('email')!;
    AppHelper.firstName = preferences.getString('firstName')!;
    AppHelper.lastName = preferences.getString('lastName')!;
    AppHelper.userAvatar = preferences.getString('userAvatar')!;
    AppHelper.phoneNumber = preferences.getString('phoneNumber')!;
    AppHelper.companyName = preferences.getString('companyName')!;
    AppHelper.dateOfBirth = preferences.getString('dateOfBirth')!;

    if (AppHelper.ACCESSTOKEN.isNotEmpty)
     {
      return true;
    } else {
      return false;
    }
  }
}
