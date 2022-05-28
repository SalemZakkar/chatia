import 'package:chatia/module_user/api/user_api.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async{
  test("description", () async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: "mr.salem1.sz@gmail.com", password: "123456789");
    try{
      await UserApi.deletePhoto();
    }catch(e)
    {
      print(e.toString());
    }
  });
}