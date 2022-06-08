// ignore_for_file: unused_local_variable

import 'package:chatia/app_router.dart';
import 'package:chatia/logs/messages.dart';
import 'package:chatia/module_user/repository/user_repository.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    Messages.printLifeCycle(state.toString(), AppRouter.home);
    // TODO: implement didChangeAppLifecycleState
    if (state == AppLifecycleState.resumed) {
      UserRepository.setOnline();
    }
    else{
      await UserRepository.logOut(fullLogout: false);
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance?.addObserver(this);
    UserRepository.setOnline();
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chats"),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, AppRouter.setting);
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRouter.allUsers);
        },
        backgroundColor: themeData.primaryColor,
        child: const Icon(Icons.add),
      ),
    );
  }
}
