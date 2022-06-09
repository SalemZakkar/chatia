import 'package:chatia/module_chats/repository/chat_repository.dart';
import 'package:chatia/module_chats/ui/all_users/user_card.dart';
import 'package:chatia/module_user/models/user_model.dart';
import 'package:chatia/shared/widget/error_network.dart';
import 'package:chatia/shared/widget/loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';

class AllUsersPage extends StatefulWidget {
  const AllUsersPage({Key? key}) : super(key: key);

  @override
  State<AllUsersPage> createState() => _AllUsersPageState();
}

class _AllUsersPageState extends State<AllUsersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Users"),
        centerTitle: false,
        toolbarHeight: 80,
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        alignment: Alignment.center,
        //   padding: const EdgeInsets.all(20),
        child: StreamBuilder<QuerySnapshot>(
            stream: ChatRepo.getUsersStream(),
            builder: (context, snapshot) {
              if (snapshot.hasError ||
                  snapshot.connectionState == ConnectionState.none) {
                return const ErrorNetworkIcon();
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Loading();
              } else {
                List<User> users = [];

                for (QueryDocumentSnapshot doc in snapshot.data?.docs ?? []) {
                  User user = User.fromJson(doc.data() as Map<String, dynamic>);
                  if (auth.FirebaseAuth.instance.currentUser?.uid != doc.id) {
                    users.add(user);
                  }
                }
                return ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    return UserCard(
                      user: users[index],
                    );
                  },
                );
              }
            }),
      ),
    );
  }
}
