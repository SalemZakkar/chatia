import 'package:chatia/module_chats/ui/all_users/all_users_page.dart';
import 'package:chatia/module_chats/ui/home/home_page.dart';
import 'package:chatia/module_user/models/user_model.dart';
import 'package:chatia/module_user/storage/user_store.dart';
import 'package:chatia/module_user/ui/settings/settings_page.dart';
import 'package:chatia/module_user/ui/sign_in/sign_in_page.dart';
import 'package:chatia/module_user/ui/sign_up/sign_up_page.dart';
import 'package:chatia/welcome_page.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static const String welcome = "/welcome";
  static const String signUp = "/signUp";
  static const String signIn = "/signIn";
  static const String splash = "/splash";
  static const String home = "/home";
  static const String setting = "/settings";
  static const String allUsers = "/allUsers";

  static Future<String> firstRoute() async {
    UserStore userStore = UserStore();
    await userStore.init();
    User? user = userStore.getUser();
    if (user == null) return welcome;
    return home;
  }

  static Route? route(RouteSettings settings) {
    switch (settings.name) {
      case welcome:
        return MaterialPageRoute(builder: (context) => const WelcomePage());
      case signUp:
        return MaterialPageRoute(builder: (context) => const SignUpPage());
      case signIn:
        return MaterialPageRoute(builder: (context) => const SignInPage());
      case home:
        return MaterialPageRoute(builder: (context) => const HomePage());
      case setting:
        return MaterialPageRoute(builder: (context) => const SettingsPage());
      case allUsers:
        return MaterialPageRoute(builder: (context) => const AllUsersPage());
      default:
        return null;
    }
  }
}

String? firstRoute;
