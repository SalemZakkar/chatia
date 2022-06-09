import 'package:chatia/logs/messages.dart';
import 'package:chatia/module_chats/api/chat_api.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatRepo {
  static Stream<QuerySnapshot<Object?>> getUsersStream() {
    Messages.getData("Users Stream");
    return ChatApi.getUsersStream();
  }
}
