import 'package:chatia/module_chats/ui/contacts/widgets/group_card.dart';
import 'package:flutter/material.dart';

class GroupsPage extends StatefulWidget {
  const GroupsPage({Key? key}) : super(key: key);

  @override
  State<GroupsPage> createState() => _GroupsPageState();
}

class _GroupsPageState extends State<GroupsPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData themeData = Theme.of(context);
    return Container(
        width: size.width,
        height: size.height,
        padding: const EdgeInsets.only(top: 30),
        color: themeData.scaffoldBackgroundColor,
        alignment: Alignment.topCenter,
        child: ListView.builder(
          itemBuilder: (context, index) => const GroupCard(),
          physics: const BouncingScrollPhysics(),
          itemCount: 20,
        ));
  }
}
