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
    String uid = FirebaseAuth.instance.currentUser?.uid ?? "NO_ID";
    Reference ref = FirebaseStorage.instance.ref("/user/profile/" + uid);
    ref.storage.setMaxUploadRetryTime(const Duration(milliseconds: 1));
    TaskSnapshot uploadTask = await ref.putFile(file).catchError((onError) {
      ref = FirebaseStorage.instance.ref("/user/profile/" + uid);
      return Future.value(true);
    });
    await FirebaseAuth.instance.currentUser
        ?.updatePhotoURL(await uploadTask.ref.getDownloadURL());
  }

  static Future deletePhoto() async {
    await FirebaseAuth.instance.currentUser?.updatePhotoURL(null);
  }
}
