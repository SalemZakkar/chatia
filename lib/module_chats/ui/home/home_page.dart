// ignore_for_file: unused_local_variable
import 'package:chatia/module_chats/ui/contacts/contacts_page.dart';
import 'package:chatia/app_router.dart';
import 'package:chatia/logs/messages.dart';
import 'package:chatia/module_chats/ui/contacts/group_page.dart';
import 'package:chatia/module_user/repository/user_repository.dart';
import 'package:flutter/material.dart';

import '../../../shared/widget/divider.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}




class _HomePageState extends State<HomePage>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  late TabController tabController;
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    Messages.printLifeCycle(state.toString(), AppRouter.home);
    if (state == AppLifecycleState.resumed) {
        UserRepository.setOnline();
    }else{
      UserRepository.logOut(fullLogout: false);
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance?.addObserver(this);
    UserRepository.setOnline();
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    WidgetsBinding.instance?.removeObserver(this);
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chats"),
       bottom: TabBar(
         controller: tabController,
         padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
         tabs: const [
           Tab(text: "Contacts", height: 35),
           Tab(
             text: "Groups",
             height: 35,
           )
         ],
         labelColor: Colors.white,
         unselectedLabelColor: themeData.textTheme.subtitle1?.color!,
         indicator: BoxDecoration(
           borderRadius: BorderRadius.circular(30),
           color: themeData.primaryColor,
         ),
       ),
       // toolbarHeight: 80,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, AppRouter.setting);
            },
          )
        ],
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        child: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: tabController,
          children: const [ContactsPage(), GroupsPage()],
        ),
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
