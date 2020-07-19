//
//import 'package:flutter/services.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//
//class SharedPrefKeys {
//  static final String name="name";
//  static final String email="email";
//  static final String userId="userId";
//  static final String isEmployer="isEmployer";
//
//  static Future<int> getUSerId() async {
//    final pref=await SharedPreferences.getInstance();
//
//    return pref.getInt(userId);
//  }
//
//  static Future<bool> isTypeEmployer() async {
//    final pref=await SharedPreferences.getInstance();
//
//    return pref.getBool(isEmployer);
//  }
//
//  static Future logout() async {
//    final pref=await SharedPreferences.getInstance();
//
//    pref.remove(isEmployer);
//    pref.remove(userId);
//    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
//  }
//}
