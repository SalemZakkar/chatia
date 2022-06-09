import 'package:cloud_firestore/cloud_firestore.dart';

class ChatApi {
  static String usersCollection = "Users";

  static Stream<QuerySnapshot<Object?>> getUsersStream() {
    return FirebaseFirestore.instance.collection(usersCollection).snapshots();
  }
}
