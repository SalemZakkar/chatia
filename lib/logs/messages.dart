import 'package:flutter/cupertino.dart';

class Messages {
  static void getData(String text) {
    debugPrint("Trying To Get Data --> ( " + text + " )");
  }

  static void errorGetData(String text, String error) {
    debugPrint(
        "Error Getting Data --> ( " + text + " )" + "\nError --> " + error);
  }

  static void successGetData(String text) {
    debugPrint("Success Getting Data --> ( " + text + " )");
  }

  static void setSettingSharedPreference(String text, List<String> options) {
    debugPrint("Setting Options Shared Preferences --> ( " + text + " )");
    debugPrint(options.toString());
  }

  static void getSettingSharedPreferences(String text, List<String> options) {
    debugPrint("Getting Options Shared Preferences --> ( " + text + " )");
    debugPrint(options.toString());
  }

  static void setTheme(String text) {
    debugPrint("Set Theme --> ( " + text + " )");
  }
}