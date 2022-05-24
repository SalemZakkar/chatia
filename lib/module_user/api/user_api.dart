
import 'dart:io';

import 'package:chatia/module_user/models/user_model.dart' as model;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UserApi {
  static Future<dynamic> signIn(model.User user) async {
    UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: user.email, password: user.password);
    return userCredential;
  }
  static Future<UserCredential> signUp(model.User user) async
  {
    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: user.email, password: user.password);
    userCredential.user?.updateDisplayName(user.username);
    return userCredential;
  }
  static Future changePhoto(File file) async {
  Reference ref = FirebaseStorage?.instance.ref();
  //await ref.child("/"+FirebaseAuth.instance.currentUser!.uid + "/" ).delete();
  await ref.child("/"+FirebaseAuth.instance.currentUser!.uid + "/").putFile(file);
  await FirebaseAuth.instance.currentUser?.updatePhotoURL(await ref.child(FirebaseAuth.instance.currentUser!.uid).getDownloadURL());
  }
  static Future deletePhoto() async {
    Reference ref = FirebaseStorage?.instance.ref();
    await ref.child(FirebaseAuth.instance.currentUser!.uid).delete();
    await FirebaseAuth.instance.currentUser?.updatePhotoURL(null);
  }
}