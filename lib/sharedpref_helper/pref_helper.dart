// import 'package:shared_preferences/shared_preferences.dart';

// class SharedPref {
//   static SharedPreferences? _preferences;
//   static SharedPref? instance;
//   static var TOKEN = "TOKEN";
//   static var APPLEEMAIL = "admin@admin.com";
//   static var EMAIL = "";
//   static var FIRSTNAME = "";
//   static var LASTNAME = "";
//   final Future<SharedPreferences> pref = SharedPreferences.getInstance();

//   static Future<String?> getAuthToken() async {
//     final SharedPreferences pref = await SharedPreferences.getInstance();

//     return pref.getString(TOKEN);
//   }

//   static Future<String?> getAppleEmail() async {
//     final SharedPreferences pref = await SharedPreferences.getInstance();

//     return pref.getString(APPLEEMAIL);
//   }

//   static Future<String?> getEmail() async {
//     final SharedPreferences pref = await SharedPreferences.getInstance();

//     return pref.getString(EMAIL);
//   }

//   static Future<String?> getFirstName() async {
//     final SharedPreferences pref = await SharedPreferences.getInstance();

//     return pref.getString(FIRSTNAME);
//   }

//   static Future<String?> getLastName() async {
//     final SharedPreferences pref = await SharedPreferences.getInstance();

//     return pref.getString(LASTNAME);
//   }

//   static Future<bool> setAuthToken(String value) async {
//     final SharedPreferences pref = await SharedPreferences.getInstance();

//     return pref.setString(TOKEN, value);
//   }

//   static Future<bool> setEmail(String value) async {
//     final SharedPreferences pref = await SharedPreferences.getInstance();

//     return pref.setString(EMAIL, value);
//   }

//   static Future<bool> setFirstName(String value) async {
//     final SharedPreferences pref = await SharedPreferences.getInstance();

//     return pref.setString(FIRSTNAME, value);
//   }

//   static Future<bool> setLastName(String value) async {
//     final SharedPreferences pref = await SharedPreferences.getInstance();

//     return pref.setString(LASTNAME, value);
//   }

//   static Future<bool> setAppleEmail(String value) async {
//     final SharedPreferences pref = await SharedPreferences.getInstance();

//     return pref.setString(APPLEEMAIL, value);
//   }

//   static Future<Future<bool>> clear() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();

//     return prefs.clear();
//   }
// }
