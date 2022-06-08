import 'package:chatia/module_chats/api/chat_api.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatRepo {
  static Stream<QuerySnapshot<Object?>> openUsersStream() {
    return ChatApi.openUsersStream();
  }
}
