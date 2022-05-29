// ignore_for_file: unused_local_variable

import 'dart:io';

import 'package:chatia/constants/app_string.dart';
import 'package:chatia/logs/messages.dart';
import 'package:chatia/module_user/api/user_api.dart';
import 'package:chatia/module_user/models/user_model.dart' as model;
import 'package:chatia/module_user/storage/user_store.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {
  static Future<String> signIn(model.User user) async {
    try {
      Messages.signIn(user.email, user.password, "firebase");
      UserCredential userCredential = await UserApi.signIn(user);
      UserStore userStore = UserStore();
      await userStore.init();
      userStore.setUser(user);
      return AppStrings.success;
    } catch (e) {
      FirebaseAuthException firebaseAuthException = e as FirebaseAuthException;
      return firebaseAuthException.code;
    }
  }

  static Future<String> signInFromMemory() async {
    try {
      UserStore userStore = UserStore();
      await userStore.init();

      model.User? user = userStore.getUser();
      if (user == null) {
        return AppStrings.noData;
      } else {
        Messages.signIn(user.email, user.password, "firebase");
        UserCredential userCredential = await UserApi.signIn(user);
        return AppStrings.success;
      }
    } catch (e) {
      FirebaseAuthException f = e as FirebaseAuthException;
      return f.code;
    }
  }

  static Future<String> changePhoto(File file) async {
    try {
      await UserApi.changePhoto(file);
      return AppStrings.success;
    } catch (err) {
      return err.toString();
    }
  }

  static Future<String> signUp(model.User user) async {
    Messages.signUp(user.email, user.password, "Firebase");
    UserStore userStore = UserStore();
    await userStore.init();
    try {
      UserCredential userCredential = await UserApi.signUp(user);
      userStore.setUser(user);
      return AppStrings.success;
    } catch (e) {
      FirebaseAuthException ee = e as FirebaseAuthException;
      return ee.code;
    }
  }

  static Future<String> deletePhoto() async {
    try {
      await UserApi.deletePhoto();
      return AppStrings.success;
    } catch (e) {
      FirebaseAuthException ee = e as FirebaseAuthException;
      return ee.code;
    }
  }
}
