import 'dart:io';
import 'package:chatia/module_user/models/user_model.dart' as model;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UserApi {
  static Future<dynamic> signIn(model.User user) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: user.email, password: user.password);
    return userCredential;
  }

  static Future<UserCredential> signUp(model.User user) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: user.email, password: user.password);
    await userCredential.user?.updateDisplayName(user.username);
    return userCredential;
  }

  static Future changePhoto(File file) async {
    String ext = file.path.split(".").last;
    String uid = FirebaseAuth.instance.currentUser?.uid ?? "NO_ID";
    Reference ref = FirebaseStorage.instance.ref("/user/profile/" + uid);
    TaskSnapshot uploadTask = await ref.putFile(file);
    await FirebaseAuth.instance.currentUser
        ?.updatePhotoURL(await uploadTask.ref.getDownloadURL());
  }

  static Future deletePhoto() async {
    await FirebaseAuth.instance.currentUser?.updatePhotoURL(null);
  }
}
