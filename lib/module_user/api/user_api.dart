import 'dart:io';

import 'package:chatia/module_user/models/user_model.dart' as model;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UserApi {
  static Future<dynamic> signIn(model.User user) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: user.email, password: user.password);
    String? uid = FirebaseAuth.instance.currentUser?.uid;
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(uid)
        .update({"online": true, "lastSeen": DateTime.now()});
    return userCredential;
  }

  static Future<UserCredential> signUp(model.User user) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: user.email, password: user.password);
    await userCredential.user?.updateDisplayName(user.username);
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    await firebaseFirestore
        .collection("Users")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .set(user.toJson());
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
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(uid)
        .update({"image": await uploadTask.ref.getDownloadURL()});
  }

  static Future deletePhoto() async {
    String uid = FirebaseAuth.instance.currentUser?.uid ?? "NO_ID";
    await FirebaseAuth.instance.currentUser?.updatePhotoURL(null);
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(uid)
        .update({"image": ""});
  }

  static Future logOut(bool flag) async {
    String? uid = FirebaseAuth.instance.currentUser?.uid;
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(uid ?? "s")
        .update({"lastSeen": DateTime.now(), "online": false}).timeout(
            const Duration(seconds: 10));
  }

  static Future setOnline() async {
    String? uid = FirebaseAuth.instance.currentUser?.uid;
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(uid)
        .update({"lastSeen": DateTime.now(), "online": true});
  }
}
