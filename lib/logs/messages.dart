import 'dart:developer';

import 'package:chatia/constants/app_string.dart';
import 'package:flutter/cupertino.dart';

class Messages {
  static List<String> progress = [
    AppStrings.inProgress,
    AppStrings.success,
    AppStrings.error
  ];

  static void getData(String text) {
    debugPrint("Trying To Get Data --> ( " + text + " )");
  }

  static void getDataNormal(String text) {
    log("Get Data -----> " + text);
    log("-----------------------------------------------------------------");
  }

  static void execCodeInBackground(String service, int? i) {
    debugPrint("Exec Service " + service + " -----> " + progress[i ?? 0]);
    debugPrint(
        "-----------------------------------------------------------------");
  }

  static void errorGetData(String text, String error) {
    debugPrint(
        "Error Getting Data --> ( " + text + " )" + "\nError --> " + error);
  }

  static void successGetData(String text) {
    debugPrint("Success Getting Data --> ( " + text + " )");
  }

  static void logOut(String? state) {
    debugPrint("Log Out ------------------------------>" + (state ?? ""));
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

  static void signIn(String email, String password, String api) {
    debugPrint("Sign In -----------> " + api);
    debugPrint(email +
        "\n" +
        password +
        "\n" +
        "-------------------------------------------------------");
  }

  static void signUp(String email, String password, String api) {
    debugPrint("Sign Up -----------> " + api);
    debugPrint(email +
        "\n" +
        password +
        "\n" +
        "-------------------------------------------------------");
  }

  static void noNetwork(String need) {
    debugPrint("No NETWORK");
    debugPrint(need);
  }

  static void clear(String setting) {
    debugPrint("CLEARING ---------> " + setting);
  }

  static void setUserData(Map<String, dynamic> data, String api, int i,
      {String? error}) {
    debugPrint("Set User Data " + data.toString());
    debugPrint(api);
    debugPrint(progress[i]);
    debugPrint(error ?? "");
  }

  static void printLifeCycle(String state, String route) {
    debugPrint("----------------------------------------------------");
    debugPrint("App Life Cycle From Page" + route);
    debugPrint("is " + state);
    debugPrint("----------------------------------------------------");
  }
}
