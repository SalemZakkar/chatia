import 'package:chatia/module_chats/ui/contacts/widgets/contact_card.dart';
import 'package:flutter/material.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({Key? key}) : super(key: key);

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
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
        itemBuilder: (context, index) => const ContactCard(),
        physics: const BouncingScrollPhysics(),
        itemCount: 20,
      ),
    );
  }
}
